# Go back and do it again
_Martin Shepperd_

## The replication crisis

The need to replicate results is a central tenet throughout science and empirical software engineering is no exception. The reasons are threefold. First it’s a means of testing for errors, perhaps in the experimental set up or instrumentation (the Fleischmann-Pons cold fusion experiment is a famous example). Second, it helps the scientific community better understand how general are the findings, through time, through different settings.  Third, it helps us better approximate the confidence limits on a reported effect size. Note that even for well conducted studies conducted by the most scrupulous researchers, we can still find Type I or Type II errors at a frequency approximately determined by the &alpha; and &beta; settings, so for example, we would typically expect 1 in 20 studies to wrongly reject the no effect hypothesis and perhaps as many as 2 in 10 to studies fail to reject the null hypothesis (of no effect) when the null is in fact false. This means relying upon a single study has an appreciable degree of risk.

So it’s quite surprising to observe that there is no single agreed set of terminology. Schmidt (2009) writing for an audience of psychologists observed the paucity of clear cut guidance or single set of definitions. He differentiates between *narrow* replication which entails replication of the experimental procedure and *wider* or conceptual replication which entails testing of the same hypothesis or research question but via different means. 
 
Both narrow and wide replications occur in software engineering. An example of the former is Basili et al.’s (1999) idea of families of experiments and materials being explicitly shared. Clearly in such circumstances it’s essential to ensure to have confidence in the validity of such materials. Wide or conceptual replications are more commonplace but frequently in a less structured fashion which can lead to considerable difficulties in making meaningful comparisons.  This has been highlighted by various meta-analayses such as the Hannay et al. (2009) study on pair programming and the Shepperd et al. (2014) analysis of software defect classifiers.

In a mapping study de Magalhães et al. (2015) report that whilst there has been some growth in the number of replication studies in recent years for empirical software engineering, the total numbers remain a very small proportion of the total number of studies conducted. They found a total of 135 papers reporting replications, published between 1994 and 2012. Miller (2005) comments that one reason for the poor uptake of replication as an important research technique is that it’s perceived as “*only* [my emphasis] about proving robustness of pre-existing results”, in other words a narrow view of replication with potentially negative connotations. This needs to be changed.

In fact the problem is even more serious and came forcibly to my attention when attempting a meta-analysis of results from the field of software defect prediction. For some time I and other researchers were concerned about the lack of agreement between individual studies; informally it seemed that for every study by Team A that reported strong evidence for X, the next study by Team B reported strong evidence for NOT(X) Menzies and Shepperd (2012). 

Lack of agreement between studies triggered a formal meta-analysis of defect classifiers all derived from competing statistical and machine learning approaches conducted with co-authors Bowes and Hall. Despite locating over 200 primary studies we had to *reject more than 75%* due to incompatible experimental designs, lack of reported details and inconsistent or inappropriate response variables (Shepperd et al., 2014). This is an dispiriting waste of research energy and effort. Nevertheless we were still able to meta-analyse 600 individual experimental results. Our conclusions were quite stark. The choice of machine learning algorithm had almost no bearing upon the results of the study. We modelled this using a random effects linear model using ANOVA and then added moderators to characterise aspects of the experimental design such as training data, input metrics and research group (the latter being determined through a single linkage clustering algorithm based upon co-authorship). To our astonishment we found that research group is many times (of the order 25x) more strongly associated with the actual results than the choice of prediction algorithm.  We believe the causes of this researcher bias include:
* differing levels of expertise
* the preference for some results over others; scientists are human after all! 
In this setting it is no surprise that there is presently little agreement i.e. reliability between research results.

The remainder of this article focuses on issues that can enhance the reproducibility and reliability of experiments within software engineering. Note that replication for non-experimental investigations is an interesting and complex question that I do not propose to cover in this article (see  for instance Eisenhardt (1989) on replication logic for case studies)

## Reproducible studies

In order for a study to be repeated naturally it must be reproducible, by this I mean there must be sufficient information available to enable this to happen. Schmidt (2009) quotes Popper who states "Any empirical scientific statement can be presented (by describing experimental arrangements, etc.) in such a way, that anyone who has learned the relevant technique can test it.”  However this begs the question of what characteristics should a study report? There are four areas that must be considered although their relative importance may vary from study to study:

