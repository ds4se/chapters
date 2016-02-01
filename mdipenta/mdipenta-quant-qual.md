#Combining Quantitative and Qualitative Methods (When Mining Software Data)

## Prologue: we have solid empirical evidence!
In recent years, empirical research in software engineering has gained a lot of maturity. This is in part thanks to the availability of a large amount of data from different kinds of software repositories, as well as of techniques to mine them, *e.g.,* for tracing data from heterogeneous sources, summarizing changes, or mining unstructured and semi-structured data sources. Noticeably, the analysis of data from software repositories has also gained a lot of attention in industry, where developers rely on software data to take important decisions. The roles, competencies, and working styles of data scientists in software development has been recently investigated by Kim *et al.*, (2016).

Suppose we are software engineering researchers and we have developed a new recommendation tool that identifies certain kinds code bad smells. We want to convince practitioners to adopt our tool. Also, suppose that, by using data from software repositories, and by using appropriate statistical methods, we are able to show that our new code smell detector achieves 90% precision and 60% recall, and that classes affected by such smells tend to be significantly more defect-prone than others.
Hopefully, such findings can be useful to provide practitioners with convincing arguments about the performance of our novel tool and its potential usefulness. Is this sufficient to convince them adopting the tool? Does it show that detecting code bad smells is relevant and useful? What are we missing?


## Correlation is not causation and, even if we can claim causation...
No matter how we carefully conduct our (quantitative) empirical study, it would not tell us the whole story. Let us assume that, by doing a quantitative study, we know that our tool is very precise and has a good recall, better than an alternative tool.
Let us also assume that we conduct a controlled experiment to study the relation between smells and code defect-proneness. In a controlled experiment, 
we observe one or more dependent variables (in our case defect-proneness) while varying the level of some independent variables (*e.g.,* separating classes containing bad smells from others) and controlling others (*e.g.,* determining whether the class size could influence our results). Results of the experiments show that classes containing code smells identified by our tools are more fault-prone than others. However,  this does not tell us the whole story.

Specifically, we still do not know *why* our recommender worked better (or worse) than the baseline, *how* developers have used it during their tasks, and *whether* there are clear directions for improvement. More than that, problems in claiming the causation of our findings. Imagine our tool is able to highlight potentially defect-prone classes based on the presence of some code smells, and it seems to exhibit a very good precision and recall. Is the presence of code smell really what causes defects? Or, maybe, defective code is subject to more patches and then becomes "smelly"? Or, perhaps a specific module of our projects is just too complicated to become smelly and defect-prone?
While in some cases a purely quantitative analysis may result sufficient to determine the direction of a causality relation (*e.g.,* smells are always introduced in the code before defects occurs, therefore we could claim that smells may cause defects and not *vice versa*, *i.e.* defect fixes makes source code smelly), in some other cases this is not possible, either because it is not possible to determine a temporal precedence between two phenomena, or because causation depends of factors we are ignoring.

Other than that, quantitative findings might tell us how good is our approach, but tells us little on how to improve it. Why is my smell detector producing so many false positives, especially when applied on certain (sub)systems? And, why does it fail to detect some true smells?

In some other circumstances, it can happen that a quantitative study does not show the effect of a factor we are not observing. A typical example is a study by Bird *et al.* (2009) on the effect of developers' geographical distribution. Quantitative results showed a limited effect of geographical distribution, through developers suggest this is because of countermeasure they have taken (not observable in the study).


**What are the recipes to properly complement the gained quantitative evidence?** In short, you should try to complement quantitative findings with qualitative ones. 
While, as exemplified above, quantitative studies will provide you with empirical evidence in terms of numerical relations between variables, qualitative studies will help you to interpret and explain a phenomenon by observing it in its context. This is often achieved through the analysis of people observations, interviews, and documents (Quinn Patton, 2001).



## Collect your data: people and artifacts
To complement our quantitative findings with qualitative insights, we can rely on at least two precious sources of information: (i) artifacts contained in the software repositories, and (ii) the projects' contributors.


### Source 1: Dig into software artifacts and data....
Software repositories offer us a great opportunity to complement quantitative studies with qualitative ones. For example, commit messages provide a (short) rationale of the performed changes, whereas information of what contributors discussed before an issue was fixed can be found in issue trackers. Similarly, other communication channels such as mailing lists or chats will help you discover the rationale of some project decisions.


