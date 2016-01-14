# Software Analytics and Its Application in Practice

## Dongmei Zhang and Tao Xie

Various types of data naturally exist in the software development process, such as source code, bug reports, check-in histories, and test cases. As software services and mobile applications are widely available in the Internet era, a huge amount of program runtime data, e.g., traces, system events, and performance counters, as well as users’ usage data, e.g., usage logs, user surveys, online forum posts, blogs, and tweets, can be readily collected. 

Considering the increasing abundance and importance of data in the software domain,  **_software analytics_** [4,5] is to utilize data-driven approaches to enable software practitioners to perform data exploration and analysis in order to obtain insightful and actionable information for completing various tasks around software systems, software users, and software development process.

Software analytics has broad applications in real practice. For example, using a mechanism similar to Windows Error Reporting [6], Event Tracing for Windows (ETW) traces can be collected to achieve Windows performance debugging in the large [2]. Given limited time and resources, a major challenge is to identify and prioritize the performance issues using millions of callstack traces. Another example is data-driven quality management for online services [3]. When a live-site issue occurs, a major challenge is to help service-operation personnel utilize the humongous number of service logs and performance counters to quickly diagnose the issue and restore the service.

In this chapter, we discuss software analytics from six perspectives. We also share our experiences on putting software analytics into practice.

### Six perspectives of software analytics

The six perspectives of software analytics include research topics, target audience, input, output, technology pillars, and connection to practice. While the first four perspectives are easily accessible from the definition of software analytics, the last two need some elaboration. 

As stated in the definition, software analytics focuses on software systems, software users, and software development process. From the research point of view, these focuses constitute three *research topics* – software quality, user experience, and development productivity. As illustrated in the aforementioned examples, the variety of data *input* to software analytics is huge. Regarding the insightful and actionable *output*, it often requires well-designed and complex analytics techniques to create such output. It should be noted that the *target audience* of software analytics spans across a broad range of software practitioners, including developers, testers, program managers, product managers, operation engineers, usability engineers, UX designers, customer-support engineers, and management personnel, etc.

**_Technology Pillars_**. In general, primary technologies employed by software analytics include large-scale computing (to handle large-scale datasets), analysis algorithms in machine learning, data mining and pattern recognition, etc. (to analyze data), and information visualization (to help with analyzing data and presenting insights). While the software domain is called the vertical area in which software analytics focuses upon, these three technology areas are called the horizontal research areas. Quite often, in the vertical area, there are challenges that cannot be readily addressed using the existing technologies in one or more of the horizontal areas. Such challenges can open up new research opportunities in the corresponding horizontal areas.

**_Connection to Practice_**. Software analytics is naturally tied with practice, with four *real* elements. 

**Real data**. The data sources under study in software analytics come from real-world settings including both industrial proprietary settings and open source settings. For example, open-source communities provide a huge data vault of source code, bug history, and check-in information, etc.; and better yet, the vault is active and evolving, which makes the data sources fresh and live.

**Real problems**. There are various types of questions to be answered in practice using the rich software artifacts. For example, when a service system is down, how can service engineers quickly diagnose the problem and restore the service [3]? How to increase the MAU (Monthly Active Users) and DAU (Daily Active Users) based on the usage data?

**Real users**. The aforementioned target audience is the consumers of software analytics results, techniques, and tools. They are also a source of feedback for continuously improving and motivating software analytics research.

**Real tools**. Software artifacts are constantly changing. Getting actionable insights from such dynamic data sources is critical to completing many software related tasks. To accomplish so, software analytics tools are often deployed as part of software systems, enabling rich, reliable, and timely analyses requested by software practitioners.

### Experiences on Putting Software Analytics into Practice

The connection-to-practice nature opens up great opportunities for software analytics to make practice impact with focus on the *real* settings. Furthermore, there is huge potential for the impact to be broad and deep because software analytics spreads across the areas of system quality, user experience, and development productivity, etc.

Despite these opportunities, there are still significant challenges when putting software analytics technologies into real use. For example, how to ensure the output of the analysis results to be insightful and actionable? How do we know whether practitioners are concerned about the questions answered with the data? How do we evaluate our analysis techniques in real-world settings? Next we share some of our learnings from working on various software analytics projects [1, 2, 3, 5]. 