1. Explicit research question: this needs to be carefully articulated as exploratory trawls through data sets are difficult to replicate.
2. Data and pre-processing procedures: this militates against studies that use data not in the public domain and such authors need to find persuasive arguments as to why using such data are necessary
3. Experimental design: differences in design can significantly impact reliability.  Note that for example in machine learning the impact of using a LOOCV as opposed to m &times; n cross-validation is not well understood.
4. Details of algorithms employed - most machine learners are complex with large free spaces for their parameter settings. Choices are often governed by experience or trial and error.

Much of the above could be simplified once specific research communities are able to define and agree upon standard reporting protocols. This would be particularly beneficial for new entrants to the field and for meta-analysts.

## Reliability and validity in studies

We need studies that are reliable, that is if repeated will tend to produce the same result. They also need to be valid since reliably invalid is, to put it mildly, unhelpful!  Hannah et al. (2009) in their meta-analysis report that "the relatively small overall effects and large between-study variance (heterogeneity) indicate that one or more moderator variables might play a significant role”. This is a similar finding to the Shepperd et al. (2014) meta-analysis in that experimental results are typically confounded by differences in experimental design and conduct.  This harms reliability.  Likewise Jørgensen et al. (2015)  randomly sampled 150 software engineering experiments from their systematic review.  Again they found significant problems with the validity. Two particular problems appear to be researcher bias and low experimental power.

## So what should we do?

There is much consensus from commentators both within software engineering, e.g. Jørgensen et al. (2015) and beyond e.g. the psychologist Schooler (2014) for more replications and meta-studies. In order to accomplish this I believe we need:

* Blind analysis: this is a technique to reduce researcher bias, whereby the experimental treatments are blinded by means of re-labelling so that the statistician or analyst is unaware which is the new ‘pet’ treatment and which are the benchmarks.  This makes fishing for a particular result more difficult (Sigweni and Shepperd (2015).
* Agreed reporting protocols: so that replications are more easily possible without having to guess as to the original researchers’ implementation. 
* To place more value on replications and non-significant results: Ioannidis (2014) demonstrates — as a somewhat hypothetical exercise — how a game-theoretic analysis of the different goals of the different stakeholders in the research community can lead to problematic outcomes and that we need therefore address the ‘currency’ or payoff matrix. I see no easy shortcuts to achieving this but minimally awareness may lead to better awareness and more fruitful discussions.

## References

Basili, V. et al. (1999), "Building Knowledge through Families of Experiments", *IEEE Transactions on Software Engineering* 25(4), pp456--473.

de Magalhães, C. et al. (2015) "Investigations about replication of empirical studies in software engineering: A systematic mapping study", *Information and Software Technology*,  64, pp76--101.

Eisenhardt, K. (1989) "Building Theories from Case Study Research", *The Academy of Management Review*, 14(4), pp. 532--550.

Hannah, J. et al. (2009) "The Effectiveness of Pair Programming: A Meta-Analysis" *Information and Software Technology*,  51(7), pp1110--1122.

Ioannidis, J. (2014) "How to Make More Published Research True", *PLoS Medicine* 11(10)  e1001747.

Jørgensen, M. et al. (2015) "Incorrect results in software engineering experiments: How to improve research practices", *Journal of Systems and Software*, Available online http://dx.doi.org/10.1016/j.jss.2015.03.065.

Menzies, T. and Shepperd, M. (2012) "Special issue on repeatable results in software engineering prediction", *Empirical Software Engineering*, 17(1-2), pp1--17. 

Miller, J. (2005) "Replicating software engineering experiments: a poisoned chalice or the Holy Grail?", *Information and Software Technology*, 47(4), pp233--244.

Schmidt, S. (2009) "Shall we really do it again? The powerful concept of replication is neglected in the social sciences", *Review of General Psychology*, 13 (2), pp90--100.

Schooler, J. (2014) "Metascience could rescue the 'replication crisis'". *Nature* 515 (7525): 9.

Shepperd, M. et al., (2014) "Researcher Bias: The Use of Machine Learning in Software Defect Prediction", *IEEE Transactions on Software Engineering* 40(6), pp603-616.

Sigweni, B. and Shepperd, M. (2015) "Using blind analysis for software engineering experiments", Proc. of the *19th ACM International Conference on Evaluation and Assessment in Software Engineering (EASE ’15)*, http://doi.acm.org/10.1145/2745802.2745832 