#### ...but be careful about noise and incompleteness!
Assuming that software repositories will tell you everything about a software project, and that information available there is fully reliable, can threaten the validity of your results. Previous studies have indicated that:

* **Not everything is recorded in software repositories:** as developers still discuss via phone, unrecorded chats, or in face-to-face meetings (Ananda and Venolia, 2009). Not to mention the need to trace heterogeneous repositories when, more often than not, links are incomplete or missing.
* **Software repositories contain noisy data:** this includes misclassification of artifacts, *e.g.,*  issue reports classified as bug fixes when they are related to new features, or tangled changes in versioning systems (*i.e.,* multiple changes having different purpose committed together).

Last but not least, a manual analysis of developers' written discussions might be subject to a misleading interpretation when performed by outsiders. 
Therefore, every time one does not have sufficient elements to provide answers to research questions or explanation to given phenomena based solely on the manual or automated analysis of data from software repositories, the latter needs to be complemented with information obtained by interviewing/surveying developers.


### Source 2: Getting feedback from developers...
Every time you obtain empirical results based on data from some software projects, you should try to assess your findings with the help of developers involved in these projects. One possibility is to perform live/phone interviews. Using interviews has noticeable advantages, among others the possibility of clarifying questions to participants, or to use a semi-structured or unstructured format, *i.e.,* adapting the questions to the context. A viable alternative is to conduct a survey (*e.g.,* through a Web-based platform) using a predefined questionnaire. This is useful when (i) it is impossible to reach people live or physically, or, in general (ii) participants prefer to answer the questionnaire at their own schedule. Moreover, by employing survey you could engage people in more complex tasks, that go beyond just answering a simple question. As an example, going back to our smell detector tool, we could imagine showing to participants some example of "smelly" code and asking them opinions or suggestions for refactoring. Truly, this can also be accomplished during a live interview, but as a matter of fact a Web-based survey gives you an appropriate (and probably more relaxed) setting for that.

Interviewing developers in an industrial context is already challenging. When it comes to applying it to open source projects, things might become even more difficult, despite that one has many projects and potential respondents are available. A few suggestions:

* **Carefully target potential respondents:** random sampling over project email addresses might not always be the best solution. Do you need answers from core developers? Do you need people knowledgeable about specific artifacts?
* **Motivate respondents:** while you plan your interview/survey with your own research goal in mind, developers would be more willing to help if you are already providing them with findings of their interest. 
* **Plan for relatively short questionnaires, with (if any) tasks that can be accomplished in a limited amount of time:** most the respondents are unlikely to spend more than 15-20 minutes on the task you are asking them to participate in. 
* **Choose the most suitable interviewing protocol:** in most cases, the only way to gain information from software developers (especially in the open source) is to ask them to fill a questionnaire. When a live or phone interview is possible, you will have many more degrees of freedom in terms of the interview structure (fully-structured, semi-structured, or totally unstructured). Also, different protocols are possible, such as think-aloud, or (focused) group interviews.


#### ...and don't be afraid if you collect very little data!
Remember that here the quality of obtained feedback is more important than the statistical significance of our sample.  Very few respondents could still be able to provide you precious feedback to improve your approach/tool and make it applicable in the real world, to provide you with an explanation of why your approach produced false positives or meaningless results in their project. 


### How much to analyze, and how? 
In large studies on software repositories, exhaustive analysis is often unfeasible. One option is to perform a statistical (*e.g.,* random or stratified) sampling.
 However, this may or may not be what you need. In qualitative analysis, it is often useful a *purposeful* sampling, which focuses more on obtaining answers to your questions rather than achieving statistical representativeness and generalizability. Examples of purposeful sampling include (Quinn Patton, 2014):

* **Extreme/deviant cases sampling:** analyze artifacts on which your tool worked very well, or did not work at all; talk with people that exhibited the highest (or lowest) productivity with your tool; in general, look at outliers. 
* **Homogeneous sampling:** in some cases, you may want to focus on a specific class of artifacts/subjects. For example, you might want to understand how senior developers performed when using your recommender, or how well your smell detection tool worked on classes belonging to the graphical user interface of the analyzed system.
* **Snowball sampling:** this occurs when one sample suggests further ones. For example, while you are inspecting emails discussing licensing, you discover a pattern that allows you to sample further emails. Or, when interviewing a developer involved in a bug fix, you learn about other people involved in that activity.


