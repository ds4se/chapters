#Combining Quantitative and Qualitative Methods (In Mining Software Repository Research)

## We have solid empirical evidence!
Empirical research in software engineering has gained maturity and diffusion over the last 10 years. In general, researchers have a deeper knowledge of empirical methods; also, guidelines and lessons learned are available in books (*e.g.,* Wohlin *et al.*, 2000) and tutorials (*e.g.,* the [PASED](http://pased.soccerlab.polymtl.ca) school). In addition, there is the availability of a large amount of data from various kinds of software repositories, as well as techniques to mine them, *e.g.,* for tracing data from heterogeneous sources, summarizing changes, or mining unstructured and semi-structured data sources.

In summary, we have methods and data to clearly assess the performance of our new recommender system, and we can show for instance that:

* By using a combination of Chidamber & Kemerer metrics we can predict defect-prone classes;
* Our new code smell detector achieves 90% precision and 60% recall;
* Developers are significantly more productive when using our code example recommender integrated in the IDE than when searching for suggestions on the Web.

Hopefully, all the above findings can be useful to provide practitioners with convincing arguments about the performance of our novel tool, or to let them understand facts about the evolution of their software project, *e.g.,* about architectural erosion, size/complexity increase, or developers' activity.


## Correlation is not causation and, even if we can claim causation...
No matter how we carefully conduct our (quantitative) empirical study, it would not tell us the whole story. In the most optimistic scenario, *e.g.,* when we have collected findings from a controlled experiment, we may still do not know *why* our recommender worked better (or worse) than the baseline, *how* developers have used it during their tasks, and *whether* there are clear directions for improvement.

In empirical research where the level of control is more limited, the situation can be worse. The classical example is the one in which we have built a defect predictor that recommends defect-prone classes based on the presence of some code smells, and it seems to exhibit a very good precision and recall. However, is really the presence of code smell to cause defects, or, maybe, defective code is subject to more patches and becomes complex. Or else, a specific module of our projects is just too complicated to become smelly and defect-prone? 

Other than that, quantitative findings might tell us how good is our approach, but tells us little on how to improve it. Why is my smell detector producing so many false positives, especially when applied on certain (sub)systems? And, why it fails to detect some true smells?

What are the recipes to properly complement our gained quantitative evidence? In short, you should try to complement quantitative findings with qualitative one. 
While quantitative studies will provide you empirical evidence in terms of numerical relations between variables, qualitative ones will let you interpret a phenomenon by observing it in its context. This is often achieved through the analysis of people observations, interviews, and documents (Quinn Patton, 2001).



## Collect your data: people and artifacts
In the following, we will discuss how to complement quantitative studies in software engineering by means of (i) manual analysis and classification of software repository artifacts using purposeful sampling and techniques inspired to grounded theory, and (ii) developers' interviews.


### Source 1: Dig into software artifacts and data....
Software repositories provide you with a great opportunity to complement quantitative studies with qualitative ones. Changes committed in versioning systems are documented with more or less detailed commit messages; issues are discussed through comments posted on the issue tracker before being fixed. Last, but not least, a manual inspection of source code or of its changes would help you a lot in understanding how certain changes impacted the software architecture.

How much to analyze, and how? More often than not, our studies involve hundreds (if not thousands) of projects, millions of lines of code, and discussions having similar orders of magnitude. Impossible to perform a exhaustive analysis. In most cases, what we want to do is to (i) determine an appropriate sample size that helps us to achieve a given margin of error (*e.g.,* ±10%) for a given level of confidence (*e.g.,* 95%), and (ii) apply statistical sampling such as random or stratified sampling. 

However, this is not what you might need to answer many of your questions. Instead, what you often need is a *purposeful* sampling. Examples of purposeful sampling include (Patton Quinn, 2001):

* **Extreme/deviant cases sampling:** analyze artifacts on which your tool worked very well, or did not work at all; talk with people that exhibited the highest (or lowest) productivity with your tool; in general, look at outliers. Similarly, it might be useful to sample, analyze and discuss *confirming and disconfirming cases*, which help to understand why an approach works and when it does not.
* **Homogeneous sampling:** in this case you may want to focus on a specific class of artifacts/subjects. For example, you might want to understand how senior developers performed when using your recommender, or how well your smell detection tool worked on classes from the graphical user interface of the analyzed system.
* **Snowball sampling:** this occurs when the sampling of an artifact (or a person in an interview) suggests you further artifacts or people. For example, while you are inspecting emails discussing licensing, you discover a pattern that allow to sample further emails. Or else, a respondent might point you to other people involved in a certain activity.

Note that the aforementioned sampling techniques may or may not be complemented with the use of a statistically significant sample size. More often than not, here the objective is not to claim generalizability, but to rather provide answer to emerging questions.

#### ...but be careful about noise and incompleteness!
Assuming that software repositories will tell you everything about a project, and that information available there is fullly reliable, can be dangerous. 
As previous studies have indicated that:

* **Not everything is recorded in software repositories:** developers still discuss via phone, unrecorded chats, or in face-to-face meetings. Hence, recorded rationale in written communication only represents a partial view of what happens in a software project (Ananda and Venolia, 2009).
* **Traceability across different data sources is often incomplete**, *e.g.,* not all commits fixing issues are explicitly linked to issue reports.
* **Software repositories contain noisy data:** this includes misclassification of artifacts, *e.g.,*  issues reports classified as bug fixes when they are related to new features, tangled changes in versioning systems, or interleave of emails having completely different purpose.
* **Variable quality and level of detail of textual documentation**, *e.g.,* of commit messages, issue descriptions. In addition to that, written communication often makes use of project/domain specific terms, expresses personal and subjective points o view, and provides very contextualized information, *e.g.,* assuming the participants to the discussion know what one is talking about.


### Source 2: Interview practitioners...
Every time you have studied a software project, or have built any kind of recommender based on project data, you should try to assess your findings with the help of  practitioners involved in that project.

Interviewing practitioners in an industrial context is already challenging. When it comes to apply it to  open source projects, things might become even more difficult, despite that one has many projects and potential respondents available. A few suggestions:

* **Carefully target potential respondents:** random sampling over project emails might not always be the best solution. Before involving people in the interview, try to answer questions such as: who are the project top developers? I'm asking developers to assess code smells detected by my approach; who are the owners of such artifacts? Finally, since you might obtain responses from a limited (e.g. <20%) subset of the targeted participants, you should assess whether they are still representative of the targeted sample, and if not properly frame your results within such a set of respondents.
* **Motivate respondents:** you might have your research goal in mind, however practitioners are willing to help if you are already providing them with findings of their interest. 
* **Plan for short tasks:** most of the respondents are unlikely to spend more than 15-20 minutes on the task you're asking them to participate. Try to limit it to the essential information you need.
* **Choose the most suitable interviewing protocol:** in most cases interviewing developers from open source projects is only feasible through online questionnaires or emails. When a live interview is possible, you will have many more options in terms of the interview structure (fully structured, semi-structured, or totally unstructured). Also, different protocols are possible, such as think-aloud, (focus) group interview.


#### ...and don't be afraid if you collect very little data!
Remember that here the quality of obtained feedback is more important than the statistical significance of sample.  Very few respondents could still be able to provide you precious feedback to improve your approach/tool and make it applicable in the real world, to provide you with an explanation of why your approach produced false positives or meaningless results in their project. 

## Build a theory upon your data
Once data has been collected, the purpose of qualitative analysis is to provide an interpretation to it and, ideally, build a theory. To this aim, techniques inspired to grounded theory (Corbin and Strauss, 1990) such as open coding are particularly suitable. Open coding and, in general,  grounded theory techniques aim at classifying, characterizing and classifying artifacts and responses to interviews. 

Open coding starts with the identification of keywords/regularities in the observed artifacts, and in the consequent creation of categories. Such categories should be internally cohesive and consistent,
The open coding process should involve multiple independent coders to limit subjectiveness, e.g. one person performs the coding and the other replicates, and then coding reliability measures are computed. Multiple iterations of the process merge, split or remove categories. Once the categorization is obtained, categories can be related and, finally, concepts abstracted from the categorization.  In our context, this allows to answer questions such as:

 * What do developers discuss before fixing a bug? How do discussions converge to a solution?
 * What kinds of bugs occur in files affected by code smells? 
 * What are the typical problems developers encountered when using our new recommender system? What the main suggestions for improvement?
 

## Conclusion: More is better
Summarizing, studying a software process/product, or evaluating a novel approach/tool requires multiple evaluations of different kinds. On the one hand, quantitative studies having different scale, different level of control and different risks, *e.g.,* surveys, case studies and controlled experiments (Wohlin *et al.,* 2000), as well as their replication to increase statistical power and external validity of results.
On the other hand, combining such quantitative studies with qualitative ones will help providing convincing arguments of *when* and *why* a prediction model or a recommending system works (or does not work)



## Suggested readings
Seaman (1999) has discussed the application of qualitative methods in software engineering, and specifically about observing/interviewing developers, and complementing this with coding and theory building. Quinn Patton (2001) provides a thorough overview of qualitative methods-mainly in the context of social science application. Last, but not lest there is the seminal work on grounded theory research (Corbin and Strauss, 1990).


## References
J. Aranda, G. Venolia: The secret life of bugs: Going past the errors and omissions in software repositories. 31st International Conference on Software Engineering, ICSE 2009, May 16-24, 2009, Vancouver, Canada: 298-308

J. Corbin and A. Strauss. Grounded theory research: Procedures, canons, and evaluative criteria. Qualitative Sociology, 13(1):3–21, 1990.

M. Quinn Patton. Qualitative Research & Evaluation Methods (3rd edition). Sage Publications, Inc. 2001.

C. B. Seaman: Qualitative Methods in Empirical Studies of Software Engineering. IEEE Trans. Software Eng. 25(4): 557-572 (1999)

C. Wohlin, P. Runeson, M. Host, M. C. Ohlsson, B. Regnell, and A. Wesslen. Experimentation in Software Engineering - An Introduction. Springer, 2000.


