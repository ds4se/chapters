#The need for data analysis patterns
##(in software engineering)

##The remedy metaphor

When you call a doctor, you would expect she comes with a handful set of remedies for your disease.  You would not be pleased to see her digging into a huge amount of clinical data while she makes a diagnosis and searches a solution for your problem neither  would you expect her to propose a cure based on your case alone.  The remedies she proposes are solutions to recurring problems that medical researchers identify by analysing data of patients with similar symptoms and medical history. Remedies are coded in a language that a doctor understands (e.g., they tell when and how to treat a patient) and lead to meaningful conclusions for patients with the same disease (e.g., they tell the probability the disease will be defeated and eventually with which consequences).  Once found, such solutions can be applied over and over again. With the repeated use of a solution, medical researchers can indeed gain knowledge on successes and failures of a remedy and provide meaningful conclusions to future patients thereafter.   

The remedy metaphor portrays what are data analysis patterns in empirical sciences.  First, a pattern is a coded solution of a recurring problem. When a problem occurs several times, we accumulate knowledge on the problem and its solutions. With this knowledge, we are able to code a solution in some sort of modelling language that increases its expressivity and capability of re-use.  Second, a pattern is equipped with a sort of measure of success of the solution it represents.  The solution and the measure result from the analysis of historical data and provide actionable insight for future cases.

Does it make sense to speak about patterns in modern software engineering?  The answer can only be yes.  Patterns are a form of re-use and re-use is one of the key principles in modern software engineering. Why is it?  Re-use is an instrument to  increase the economy  of development and prevent human errors in software development processes. In their milestone book, Erich Gamma, Richard Helm, Ralph Johnson and John Vlissides [Gamma et al., 1995] introduced (design) patterns as a way ''to reuse the experience instead of rediscovering it.''
Thus, patterns as a form of re-use  help build software engineering knowledge from experience.

Does it make sense to speak about patterns of data analysis in modern software engineering?  Definitely yes.  Data analysis patterns are ''remedies'' for recurring data analysis problems arisen during the conception, the development, the use of the software technology.  They are codified solutions  that lead to meaningful conclusions for software engineering stakeholders and can be reused for comparable data. In other words,  a data analysis pattern is a sort of model expressed in a language that logically describes a solution to a recurring data analysis problem in software engineering. They can possibly be automated. As such, data analysis patterns help  "rise from the drudgery of random action into the sphere of intentional design," [Pontus et al., 2012].

Why aren't they already diffusely used? The majority of us has the ingrained belief that  methods and results from individual software analysis pertain to the empirical context from which data has been collected. Thus, in almost every new study, we re-invent the data-analysis wheel. It is like we devised a new medical protocol for any new patient. Why is this? One of the reasons is related to software engineering data and the role it has gained over the years.

##Software engineering data
A large part of modern software engineering research builds new knowledge by analysing data of different types. To study distributed development processes, we analyse textual interactions among developers of open source communities and use social network, complex systems, or graph theories. If we instead want to predict if a new technology will take off in the IT market, we collect economic data and use the Roger's theory of diffusion of innovation. To understand the quality of modern software products, we mine code data and their evolution over versions. Sometimes, we also need to combine data of different nature collected from different sources and analysed with various statistical methods.

Thus, data types can be very different. Just to make few examples, data can be structured or unstructured (i.e., lines of code or free text in review comments and segments of videos), discrete or continuous (i.e., number of bugs in software or response time of web services), qualitative or quantitative (i.e., complexity of a software task and Cyclomatic code complexity), and subjective or objective (i.e., ease of use of a technology or number of back links to web sites). In addition, with the OSS phenomenon, cloud computing, and the Big Data era, data has become more distributed, big, and accessible, but also noisy, redundant, and incomplete. As such, researchers must have a good command over analysis instruments and a feel for the kinds of problems and data they apply to.

##Needs of data analysis patterns
The needs for instruments like data analysis patterns become more apparent when we want to introduce novices to the research field. In these circumstances, we encounter the following issues.


*Studies do not report entirely or sufficiently about their data analysis protocols.* This implies that analyses are biased or not verifiable. Consequently, secondary studies like mapping studies and systematic literature reviews that are mandated to synthesise published research lose their power. Data analysis patterns provide software engineers with a verifiable protocol to compare, unify, and extract knowledge form existing studies.

*Methods and data are not commonly shared.* It is a general custom to develop ad-hoc scripts and keep them private or use tools as black-box statistical machines. In either case, we cannot access to the statistical algorithm, verify, and re-use it. Data analysis patterns are packaged to be easily inspected, automatised, and shared.

