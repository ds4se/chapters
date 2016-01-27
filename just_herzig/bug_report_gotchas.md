# Gotchas from Mining Bug Reports

 

Over the years, it has become common practice in empirical software engineering to mine data from version archives and bug databases to learn where bugs have been fixed in the past, or to build prediction models to find error prone code in the future. 

Simplistically, one counts the number of fixes per code entity by mapping closed reports about bugs to their corresponding *fixing* code changes--typically one scans for commit messages that mention a bug report identifier. This however relies on three fundamental assumptions:

 

* **The location of the defect is the part of the code where the fix is applied.** 

   However, this is not always true and bug fixes can have very different nature. Consider a method _M_ that parses a string containing email addresses and returns the email alias without the domain. However, _M_ crashes on strings containing no @ character at all. A simple fix is to check for @ characters before calling _M_. Although this resolves the issue, the method that was changed to apply this fix is not the one that is defective and might also be located in a different source file. 

* **Issue reports that are flagged as BUGs describe real code defects.** 

   We rely on the fact that work items marked as BUGs are really referring to bugs. If this is not the case, the work item and its associated code changes are considered bug fixes although they might implement a new feature or performing a refactoring. 

* **The change to the source code is atomic, meaning it's the minimal patch that fixes the bug without performing any other tasks.** 

   Similar to the assumption above, we treat code changes associated to work items as a unity. Thus, we assume that all code changes applied in the same commit serve the same purpose defined by the associated work item. But what if a developer applies code changes serving multiple purposes together? Even if she stated the fact in the commit message, e.g. "Fixing bug #123, implementing improvement #445 and refactoring module X for better maintainability", we do not know which code change belongs to which work item nor which code change implements the bug fix.



Violating the first assumption yields models that predict bug fixes rather than code defects--but there is very little we can do as bugs themselves are not marked in the process and as bug fixes can be assumed at least close to the actual defect. Therefore, we will focus on the remaining two assumptions. 



Violating the two latter assumptions however would lead to noise and bias in our datasets. In fact, if we are unable to separate bug fixes from code changes and if code changes are frequently tangled with other non corrective code changes, then counting such tangled bug fixes effectively means counting changes or churn, rather than code defects or bug fixes. A serious problem if we want to predict quality rather than churn. Thus, violating the latter two assumption imposes serious risks and might lead to imprecise code quality models.

 

## Do bug reports describe code defects? 

 

There is no general answer to this question. Fundamentally, the answer depends on the individual bug reports filed against a system and on the more fundamental question: what is a bug? If we would ask this question to five developers, we would probably get six different answers or most of them would answer: "this depends". Asking 10 people on the street, including people not being software development engineers, would add even more diversity to the set of answers. 



#### It's the user that defines the work item type 



Although the question of a definition of a bug seems unrelated, we should bare in mind that bug trackers are communication tools between engineers and customers--potentially people from the street. And it is often the customer, the non-expert, that creates these "bug" reports. Even worse, it is the customer that is responsible to assign a issue report type: typically something like BUG, RFE (feature request), IMPR (improvement), REFAC (refactoring), etc. However, if the user is a customer with little software expertise, he might not know the difference between BUG and IMPR. And even if he does, his definition of BUG may not match the one of a developer.



Thus, the threat of violating our second assumption (bug reports describe real code defects) is high, depending on the data source and who is involved in creating bug reports. 



#### An example 



We illustrate the conflict of definitions on a small example (real-world) between the three parties that are involved in creating and accessing bug report data, i.e. users, engineers and analysts: the *user* of a system complains about the fact that when pressing buttons in the graphical user interface raises a bell tone. She files a BUG report complaining about the fact that she cannot disable the bell tone. She uses the BUG type either because users tend to mark all unexpected behavior as bugs or because BUG is the standard selection in most bug trackers. The *engineer* responsible for resolving the "bug" solves her issue by providing the ability to turn off the audio effect. However, he considers this to be a new feature as turning off the audio effect was not supported and lead to multiple changes in multiple layers of the program.



#### Who cares about the report categories?



Studies have shown that fields of issue reports change very rarely, once an initial value is assigned. The reason is that engineers have very little benefit of changing these values. Once the engineer knows the actual report category, he is close to a solution of the issue. Going back to the report and changing the report type costs only time, in some bug tracking tools this is not even possible without deleting and creating a new report. The same is true for other issue report fields, such as severity or priority. Thus, it is the data analyst, the person with the least knowledge about the individual reports, that has to rely on the work item category.



As a consequence, data analysts should not blindly rely on user input data, especially if the data might stem from non-experts or data sources that reflect different points of view. It is important keep in mind that the data to be analyzed is most likely created for purposes other than mining and analyzing the data. Going back to our assumption on bug reports and the types of work items, we should be careful about simply using the data without checking if our second assumption holds. If it does not hold, it is good practice to estimate the extend of the data noise and whether it will significantly impact our analyses.

 

