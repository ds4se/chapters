# Embrace dynamic artifacts

When we talk about data science in the context of software engineering, we often only consider static sources/artifacts such as source code, version history, bug reports, mailing lists, developer network, and organization structure.  Why don't we consider dynamic artifacts such as execution logs, crash/core dumps, call stack, and traffic logs?  I believe that we should.  If you agree with me, then you can skip this chapter.  If not, then read on and let me try to convince you.

## Can we minimize the USB driver test suite?

Here's an example from personal experience.

Before the USB device driver in Microsoft Windows is updated, USB driver is tested by using it with USB devices that exercise its behavior.  This form of testing is expensive as the number of unique USB devices is huge and, consequently, the effort required to identify, procure, and use the devices to test the driver is prohibitive.

As in situations that involve a very large population, Windows USB testing team uses a sample (test suite) of 1000+ USB devices to test the USB driver.  To ensure the sample is diverse and representative of both the population and prevalent usage of USB devices, the team uses expert knowledge to choose the sample.  Even so, there can be redundancy in such a sample as many devices may exercise the same behavior of the USB driver, e.g., devices may use the same ASIC (low-level circuitry) to implement the USB protocol, and such redundancy may elude even the experts.  Consequently, this can lead to wasted time and effort, which could be better utilized to test behaviors not exercised by devices in the sample.

Further, testing using 1000+ devices takes non-trivial amount of manual effort.  So, any elimination of redundancy would help expedite the test cycles.

Windows USB testing team described the above situation to my team and asked if we could help identify a subset of the test suite that would expose the same bugs as exposed by the entire test suite.  In other words, they wanted to _minimize their test suite preferably without affecting its bug coverage_.

### Yes, let's observe interactions

As a solution, we proposed a technique based on the interactions observed at the published interface of the USB driver when servicing devices.  After all, the goal was to test how the driver behaves under different inputs.  (The fact that we had recently used such interactions to test compatibility between USB drivers had no influence on this decision ;))

So, we combined an existing logging filter driver with existing device testing setup to log the interactions of the sample devices at the interface of USB driver.  Then, we [mined structural and temporal patterns][SCP12] from these logs and used the [patterns as features][DAPSE13] to cluster the devices.  In this clustering, we randomly picked representative devices from each cluster and used only the representatives to test the USB driver.  To protect against omission errors within clusters, in each test cycle, we picked different representatives from each cluster.  With this solution, the testing team was able to use only half the number of sample devices to uncover 75-80% of bug coverage.

### Why did our solution work?

The solution worked as _logs captured exactly what happened when devices interacted with the USB driver_, i.e., the exact inputs provided to the driver and the exact output provided back by the driver.

The exactness of the data automatically (and aggressively) eliminated numerous possibilities would have been considered in alternative solutions such as static analysis of the source code of device drivers.  Further, since the logs did not contain extraneous information, we did not have to clean the data.  (This may not be true in all cases involving dynamic artifacts.)  Also, we reduced the cost of data collection by reusing existing infrastructure to collect logs.  While we did not use the history of various data points in the logs, this information existed in the logs and it could have been used to reconstruct the context and help understand the how and why an interaction transpired.


## Still not convinced?  Here's more

In 2009, [DebugAdvisor][FSE09] effort proposed a recommendation system to help with debugging.  The idea was, when bugs are assigned to a developer, provide the developer with pointers to institutional knowledge relevant to expedite bug fixing.  In DebugAdvisor, dynamic artifacts such as stack traces, core dumps, and debugging logs complemented static artifacts such as bug repository and code/fix ownership to help identify similar bugs reported in the past.  The system was successfully piloted within the Windows serviceability group with 75% of the recommendations proving to be useful.

In 2010, [StackMine][ICSE12] system mined execution traces from Microsoft Windows to aid with performance debugging.  The idea relied on "correlating" patterns observed in call stacks from execution traces to identify potential performance hotspots.  This system helped identify performance bugs in Windows Explorer UI that were hidden in Windows 7 and even in previous versions of Windows.


## Dynamic artifacts are here to stay

An observation common thread to all of the above examples is that dynamic artifacts fueled the data analysis that resulted in effective solutions to software engineering problems.  Almost always, dynamic artifacts contained information that was either absent in or impossible to extract from static artifacts.  Further, most modern day software systems are either equipped with or run on top of platforms equipped with ability to collect dynamic data (in the form of logs).  Lastly, with the rise of cloud computing, we have the necessary computing power to plow through heaps of dynamic data.  So, it is time to consider _dynamic artifacts as data science worthy artifacts and use them whenever they are available._ 

Don't shy away from or throw away dynamic artifacts.  Learn to embrace them!


## Acknowledgements

The USB test suite minimization effort was carried out at Microsoft by Naren Datha, Robbie Harris, Aravind Navasivayam, Venkatesh-Prasad Ranganath, and Pradip Vallathol.


## References

[DAPSE13]: http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=6603808 "Structural and Temporal Patterns-Based Features by Venkatesh-Prasad Ranganath and Jithin Thomas.  International Workshop on Data Analysis Patterns in Software Engineering (DAPSE) 2013."

[FSE09]: http://research.microsoft.com/apps/pubs/default.aspx?id=101301 "DebugAdvisor: A Recommender System for Debugging by B. Ashok, Joseph Joy, Hongkang Liang, Sriram Rajamani, Gopal Srinivasa, and Vipindeep Vangala.  Foundations of Software Engineering (ESEC/FSE) 2009."

[ICSE12]: http://research.microsoft.com/en-us/groups/sa/stackmine_icse2012.pdf "Performance Debugging in the Large via Mining Millions of Stack Traces by Shi Han, Yingnong Dang, Song Ge, Dongmei Zhang, and Tao Xie.  International Conference on Software Engineering (ICSE) 2012."

[SCP12]: http://www.sciencedirect.com/science/article/pii/S0167642310001875 "Mining Quantified Temporal Rules: Formalism, Algorithms, and Evaluation by David Lo, G. Ramalingam, Venkatesh-Prasad Ranganath, and Kapil Vaswani.  Science of Computer Programming (SCP), Volume 77, Issue 6, 2012."

