# Software Analytics in Practice

## Dongmei Zhang and Tao Xie

Various types of data naturally exist in the software development process, such as source code, bug reports, check-in histories, and test cases. Analytics techniques have been used on these data sources to help understand software quality in the last few decades. In recent years, there are various examples of leveraging software artifacts to improve software engineering practices, such as software intelligence [4] and analytics for software development [1], both offering software engineers pertinent information to support their decision making in software engineering practices.

Considering the increasing abundance and importance of data in the software domain, software analytics is to expand the scope of previous work on analytics for software development [1] and on software intelligence [4]. In particular, **_software analytics_** [6,7] is to utilize data-driven approaches to enable software practitioners to perform data exploration and analysis in order to obtain insightful and actionable information for completing various tasks around software systems, software users, and software development process.

In this chapter, we discuss software analytics from six perspectives: research topics, target audience, input, output, technology pillars, and connection to practice. We also share our experiences on putting software analytics into practice.

### Research Topic

As stated in the definition, software analytics focuses on software systems, software users, and software development process, with the ultimate goal of helping improve software quality, user experience, and development productivity. Note that software development process involves software engineers (including but beyond software developers), and analytics on software development process intends to improve development productivity. User experience is positioned from the end-users’ perspective, whereas software quality focuses on issues such as reliability, performance, and security.

### Target Audience

While software engineering research mostly focuses on developers and testers, the target audience of software analytics spans across a broad range of software practitioners, including developers, testers, program managers, product managers, operation engineers, usability engineers, UX designers, customer support engineers, and management personnel, etc.

### Input

The input of software analytics projects includes various types of software artifacts. Program runtime traces, program logs, system events, and performance counters, etc. are data sources for studying software systems. Usage logs, user surveys, online forum posts, blogs, and tweets, etc. are data sources for analyzing the usage patterns and experiences of end users. Meanwhile, source code, bug history, check-in history, test cases, specifications, etc. are important sources for understanding issues and behaviors related to development productivity.

### Output

The output of software analytics projects is usually in the form of insights from software artifacts, i.e., *insightful* and *actionable* information, or analytic systems. Such analytic systems not only enable software practitioners to obtain insights from software artifacts, but also help software practitioners complete the target tasks. Examples of such tasks are identifying performance problems in thousands of performance traces [3, 5] and understanding the occurrences of a given feature in a software product [2].

*Insightful* information conveys meaningful and useful understanding or knowledge towards performing the target task. Typically, such insightful information cannot be easily obtained by direct investigation on the raw data without the aid of analytic technologies. 

*Actionable* information is information upon which software practitioners can come up with concrete solutions (better than existing solutions if any) towards completing the target task. For example, ranked performance bottlenecks represented by sequences of function calls narrow down the investigation scope of the underlying performance issues, and they also provide guidance on where the investigation effort should be spent [3]. Therefore, the ranked performance bottlenecks are both insightful and actionable.

### Technology Pillars

In general, primary technologies employed by software analytics include large-scale computing (to handle large-scale datasets), analysis algorithms in machine learning, data mining and pattern recognition, etc. (to analyze data), and information visualization (to help with analyzing data and presenting insights). While the software domain is called the vertical area in which software analytics focuses upon, these three technology areas are called the horizontal research areas. Quite often, in the vertical area, there are challenges that cannot be readily addressed using the existing technologies in one or more of the horizontal areas. Such challenges can open up new research opportunities in the corresponding horizontal areas.

### Connection to Practice

Software analytics is naturally tied with practice, with four *real* elements. 

**Real data**. The data sources under study in software analytics come from real-world settings including both industrial proprietary settings and open source settings. For example, open-source communities provide a huge data vault of source code, bug history, and check-in information, etc.; and better yet, the vault is active and evolving, which makes the data sources fresh and live.

**Real problems**. There are various types of questions to be answered in practice using the rich software artifacts. For example, when a service system is down, how can service engineers quickly diagnose the problem and restore the service [5]? How to increase the MAU (Monthly Active Users) and DAU (Daily Active Users) based on the usage data?

**Real users**. The aforementioned target audience is the consumers of software analytics results, techniques, and tools. They are also a source of feedback for continuously improving and motivating software analytics research.

**Real tools**. Software artifacts are constantly changing. Getting actionable insights from such dynamic data sources is critical to completing many software related tasks. To accomplish so, software analytics tools are often deployed as part of software systems, enabling rich, reliable, and timely analyses requested by software practitioners.

