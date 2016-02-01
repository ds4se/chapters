# A Large Ecosystem Study to Understand the Effect of Programming Languages on Code Quality
 _Baishakhi Ray, University of Virginia_

 _Daryl Posnett, University of California, Davis_


Developers are often tasked with choosing a language for a project. Although such decisions are usually based on prior experiences or legacy requirements, as reported by Meyerovich et al. [2], language choice is in general believed to impact the code quality. For example, statically typed languages catch type errors early, at compile time, while dynamically typed languages catch errors at run time if the errors at all arise. Other language properties like strong vs. weak typing, procedural vs. functional language, managed vs. unmanaged memory, etc. can also influence the number of bugs in the resulting code.  

In this book chapter, we empirically investigate the impact of language choice on code quality. We analyzed the 17 most popular languages from GitHub including C, C++, C#, Objective-C, Go, Java, Ruby, Php, Python, Perl, Javascript, CoffeeScript, TypeScript, Clojure, Erlang, Haskell, and Scala across 728 GitHub projects. Based on our previous study [1] we found that the overall effect of language on code quality is rather ``modest." 

## Comparing Languages

Comparing programming languages across multiple projects is a non-trivial task. Language choice may depend on many things. For what purpose are you choosing the language, what are the underlying conditions, how big is your team, or who are the programmers. More than that, though, how can the language itself matter? It is the properties of languages that are important.
To estimate the language effect on code quality, all these factors need to be considered. 

One method for answering these types of question is the controlled study.  For example, recent studies monitored students while programming in different languages and then compared outcomes such as development effort and program quality [3].  Although such controlled studies are precise, they are typically limited in their tasks and context. Studies that employ students to execute tasks that can be completed in a short period are often criticized, sometimes unfairly [5], as not emulating real world development.  

Another alternative is the observational study on a small set of chosen projects. For example, 
Bhattacharya et al.[4] studied four projects developed in both C and C++ and find that the software components developed in C++ are in general more reliable than C. While less limited than the controlled study, such data often suffers from lack of diversity. Further, if it is collected from the same organization, e.g., the Apache Software Foundation, it might be tainted with organizational bias. 

What we can do, however, is to seek data sources that naturally capture diversity among software developers, organizations, software languages, and projects [1]. The availability of a large number of open source projects written in multiple languages, and collected in software forges such as GitHub, facilitate the study of questions like “which language is more defect prone” in an observational setting.   

## Study Design & Analysis

GitHub projects vary substantially across size, age, and number of developers. Each project repository provides a detailed record, including contribution history, project size, authorship, and defect repair. This is great because we want diversity in our dataset. Diversity helps us make the case for generalizability [6]. 

This same diversity, however, presents challenges. For example, quality of software may depend on  software engineering practices, development environment, developer knowledge, etc. It is important to reduce such unforeseen effects as much as possible. For instance, we focus on projects that are currently under active development, that are widely popular in the open source community, and that are written in somewhat important languages. These choices helped us to mitigate the effect of unmaintained code coming from unskillful development practices. We further excluded some languages from a project that have too few examples within the repository. This ensures that the studied languages have significant activity within the projects.

Finally, we analyzed the 17 most popular languages from GitHub comprising 728 projects, 63 million lines of code, 1.5 million commits from 29,000 developers. Without such a large software ecosystem, it would be challenging to obtain enough data to statistically compare development across 17 different languages. 

To understand the effect of these languages on code quality, we modelled the number of bugfix commits against language. A number of confounding factors including code size, team size, and age/maturity were further included in the study design to capture the variance attributable to them. Failure to include important metrics will lead to spurious relationships with the outcome. The classic example of this is code size. Code that is larger, will, on average, contain more defects. Therefore, languages that are favored in larger projects may appear to be more defect prone than other languages. 

Moreover, comparing 17 different languages can be messy. What we want to say is that language X causes N additional defects over language Y. However, attempting to compare all of the languages to each other would complicate interpretation. Instead, we compare each language to some baseline. We weight each language with respect to the number of examples written in each language to compare languages fairly. We then compare it to the average number of defects across all languages in order to compare the impact of each language against a common background. 


## Results 
Finally, using a combination of regression modeling, text analytics, and visualization, we examined the interactions of language, language properties, application domain, and defect type.  We found that 

1. Functional languages (e.g., Clojure, Erlang, Haskell, Scala) produce are slightly better, i.e., produce less bugs, than procedural languages (e.g., C, C++, C#, Objective-C, Java, Go); strong typing (e.g., C#, Java, Python, etc.) is somewhat better than weak typing (e.g., C, C++, etc.), and static typing (e.g., C, C++, C#, etc.) is modestly better than dynamic (e.g., JavaScript, Python, Perl, etc.).  
2. Defect proneness of languages in general is not associated with software domains, i.e,  the type of project does not mediate this relationship to a large degree. 
3. Also, languages are more related to individual bug categories (memory, concurrency, etc.) than bugs overall. 

The modest effects arising from language choices on code quality are overwhelmingly dominated by the other process factors that we have controlled for in our regression models.  We hasten to caution the reader that even these modest effects might quite possibly be due to other, intangible process factors, e.g., developers’ expertise, the preference of certain personality types for functional, static and strongly typed languages. 

## Summary 

We have presented a large-scale study of the impact of programming language choice on software quality. The Github data we used is characterized by its complexity and the variance along multiple dimensions of language, language type, usage domain, amount of code, sizes of commits, and the various characteristics of the many issue types. We report that programming language choice helps to minimize a certain type of errors like memory errors, concurrency errors, etc. However, as opposed to common belief, in general, a language choice does not impact software quality much. 


















## References
 
1. Ray, Baishakhi, Daryl Posnett, Vladimir Filkov, and Premkumar Devanbu. "A large scale study of programming languages and code quality in github." InProceedings of the 22nd ACM SIGSOFT International Symposium on Foundations of Software Engineering, pp. 155-165. ACM, 2014.
2. Meyerovich, Leo A., and Ariel S. Rabkin. "Empirical analysis of programming language adoption." In ACM SIGPLAN Notices, vol. 48, no. 10, pp. 1-18. ACM, 2013.
3. Hanenberg, Stefan. "An experiment about static and dynamic type systems: Doubts about the positive impact of static type systems on development time." In ACM Sigplan Notices, vol. 45, no. 10, pp. 22-35. ACM, 2010.
4. Bhattacharya, Pamela, and Iulian Neamtiu. "Assessing programming language impact on development and maintenance: A study on C and C++." In Software Engineering (ICSE), 2011 33rd International Conference on, pp. 171-180. IEEE, 2011.
5. Murphy-Hill, Emerson, Gail C. Murphy, and William G. Griswold. "Understanding context: creating a lasting impact in experimental software engineering research." In Proceedings of the FSE/SDP workshop on Future of software engineering research, pp. 255-258. ACM, 2010.
6. Nagappan, Meiyappan, Thomas Zimmermann, and Christian Bird. "Diversity in software engineering research." In Proceedings of the 2013 9th Joint Meeting on Foundations of Software Engineering, pp. 466-476. ACM, 2013.