*Tool-driven research has some known risks.* Anyone can easily download statistical tools from the Internet and perform sophisticated statical analyses. The Turing award winner Butler Lampson [Lampson, 1967] warns though: ''For one unfamiliar with the niceties of statistical analysis it is difficult to view with any feeling other than awe the elaborate edifice which the authors have erected to protect their data from the cutting winds of statistical insignificance.'' A catalogue of data analysis patterns helps guide researchers in the selection of appropriate analysis instruments.

*Analysis can be easily biased by the human factor.*  Reviewing  papers on machine learning for defect prediction, Martin Shepperd, David Bowes, Tracy Hall [Shepperd et al., 2014] analysed more than 600 samples from the highest quality studies on defect prediction to determine what factors influence predictive performance and find that ''it matters more who does the work than what is done.''
This incredible result urges the use of data analysis patterns to make a solution independent from the researchers who conceived it.

##Building remedies for data analysis in software engineering research
As in any research field, needs trigger opportunities and challenge researchers.  Today, we are called to synthesise our methods of analysis  [Johnson et al. 2012]  and a couple of examples of design patterns are already available [Russo, 2013]. We need more though. The scikit-learn initiative [http://scikit-learn.org/stable/index.html] can help software engineers in the case they need to solve problems with data mining, i.e. computational process of discovering patterns in data sets.
The project provides on-line access to a wide range of state-of-the-art tools for data analysis as codified solutions. Each solution comes with a short rationale of use, a handful set of algorithms implementing it, and a set of application examples. Fig. 1 illustrates   how we can find the right estimator for a machine learning problem.


![](ml_map.png)<br>
*Figure 1. Flowchart displaying different estimators and analysis path for a machine learning problem, source: http://scikit-learn.org/stable/tutorial/machine_learning_map/index.html

How can we import these or similar tools  in the software engineering context? We need first to identify the requirements for a data analysis pattern in software engineering.  

In our opinion, a  data analysis pattern shall be:
- A solution to a recurrent software engineering problem
- Re-usable in different software engineering contexts
- Automatable (e.g., by coding algorithms of data analysis in some programming language )
- Actionable (e.g., the scikit-learn tools)
- Successful at a certain degree (e.g., by representing state-of-the-art of data analysis in software engineering)

Then the key steps to construct such pattern will include but be not restricted to:
- Mining literature to extract candidate solutions
- Identifying a common language to express a solution in a form that software engineers can easily understand and re-use. For instance, we can think of annotated UML or algorithm notation expressing the logic of the analysis
- Defining a measure of success for a solution
- Validating the candidate solutions by replications and community surveys to achieve consensus in the research community.

Reflecting on the current situation, we also see the need to codify anti-patterns, i.e. what not to do in data analysis. Given the amount of evidence in our field, this must be a much easier task!

##References

Christian Bird, Tim Menzies, and Thomas Zimmermann:  1st international workshop on data analysis patterns in software engineering (DAPSE 2013), in Proceedings of the 2013 International Conference on Software Engineering (ICSE '13). IEEE Press, Piscataway, NJ, USA, 1517-1518, 2013 [DAPSE2013] (https://www.conference-publishing.com/list.php?Event=ICSEWS13DAPSE)

Lampson Butler: A Critique of An Exploratory Investigation of Programmer Performance Under On-Line and Off-Line Conditions, IEEE Trans. Human Factors in Electronics HFE-8, 1, 48-51, 1967

Erich Gamma, Richard Helm, Ralph Johnson and John Vlissides: Design Patterns: Elements of Reusable Object-Oriented Software, Addison-Wesley Longman Publishing Co., Inc., Boston, MA, USA, 1995

Pontus Johnson, Mathias Ekstedt, Ivar Jacobson: Where's the Theory for Software Engineering?, Software, IEEE , vol.29, no.5, 94-95,  2012

Barbara Russo: Parametric Classification over Multiple Samples, in Proceedings  of 2013 1st International Workshop on Data Analysis Patterns in Software Engineering (DAPSE), May 21, 2013, San Francisco, CA, USA , IEEE, 23-25, 2013 [article] (http://www.inf.unibz.it/~russo/Publications/icsews13dapse-id6-p-16144-preprint.pdf)

Martin Shepperd, David Bowes, Tracy Hall, Researcher Bias: The Use of Machine Learning in Software Defect Prediction, IEEE Trans. on Software Engineering, vol. 40, no. 6, 603-616,  2014
