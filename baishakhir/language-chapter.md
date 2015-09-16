# A Large Ecosystem Study to Understand the Effect of Programming Languages on Code Quality
 _Baishakhi Ray, University of Virginia_

 _Daryl Posnett, University of California, Davis_

Developers are often tasked with choosing a language for a project, but, are there consequences for this choice that can be traced directly to the programming language? Are some languages more defect prone than others? Although such choices are often based on prior experiences or legacy requirements, as reported by Meyerovich et al. [2], in fact, language choice depends on many things. For what purpose are you choosing the language, what are the underlying conditions, how big is your team, or who are the programmers. More than that, though, how can the language itself matter? It is the properties of languages that are important.
Thus, to estimate the language effect on code quality, all these factors need to be considered. 

One method for answering these types of question is the controlled study.  For example, recent studies monitored students while programming in different languages and then compared outcomes such as development effort and program quality [3].  Although such controlled studies are precise, they are typically limited in their tasks and context. Studies that employ students to execute tasks that can be completed in a short period are often criticized, sometimes unfairly [5], as not emulating real world development.  

Another alternative is the observational study on a small set of chosen projects. For example, 
Bhattacharya et al.[4] study four projects developed in both C and C++ and find that the software components developed in C++ are in general more reliable than C. While less limited than the controlled study, such data often suffers from lack of diversity. Further, if it is collected from a single large umbrella, e.g., the Apache Software Foundation, it might be tainted with organizational bias. 

What we can do, however, is to seek data sources that naturally capture diversity among software developers, organizations, software languages, and projects [1]. The availability of a large number of open source projects written in multiple languages, and collected in software forges such as GitHub, facilitate the study of questions like “which language is more defect prone” in an observational setting.   

## Study Design for Large Ecosystem Data

GitHub projects vary substantially across size, age, and number of developers. Each project repository provides a detailed record, including contribution history, project size, authorship, and defect repair. This is great because we want diversity in our dataset. Diversity helps us make the case for generalizability [6]. 

This same diversity, however, presents challenges. For example, quality of software may depend on  software engineering practices, development environment, developer knowledge, etc. It is important to reduce such unforeseen effects as much as possible. The openness of GitHub, however, presents a double edge sword. Yes, we have access to  more data, but, unfortunately, much of it may be low quality and may need to be excluded. 

For instance, we focus on projects that are currently under active development, that are widely popular in the open source community, and that are written in somewhat important languages. These choices helped us to mitigate the effect of unmaintained code coming from unskillful development practices. We further excluded some languages from a project that have too few examples within the repository. This ensures that the studied languages have significant activity within the projects.

We analyzed the 17 most popular languages from GitHub comprising 728 projects, 63 million lines of code, 1.5 million commits from 29,000 developers. Without such a large software ecosystem, it would be challenging to obtain enough data to statistically compare development across 17 different languages. 

## Analysis of Observational Data 

To understand the effect of language on code quality, one can model the number of bugfix commits against language. However, this can be challenging because of the number of confounding factors that may influence the outcome, such as code size, team size, and age/maturity. In an observational setting, we do not have the ability to control or define metrics these process metrics. In a controlled study, the researcher dictates, many of these properties. For example, code size will have a small variance if all study participants are creating an exemplar of the same project. 

Since these metrics will impact the result, they must  be included in the study design to capture the variance attributable to them. Failure to include important metrics will lead to spurious relationships with the outcome. The classic example of this is code size. Code that is larger, will, on average, contain more defects. Therefore, languages that are favored in larger projects may appear to be more defect prone than other languages. 

Comparing 17 different languages can be messy. What we want to say is that language X causes N additional defects over language Y. However, attempting to compare all of the languages to each other would complicate interpretation. Instead, we compare each language to some basis. Some studies facilitate this more readily than others. For example, if we wanted to compare team productivity at remote locations to team productivity at company headquarters, we could use company headquarters as a basis for comparison.  Each team would then be seen as more or less productive than headquarters. With languages, however, the concept of a base language with which we compare all others doesn’t make sense. Instead we weight each language with respect to the number of examples written in each language to compare languages fairly. We then compare it to the average number of defects across all languages in order to compare the impact of each language against a common background. 

## Results 
Finally, using a combination of regression modeling, text analytics, and visualization, we examined the interactions of language, language properties, application domain, and defect type.  We found that functional languages are slightly better than procedural languages, strong typing is somewhat better than weak typing, and static typing is modestly better than dynamic.  Further, defect proneness of languages in general is not associated with software domains. Also, languages are more related to individual bug categories (memory, concurrency, etc.) than bugs overall. The modest effects arising from language coefficients are overwhelmingly dominated by the other process factors that we have controlled for in our regression models.  We hasten to caution the reader that even these modest effects might quite possibly be due to other, intangible process factors, e.g., the preference of certain personality types for functional, static and strongly typed languages. 

## Summary 

Large Scale Ecosystem studies can be used to validate some commonly held beliefs about software engineering practices. But you have to be careful about:

* Sample the projects carefully to test your hypothesis. 
* Carefully control for parameters that may impact the outcome.
* Structure your model to facilitate interpretation. 

Following the above we report that programming language choice helps to minimize a certain type of errors like memory errors, concurrency errors, etc. However, as opposed to common belief, in general, a language choice does not impact software quality much. We hope such data-driven insight will pave the path for future research direction.


## References
 
1. Ray, Baishakhi, Daryl Posnett, Vladimir Filkov, and Premkumar Devanbu. "A large scale study of programming languages and code quality in github." InProceedings of the 22nd ACM SIGSOFT International Symposium on Foundations of Software Engineering, pp. 155-165. ACM, 2014.
2. Meyerovich, Leo A., and Ariel S. Rabkin. "Empirical analysis of programming language adoption." In ACM SIGPLAN Notices, vol. 48, no. 10, pp. 1-18. ACM, 2013.
3. Hanenberg, Stefan. "An experiment about static and dynamic type systems: Doubts about the positive impact of static type systems on development time." In ACM Sigplan Notices, vol. 45, no. 10, pp. 22-35. ACM, 2010.
4. Bhattacharya, Pamela, and Iulian Neamtiu. "Assessing programming language impact on development and maintenance: A study on C and C++." In Software Engineering (ICSE), 2011 33rd International Conference on, pp. 171-180. IEEE, 2011.
5. Murphy-Hill, Emerson, Gail C. Murphy, and William G. Griswold. "Understanding context: creating a lasting impact in experimental software engineering research." In Proceedings of the FSE/SDP workshop on Future of software engineering research, pp. 255-258. ACM, 2010.
6. Nagappan, Meiyappan, Thomas Zimmermann, and Christian Bird. "Diversity in software engineering research." In Proceedings of the 2013 9th Joint Meeting on Foundations of Software Engineering, pp. 466-476. ACM, 2013.
