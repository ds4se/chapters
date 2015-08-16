# While models are good, simple explanations are better

I am pretty sure you have heard the phrase _Keep It Simple, Stupid (KISS)_.  Even so, I am certain that you have been reminded about it time and again because simple varies with contexts.  Here is my encounter with an incarnation of KISS while using data mining for software engineering.


## How do we compare USB2 driver to USB3 driver?

During the development Windows 8, the USB team responsible for USB driver in Windows had the option of extending the USB driver in Windows 7 (which we will refer to as USB2 driver) to support USB3 protocol.  Instead, they decided to implement a new USB driver (which we will refer to USB3 driver) that supported all three versions of USB protocol.  Since USB2 was time-tested on previous versions of Windows, USB team decided to ship both USB2 and USB3 drivers with USB2 driver servicing devices on USB2 port and USB3 driver servicing devices on USB3 port.

The success of the USB3 driver depended on supporting the following use-case: _when a user plugs in a USB2 device into a USB3 port on Windows 8, the user experience should be similar to that of the device plugged into a USB2 port on Windows 8_.  In other words, _when servicing a USB2 device, the behavior of USB3 driver should be similar to that of USB2 driver_.  Since USB3 driver did not share any code with USB2 driver, this problem amounted to ensuring/checking behavioral similarity between programs at well-defined external interfaces.

Around this time, my team was working on [mining structural and temporal patterns][SCP12] and we were introduced to the above problem.  After some discussions, the USB team suggested that it might suffice to compare USB2 and USB3 drivers in terms of the traffic patterns observed at their external interfaces when servicing the same device.  So, all we needed to do was to mine patterns from the traffic logs and compare the mined patterns.


## The issue with our initial approach

After configuring the pattern mining algorithms to process USB driver traffic logs, we used them to mine patterns that took one of the following forms: 1) a conjunctive propositional predicate (e.g., `method=="fopen" && path=="passwd.txt" && mode=="r"` identifies satisfying events in the log) or 2) two conjunctive propositional predicates linked by a simple temporal operator (e.g., `(method=="fopen" && path=="passwd.txt" && return=="0x1234") followed by (method=="fclose" && file_handle=="0x1234")` identifies two events that satisfy the predicates and in the order imposed by the temporal operator).  The algorithms associated the mined patterns with numeric measures of significance such as _support_ and _confidence_.

To compare the patterns mined from a pair of traffic logs, we mulled over how to rank patterns present in both logs and patterns unique to each log.  We experimented with various thresholds of the difference between measures of a pattern common to both logs.  We pondered over the order in which to consider the measures when comparing common patterns.  Finally, we settled on some thresholds and presented our findings to the USB team.

While [patterns-based comparison of logs][ASE14] helped the USB team to identify instances of different traffic patterns exhibited by USB2 and USB3 drivers, the instances did not make immediate sense as _the reasons for the instances were not apparent_ (due to the seemingly ad-hoc choice of various ranking orders and thresholds.)  Consequently, the developer could not easily identify the interesting instances that required further exploration; hence, the solution could not be used in its current state.


## "Just tell us what is different and nothing more"

At this point, we asked the USB team "How could we improve the results?"  They said "just tell us what is the different and nothing more."  They suggested that we just identify 

1. _patterns common to USB2 driver that are not exhibited by USB3 driver_ and 
2. _patterns uncommon to USB2 driver but exhibited by USB3 driver_.

In other words, given a set of USB2 devices, (1) amounted to identifying patterns observed with every USB2 device and USB2 driver but not observed with a USB2 device and USB3 driver and (2) amounted to identifying patterns observed with a USB2 device and USB3 driver but not exhibited by any USB2 device and USB2 driver.

This suggestion discarded all the information about measures of significance and simplified the solution to identify differences.  The differing patterns identified with this suggestion had a simple explanation -- _absence of common patterns and presence of uncommon patterns_.  Obviously, this sort of result was easy to process and quickly identify the differences to explore further.  Consequently, the USB team was happy with resulting solution and used it to quickly identify behavioral differences between USB2 and USB3 drivers that needed triaging.


## Looking back

When we started our effort to help the USB team, we incorrectly assumed all information in the model of the system (i.e., the set of mined patterns along with various measures of significance) generated by our approach was important.  This might have been due to various reasons such as our lack of expertise in USB, our past success in using all information, or our lack of understanding of the problem.  Independent of the reasons and the complexity of the underlying model, _we were excited by and interested in detailed models while our customers, the USB team members, were interested in simple explanations of observations that could help them with quick project planning decisions_.

Time and again, I have heard similar arguments in discussions about the sort of machine learning techniques to use -- support vector machines provide highly accurate but hard to interpret/explain models while simple regression provides easy to interpret/explain but possibly less accurate models.  In a way, the above experience provides better perspective for these arguments.

For example, consider a linear regression model can explain both the polarity (i.e., positive or negative) and magnitude of influence of independent variables (factors) on the dependent variable (outcome).  All of the information in the model is not relevant to a user who is only interested to know if the effect of the factors on the outcome is linear.  Similarly, the magnitude of influence is irrelevant to a user who is only interested in identifying the factors that negatively affect the outcome.


## Users prefer simple explanations

To summarize, when using data science for software engineering (and possibly other purposes), keep in mind that _users are interested in simple explanations (of course, backed by robust and detailed models) of the observed phenomenon that can help them make good and quick decisions._  

This insight has proved to be rather useful in my subsequent flings with data analyis.  Now, I hope you too will consider this insight in your next data science excursion and either be more effective or challenge the insight :)


## References

[ASE14]: http://dl.acm.org/citation.cfm?id=2642942&CFID=527822378&CFTOKEN=34072062 "Compatibility Testing via Patterns-based Trace Comparison by Venkatesh-Prasad Ranganath, Pradip Vallathol, and Pankaj Gupta.  International Conference on Automated Software Engineering (ASE) 2014."

[DAPSE13]: http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=6603808 "Structural and Temporal Patterns-Based Features by Venkatesh-Prasad Ranganath and Jithin Thomas.  International Workshop on Data Analysis Patterns in Software Engineering (DAPSE) 2013."

[SCP12]: http://www.sciencedirect.com/science/article/pii/S0167642310001875 "Mining Quantified Temporal Rules: Formalism, Algorithms, and Evaluation by David Lo, G. Ramalingam, Venkatesh-Prasad Ranganath, and Kapil Vaswani.  Science of Computer Programming (SCP), Volume 77, Issue 6, 2012."