**Identifying essential problems**. Various types of data are incredibly rich in the software domain, and the scale of data is significantly large. It is often not difficult to grab some datasets, apply certain data analysis techniques, and obtain some observations. However, these observations, even with good evaluation results from the data-analysis perspective, may not be useful for accomplishing the target task of practitioners. It is important to first identify essential problems for accomplishing the target task in practice, and then obtain the right data sets suitable to help solve the problems. These essential problems are those solving which can substantially improve the overall effectiveness of tackling the task, such as improving software quality, user experience, and practitioner productivity.  

**Usable system built early to collect feedback**. It is an iterative process to create software analytics solutions to solve essential problems in practice. Therefore, it is much more effective to build a usable system early on in order to start the feedback loop with the software practitioners. The feedback is often valuable for formulating research problems and researching appropriate analysis algorithms. In addition, software analytics projects can benefit from early feedback in terms of building trust between researchers and practitioners, as well as enabling the evaluation of the results in real-world settings.     

**Using domain semantics for proper data preparation**. Software artifacts often carry semantics specific to the software domain; therefore, they cannot be simply treated as generic data such as text and sequences. For example, callstacks are sequences with program execution logic, and bug reports contain relational data and free text describing software defects, etc. Understanding the semantics of software artifacts is a prerequisite for analyzing the data later on. In the case of StackMine [2], there was a deep learning curve for us to understand the performance traces before we could conduct any analysis. 

In practice, understanding data is three-fold: data interpretation, data selection, and data filtering. To conduct data interpretation, researchers need to understand basic definitions of domain-specific terminologies and concepts. To conduct data selection, researchers need to understand the connections between the data and the problem being solved. To conduct data filtering, researchers need to understand defects and limitations of existing data to avoid incorrect inference. 

**Scalable and customizable solutions**. Due to the scale of data in the real-world settings, scalable analytic solutions are often required to solve essential problems in practice. In fact, scalability may directly impact the underlying analysis algorithms for problem solving. Customization is another common requirement to incorporate domain knowledge due to the variations of software and services. The effectiveness of solution customization in analytics tasks can be summarized as (1) filtering noisy and irrelevant data, (2) specifying between data points their intrinsic relationships that cannot be derived from the data itself, (3) providing empirical and heuristic guidance to make the algorithms robust against biased data. The procedure of solution customization can be typically conducted in an iterative fashion via close collaboration between software analytics researchers and practitioners.  

**Evaluation criteria tied with real tasks in practice.** Because of the natural connection with practice, software analytics projects should be (at least partly) evaluated using the real tasks that they are targeted to help with. Common evaluation criteria of data analysis, such as precision and recall, can be used to measure intermediate results. However, they are often not the only set of evaluation criteria when real tasks are involved. For example, in the StackMine project [3], we use the coverage of detected performance bottlenecks to evaluate our analysis results; such coverage is directly related to the analysis task of Windows analysts. When conducting evaluation in practice with practitioners involved, researchers need to be aware of and cautious about the evaluation cost and benefit incurred on practitioners.  

### References

[1] Y. Dang, D. Zhang, S. Ge, C. Chu, Y. Qiu, and Tao Xie. XIAO: Tuning Code Clones at Hands of Engineers in Practice. In Proc. ACSAC 2012, pages 369-378, 2012.

[2] S. Han, Y. Dang, S. Ge, D. Zhang, and T. Xie. Performance Debugging in the Large via Mining Millions of Stack Traces. In Proc. ICSE 2012, pages 145-155, 2012.

[3] J.-G. Lou, Q. Lin, R. Ding, Q. Fu, D. Zhang, and T. Xie. Software Analytics for Incident Management of Online Services: An Experience Report. In Proc. ASE 2013, Experience Papers, pages 475-485, 2013.

[4] D. Zhang, Y. Dang, J.-G. Lou, S. Han, H. Zhang, and T. Xie. Software Analytics as a Learning Case in Practice: Approaches and Experiences. In Proc. MALETS 2011, Pages 55-58, 2011.

[5] D. Zhang, S. Han, Y. Dang, J.-G. Lou, H. Zhang, and T. Xie. Software Analytics in Practice. IEEE Software, Special Issue on the Many Faces of Software Analytics, 30(5), pages 30-37, September/October 2013.

[6] K. Glerum, K. Kinshumann, S. Greenberg, G. Aul, V. Orgovan, G. Nichols, D. Grant, G. Loihle, and G. Hunt. Debugging in the (very) large: ten years of implementation and experience. In Proc. SOSP 2009, pages 103-116, 2009.