## Build a theory upon your data
Once data has been collected, the purpose of qualitative analysis is to provide an interpretation to it and, ideally, build a theory. To this aim, techniques inspired to grounded theory (Corbin and Strauss, 1990) such as open coding are particularly suitable. 

Open coding starts with the identification of keywords/regularities in the observed artifacts, and in the consequent creation of categories, that should be internally cohesive and consistent, and overall inclusive of the investigated reality.
The open coding process should involve multiple and independent coders to limit subjectiveness, *e.g.,* one person performs the coding, the other replicates it, and then coding reliability is assessed through measures such as the *Krippendorff's Alpha* (Krippendorff, 2013). Multiple iterations of the process aim to merge, split or remove categories.  Such categories, their relationships, and the concepts abstracted from them allow you to answer questions such as:

 * What do developers discuss before fixing a bug? How do discussions converge to a solution?
 * What kinds of bugs occur in files affected by code smells? 
 * What are the typical problems developers encountered when using our new recommender system? What the main suggestions for improvement?
 

## Conclusion: the truth is out there!
Studying a software process/product, or evaluating a novel approach/tool requires multiple, and different kinds of, evaluations. On the one hand, quantitative studies having different scales, different levels of control and different risks, *e.g.,* surveys, case studies and controlled experiments, as well as their replication to increase statistical power and external validity of results.
On the other hand, combining such quantitative studies with qualitative ones will help providing convincing arguments of *when* and *why* a prediction model or a recommender system works (or does not work).

In summary, information is just there, but you need to look at it from different perspectives: quantitative (numbers) and qualitative (concepts).


## Suggested readings
Seaman (1999) has discussed the application of qualitative methods in software engineering, and specifically about observing/interviewing developers, and complementing this with coding and theory building. Quinn Patton (2014) provides a thorough overview of qualitative methods-mainly in the context of social science application. Last, but not least, a "must read" is the seminal work on grounded theory research (Corbin and Strauss, 1990).

Some chapters of this book specifically focuses on certain qualitative analysis techniques.  In their chapter *"Avoiding Survey Design Traps: A Successful Process for Sailing Past the Temptations of Persephone's Sirens"* Barik and  Murphy-Hill provide hints on how to conduct survey research. In his chapter *"Card-sorting: From Text To Themes"* Zimmermann illustrates the card-sorting method, that can be used to analyze open-text survey responses. Menzies' chapter *"Correlation is not Causation"* explains, through simple examples, the difference between claiming correlation and causation.


## References
J. Aranda, G. Venolia: The secret life of bugs: Going past the errors and omissions in software repositories. *Proceedings of the 31st International Conference on Software Engineering, ICSE 2009, May 16-24, 2009, Vancouver, Canada*. Pages 298-308, ACM

C. Bird, N. Nagappan, P. T. Devanbu, H. C. Gall, and B. Murphy: Does distributed development affect software quality? An empirical case study of Windows Vista. *Proceedings of the 31st International Conference on Software Engineering, ICSE 2009, May 16-24, 2009, Vancouver, Canada*. Pages 518-528, ACM

J. Corbin and A. Strauss. Grounded theory research: Procedures, canons, and evaluative criteria. *Qualitative Sociology*, 13(1):3–21, 1990.

M. Kim, T. Zimmermann, R. DeLine, and  A. Begel: The Emerging Role of Data Scientists on Software Development Teams, *Proceedings of the 38th International Conference on Software Engineering, ICSE 2016, May 14-22, 2016, Austin, TX, USA*:, ACM

K. Krippendorff. *Content analysis: An introduction to its methodology, 3rd edition*. Sage Publications, Inc. 2013.

M. Quinn Patton. *Qualitative Research & Evaluation Methods. Integrating Theory and Practice (4th edition)*. Sage Publications, Inc. 2014.

C. B. Seaman: Qualitative Methods in Empirical Studies of Software Engineering. *IEEE Transactions on Software Engineering* 25(4): 557-572 (1999)



