# Are We Really Helping Developers?

_Alessandro Orso_, Georgia Institute of Technology

## Premise

Although one may argue that this chapter is not exactly about software analytics, the family of techniques that are at the core of the chapter can be seen as _data anlytics for software debugging_. In particular, that are many parallels between the way techniques in the software analytics space and statistical debugging techniques operate. This paper therefore argues there the conclusions and findings for the latter can teach us a general lesson for the former.

## With Big Data Comes Great Responsibility

Spectra based (or statistical) fault localization is a family of debugging techniques that aim to identify potentially faulty code by mining both passing and failing executions of a faulty program, inferring their statistical properties, and presenting developers with a ranked list of potentially faulty statements to inspect. The first instances of these techniques (e.g., [1, 2]) were clever, disruptive, and promising. Case in point, Reference [1] was awarded an ACM SIGSOFT Outstanding Research Award, and the dissertation based on Reference [2] received an ACM Doctoral Dissertation Award. Unfortunately, however, statistical debugging became too trendy for its own good. A few years after these first groundbreaking techniques were presented, researchers started to propose all sorts of variations on the initial idea. In most cases, these variations consisted in using a different formula for the ranking and showing slightly improvements in the effectiveness of the approach. 

This is a typical example of a situation in which (1) the presence of readily available data and (2) the possibility of deriving potentially interesting conclusions from mining such data can make researchers forget their initial goal--helping developers--and the many potential issues with their analysis (e.g., bias, wrong assumptions, confounding factors, spurious correlations, noise). We argue that researchers should have instead investigated, after the approach became mature and well understood, whether and to what extent statistical fault localization could actually help developers.

## Assessing the Usefulness of a Technique

The best way to assess the practical usefulness of a technique is to put it in the hands of the developers. This is what we did for statistical fault localization [3], whose general process is illustrated in Figure 1. As the figure shows, given a faulty program and a set of test cases for the program, an automated debugging tool based on statistical fault localization whould produce a ranked list of potentially faulty statements. The developers would then inspect these statements one at a time until they find the bug. In this context, the fact of being able to look only at about 10% of the code in a majority of cases is typically considered a good result.

![Statistical fault localization process](statisticaldebugging.png)<br>
_Figure 1: An abstract view of statistical fault localization._

We studied the performance of 34 developers with different levels of expertise as they performed two different debugging tasks and investigated a set of research questions related to the charasteristics of statistical fault localization and its assumptions. In particular, we investigated the following questions:

+ **RQ1**: Do developers who use automated debugging tools will locate bugs faster than programmers who debug without such tools?
+ **RQ2**: Is the performance of developers who use (rank-based) automated debugging tools affected by the rank of the faulty statement?
+ **RQ3**: Is examining a faulty statement in isolation enough for a developer to detect the corresponding bug?
+ **RQ4**: Do developers navigate a list of statements ranked by suspiciousness in order?

Unfortunately, based on our results, the answer to all these questions is no: developers do not perform significantly better when using automated debugging tools that rely on statistical fault localization; the ranking of the faulty statement does not seem to have an effect on the performance of the developers; developers can take a long time to decide whether a statemnt reported as potentially faulty is actually faulty (i.e., looking at the statement is not enough); and developers do not navigate a ranked list of statements in order, going from the most to the least suspicious statement, but rather get annoyed by false positives and give up on the tool after only a few statements.

## Some Reflections

The results we discussed above provide evidence that statistical fault localization, a technique that appears to work well on paper, may not work as well and help developers in practice. The reason for this discrepancy is, in this case, that the technique is based on a set of unrealistic assumptions:

_Assumption #1: Locating a bug in 10% of the code is a good result_. Although reducing the space where to locate a bug to a tenth of the program may sound much better than inspecting the whole program, in practice this may still mean going through a list of thousands of statements, even for a relatively small program.

_Assumption #2: Programmers exhibit perfect bug understanding_. To make things worse, developers cannot see a fault in a line of code by simply looking at that line without any context. On the contrary, we observed that the amount of context necessary to decide whether a statement is faulty can be considerable.

_Assumption #3: Programmers inspect a list linearly and exhaustively_. The assumption that developers would be willing to go through a list of potentially faulty statements one at a time, until they find the actual fault, is also unrealistic. Developers in general have a low tolerance for false positive.

## Summary and Recommendations

We want it to be clear that this chapter is not meant to be a blunt attack on statistical fault localization. As we mentioned above, statistical fault localization was initially a disruptive and promising research direction that only later resulted in much incremental research. Our goal is instead to use the example of statistical fault localization to point out some common pitfalls with research that can be performed by analyzing data sets and drawing conclusions based on this analysis.

We therefore conclude this chapter with a set of recommendations and lesson learned related to our study of the usefulness of statistical fault localization that we hope can be of general value for at least some parts of data analitics research.

+ _Be careful with your assumptions_. Strong assumptions may be fine in the initial stages of research. Such assumptions should however be tested when the research becomes more mature.
+ _Look at the forest, not the trees / do not search under the lamp post_. It is tempting to "play" with the data, especially when there is a great deal of readily available data. One should however always keep in mind the big picture, which we believe is developing techniques that help developers. 
+ _Find causes instead correlations_. Finding correlations is often easy, but correlations can be misleading. Researchers should strive to go beyond correlations and look for causes instead.
+ _Look for actionable findings_. Although "interesting" findings may be a good stepping stone toward more relevant discoveries, this is not necessarily the case. Findings that can be shown to developers and change the way in which developers do things are considerably more valuable.
+ _Perform user studies!_ The best, and maybe only, way to understand whether an approach or a result are actually useful is to perform user studies in settings that are as realistic as possible. This is particularly true for mature approaches, for which analytical evaluations tend to fall short.
+ _Educate (junior) researchers_. Because more senior researchers set the example for junior researchers, it is especially important that they avoid the temptations that characterize the areas in which data abunds and analyzing them is easy.
 
## Acknowledgements
This chapter is heavily based on work [3] that I performed jointly with Chris Parnin (now a faculty member at North Carolina State University).

## References

+ [1] James A. Jones, Mary Jean Harrold, and John T. Stasko, _Visualization of Test Information to Assist Fault Localization_, Proceedings of the International Conference on Software Engineering (ICSE 2002), May 2002, pp. 467-477.
+ [2] 	Ben Liblit, Alex Aiken, Alice X. Zheng, Michael I. Jordan, _Bug Isolation via Remote Program Sampling_, Proceedings of the Conference on Programming Language Design and Implementation (PLDI 2003), May 2003, pp. 141-154.
+ [3] Chris Parnin and Alessandro Orso, _Are Automated Debugging Techniques Actually Helping Programmers_, Proceedings of the International Symposium on Software Testing and Analysis (ISSTA 2011), July 2011, pp 199-209.