#### How big is the problem of "false bugs"?



In a study Herzig et al. [1] investigated 7,000 bug reports from five open source projects (HTTPClient, Jackrabbit, Lucene-Java, Rhino and Tomcat5) and manually classified their report categories to find out how much noise exists in these frequently used bug report data sets and what impact this noise has on quality models.

 

The authors found that **issue report types are unreliable**. In the five bug databases investigated, more than 40% of issue reports were categorized inaccurately. Similarly, the study showed that **every third bug report does not refer to code defects**. In consequence, the validity of studies regarding the distribution and prediction of bugs in code is threatened. Assigning the noisy original bug data to source files to count the number of defects per file, Herzig et al. [1] found that 39% of **files were wrongly marked as fixed** although *never* containing a single code defect. 



## Do developers apply atomic changes? 



The third assumption commonly made when building quality models based on software repositories is that commits applied to version archives represent atomic code changes. However, this assumes that humans work sequentially and that individual work items are independent. Both assumptions that do not hold [1,2]. Developers do not work sequentially but rather work on many different tasks in parallel, at least when using the version control perspective.



#### Version Control systems are not fine granular enough



Version control commits are snapshots in time. Their patches summarize code changes that have been applied since the previous commit. However, this perspective disregards the purpose of these changes and their fine-grained dependencies, e.g. in which order they were performed. 



A developer fixing a code defect by overwriting an entire method and replacing its content with a faster algorithm that also fixes the defect cannot be separated into a set of code changes fixing the defect and applying an improvement. And even if manual separation is possible, e.g. fist fixing a code defect before renaming variables, there is little to no motivation and benefit for engineers to work this way, e.g. to create local branches to fix simple bugs. This is very similar to the reasons of noisy bug report types. An engineer's focus lies on completing a task and to get work done---that is what she is paid for. And for the developer, there is no (imminent) benefit working in such a way that data analysts and their models gain higher accuracy. 



Thus, even if developers do work sequentially on work items and development tasks, we rely on them to group the applied changes in provide the appropriate snapshots (commits). At the same time, we provide little to no motivation for developers to perform this extra (and potentially time consuming) work. 



#### How big is the problem of "tangled changes"?



Each *tangled change* threats the validity of models relying on the assumption that code changes are atomic entities, e.g. assigning the number of bugs by identifying bug references in commit messages and assigning the fixed bug to all files touched in the assumed atomic commit. 



Among other, Herzig and Zeller [3] showed that the bias caused by tangled changes can be significant. In their study, the authors manually classified

more than 7,000 individual change sets and checked whether they address multiple (tangled) issue reports. Their results show that up to 12% of commits are tangled and cause false associations between bug reports and source files. Further, Herzig [4] showed that tangled changes usually combine two or three development tasks at a time. The same study showed that between 6% and 50% of the most defect prone files do not belong in this category, because they were falsely associated with bug reports. Up to 38% of source files had a false number of bugs associated with them and up to 7% of files originally associated with bugs never were part of any bug fix.

 

## In summary



Mining bug reports and associating bug fixes to files to assess the quality of the code has become common practice. However, it is crucial to remember that this method relies on assumptions that need to be verified to ensure that resulting models are accurate and reflect the intended property. There has been outstanding research performed on automatically correcting some of the noise and bias commonly experienced in software repositories, e.g. classifying issue reports using text based approaches [5]. Using manual validation and automated cleanup methods is essential to ensure that the data matches our expectations. Otherwise users of our models will open bug reports complaining about the inaccuracy of our model. As an owner of the model would you consider that a bug or rather as an improvement?



## References



[1] K. Herzig, S. Just, and A. Zeller, “It’s not a Bug, It’s a Feature: How Misclassification Impacts Bug Prediction,” in Proceedings of the 2013 international conference on software engineering, Piscataway, NJ, USA, 2013, pp. 392-401. 



[2] Kawrykow, D., and Robillard, M. P. "Non-essential changes in version histories." In Proceedings of the 33rd International Conference on Software Engineering (New York, NY, USA, 2011), ICSE ’11, ACM, pp. 351–360.



[3] K. Herzig and A. Zeller, “The Impact of Tangled Code Changes,” in Proceedings of the 10th working conference on mining software repositories, Piscataway, NJ, USA, 2013, pp. 121-130. 



[4] K. Herzig, “Mining and Untangling Change Genealogies,” PhD Thesis, 2012. 



[5] Antoniol et al., "Is it a bug or an enhancement? A text-based approach to classify change requests" In Proceedings of the 2008 conference of the center for advanced studies on collaborative research: meeting of minds (New York, NY, USA, 2008), CASCON’08, ACM, pp. 23:304–23:318.