### Experiences on Putting Software Analytics into Practice

The connection-to-practice nature opens up great opportunities for software analytics to make practice impact with focus on the *real* settings. Furthermore, there is huge potential for the impact to be broad and deep because software analytics spreads across the areas of system quality, user experience, and development productivity, etc.

Despite these opportunities, there are still significant challenges when putting software analytics technologies into real use. For example, how to ensure the output of the analysis results to be insightful and actionable? How do we know whether practitioners are concerned about the questions answered with the data? How do we evaluate our analysis techniques in real-world settings? Next we share some of our learnings from working on various software analytics projects [2, 3, 5, 7]. 

**Identifying essential problems**. Various types of data are incredibly rich in the software domain, and the scale of data is significantly large. It is often not difficult to grab some datasets, apply certain data analysis techniques, and obtain some observations. However, these observations, even with good evaluation results from the data-analysis perspective, may not be useful for accomplishing the target task of practitioners. It is important to first identify essential problems for accomplishing the target task in practice, and then obtain the right data sets suitable to help solve the problems. These essential problems are those solving which can substantially improve the overall effectiveness of tackling the task, such as improving software quality, user experience, and practitioner productivity.  

**Usable system built early to collect feedback**. It is an iterative process to create software analytics solutions to solve essential problems in practice. Therefore, it is much more effective to build a usable system early on in order to start the feedback loop with the software practitioners. The feedback is often valuable for formulating research problems and researching appropriate analysis algorithms. In addition, software analytics projects can benefit from early feedback in terms of building trust between researchers and practitioners, as well as enabling the evaluation of the results in real-world settings.     

**Scalable and customizable solutions**. Due to the scale of data in the real-world settings, scalable analytic solutions are often required to solve essential problems in practice. In fact, scalability may directly impact the underlying analysis algorithms for problem solving. Customization is another common requirement to incorporate domain knowledge due to the variations of software and services. The effectiveness of solution customization in analytics tasks can be summarized as (1) filtering noisy and irrelevant data, (2) specifying between data points their intrinsic relationships that cannot be derived from the data itself, (3) providing empirical and heuristic guidance to make the algorithms robust against biased data. The procedure of solution customization can be typically conducted in an iterative fashion via close collaboration between software analytics researchers and practitioners.  

**Evaluation criteria tied with real tasks in practice.** Because of the natural connection with practice, software analytics projects should be (at least partly) evaluated using the real tasks that they are targeted to help with. Common evaluation criteria of data analysis, such as precision and recall, can be used to measure intermediate results. However, they are often not the only set of evaluation criteria when real tasks are involved. For example, in the StackMine project [3], we use the coverage of detected performance bottlenecks to evaluate our analysis results; such coverage is directly related to the analysis task of Windows analysts. When conducting evaluation in practice with practitioners involved, researchers need to be aware of and cautious about the evaluation cost and benefit incurred on practitioners.  

### References

[1] R. P.L. Buse, T. Zimmermann. Information Needs for Software Development Analytics. In Proc. ICSE 2012 SEIP Track, pages 987-996, 2012.

[2] Y. Dang, D. Zhang, S. Ge, C. Chu, Y. Qiu, and Tao Xie. XIAO: Tuning Code Clones at Hands of Engineers in Practice. In Proc. ACSAC 2012, pages 369-378, 2012.

[3] S. Han, Y. Dang, S. Ge, D. Zhang, and T. Xie. Performance Debugging in the Large via Mining Millions of Stack Traces. In Proc. ICSE 2012, pages 145-155, 2012.

[4] A. E. Hassan and T. Xie. Software Intelligence: Future of Mining Software Engineering Data. In Proc. FSE/SDP FoSER 2010, pages 161-166, 2010.

[5] J.-G. Lou, Q. Lin, R. Ding, Q. Fu, D. Zhang, and T. Xie. Software Analytics for Incident Management of Online Services: An Experience Report. In Proc. ASE 2013, Experience Papers, pages 475-485, 2013.

[6] D. Zhang, Y. Dang, J.-G. Lou, S. Han, H. Zhang, and T. Xie. Software Analytics as a Learning Case in Practice: Approaches and Experiences. In Proc. MALETS 2011, Pages 55-58, 2011.

[7] D. Zhang, S. Han, Y. Dang, J.-G. Lou, H. Zhang, and T. Xie. Software Analytics in Practice. IEEE Software, Special Issue on the Many Faces of Software Analytics, 30(5), pages 30-37, September/October 2013.





