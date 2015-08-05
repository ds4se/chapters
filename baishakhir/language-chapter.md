# What is the effect of programming languages on software quality? 

Before starting a new software project, you might wonder which programming language you should begin with. For example, you might consider writing a Desktop application in C, C++, C#, Objective-C, Java, Python, Ruby, Scala, Go, or even in Haskell, and the list continues. Although developers often choose languages based on their prior experiences or legacy requirements, as reported by Meyerovich et al. [2], the question still remains: "Which programming language should be the right tool for a given job"?  While some of these debates may appear to be tinged with an almost religious fervor, most agree that programming language choice can impact both the coding process and the resulting artifact.

Advocates of strong static typing argue that type inference will catch software bugs early, at compile time; for them, an ounce of prevention is worth a pound of cure. In contrast, advocates of dynamic typing argue that rather than spending a lot of time correcting annoying static type errors, it is better to rely on dynamic typing to catch errors on run time, if they at all arise. Similarly, controversy arises over other language features:  strong vs. weak typing, procedural vs. functional language, managed vs. un-managed memory etc. These debates, however, have largely been of the armchair variety, supported only by anecdotal evidence.

In this book chapter, we tried to shed some empirical light on long withstanding question: “What is the effect of programming languages on software quality?”  It turns out, based on our previous study [1], the impact of programming language on code quality is pretty small. By empirically analyzing 17 most popular languages from GitHub comprising of 728 projects, 63 million lines of code, 1.5 million commits from 29,000 developers, we found only a ``modest" effect of language on code quality.  

## Comparing Languages

Understanding the impact of language on code quality can be challenging because of the number of confounding factors that may influence the outcome, such as language properties, usage domains, and developer's quality. Other well-known process metrics like code size, team size, and age/maturity also impact the result. 

One way to minimize the effect of such confounding factors is to conduct controlled study. For instance, some recent studies monitored student while programming in different languages and then compared outcomes such as development effort and program quality [7, 15, 12].  However, The tasks completed in such studies are necessarily limited and don’t emulate real world development. 

Fortunately, we can now study these questions over large body of real-world software projects. GitHub contains many projects in multiple languages that substantially vary across size, age, and number of developers. Each project repository provides a detailed record, including contribution history, project size, authorship, and defect repair. We then use a variety of tools to study the effects of language features on defect occurrence. Our approach is best described as mixed-methods, or triangulation [5] approach; we use text analysis, clustering, and visualization to confirm and support the findings of a quantitative regression study.




## GitHub Mining 

As I mentioned earlier, such large-scale observational study has several confounding factors, many of them may not be even directly observed in repository history. For example, quality of software may depend on its software engineering practices, development environment, developer's knowledge and quality, etc. It is important to reduce such unforeseen effects as much as possible. To reduce such effects, one should be careful to choose study subjects. 

For instance, we focus on projects that are written in somewhat important languages, widely popular to open source community, and currently under active development. Such choice helped us to reduce effect of unmaintained code coming from unskillful development practices. We followed the following steps:

•	First, we identified top 16 languages from GitHub: C, C++, C#, Go, Java, CoffeeScript, JavaScript, Ruby, Php, Python, Perl, Clojure, Erlang, Haskell, and Scala. We also included TypeScript, a type superset of JavaScript. 
•	For each selected language, we chose most popular 50 projects written primarily in that language. For example, the top 3 projects in C are Linux, Git, and Php-src.
•	For each project, its entire evolutionary history was analyzed. In particular, we retrieved each file commit and identified the language, developer, change size, and date associated with it. We also identified whether the commit is associated with a bug fix by searching for error related keywords: ‘error’, ‘bug’, ‘fix’, ‘issue’, ‘mistake’, ‘incorrect’, ‘fault’, ‘defect’ and ‘flaw’ in the commit log, similar to a prior study [18]. 
•	Finally, we aggregated the commit level data to per project per language level, since one project may have presence of multiple languages. 


## Statistical Analysis

To understand the effect of language on code quality, one can model the number of bugfix commits against language as factor using regression. Number of bugfix commits can be a measure of software quality, as typically number of bugfix is highly correlated to number of defects [cite]. However, one has to be careful to control for other project specific dependent factors, such as number of commits, project age, change size, and number of developers, because they are likely to influence the outcome.

In our study we used negative binomial regression, or NBR to model the counts of project attributes such as the number of commits. NBR is a type of generalized linear model used to model non-negative integer responses [4]. Each (language, project) pair is a row in our regression and is viewed as a sample from the population of open source projects. We employ effects, or contrast, coding in our study to facilitate interpretation of the language coefficients [4]. Weighted effects codes allow us to compare each language to the average effect across all languages while compensating for the unevenness of language usage across projects [23].

We log-transform dependent count variables as it stabilizes the variance and usually improves the model fit [4]. We verify this by comparing transformed with non-transformed data using the AIC and Vuong’s test for non-nested models. To check that excessive multi-collinearity is not an issue, we compute the variance inflation factor (VIF) of each dependent variable in all of the models with a conservative maximum value of 5 [4]. We also check for and remove high leverage points through visual examination of the residuals vs leverage plot for each model, looking for both separation and large values of Cook’s distance.






## Are some languages more defect-prone than others? 

The regression analysis shows that languages can be broadly categorized into three groups. First are those with insignificant regression coefficients – these languages may behave similarly to the average or they may have wide variance. Perl, Go, Java, Erlang, C#, JavaScript, TypeScript, and CoffeeScript follow in this category. 
The regression coefficients of other two groups are statistically significant and either positive or negative. The languages with negative coefficients imply that these languages are less likely than the average to be bug prone. Closure, Haskell, Scala, and Ruby fall in this category. In contrast, the languages with positive coefficients, such as C, C++, Objective C, Python, and PHP, are associated with a greater number of defect fixes. 
While the observed relationships are statistically significant, the effects are quite small. Analysis of deviance reveals that language accounts for less than one percent of the total explained deviance. All the other project specific control variables have positive regression coefficient and play much significant role in producing defects. Thus, one should take care not to overestimate the impact of language on defects.
## Categorizing Languages

Now that we have seen individual language choice may not have much influence on code quality, one may wonder whether different language properties relate to defects. In order to do so, let’s first categorize the languages into different classes based on their properties. Here we carefully chose language classes that are thought to influence language quality [7, 8, 12]. 
1.	Programming Paradigm: It indicates whether the project is written in a procedural, functional, or scripting language. 
2.	Compilation Class: It indicates static or dynamic typing.
3.	Type Class: It classifies languages based on strong and weak typing, i.e., on whether the language admits type-confusion. A program introduces type-confusion when it attempts to interpret an operand of specific type T1, as an instance of a different type T2 and T1 and T2 are not related by inheritance. A language is classified as strongly typed if it explicitly detects type confusion and reports it. In contrast, a language is weakly typed if type-confusion can occur silently (undetected), and may eventually cause errors that are difficult to localize. For example, in a weakly typed language like JavaScript adding a string to a number is permissible (e.g., ‘5’ + 2 = ‘52’), while such an operation is not permitted in strongly typed Python. 
4.	Memory Class: It indicates whether the language requires developers to manage memory. 

## Which language properties relate to defects? 

From similar regression analysis as discussed above, we found that for every 100 bugs that are produced, on average Strong typing produces 4 fewer bugs than weak typing, Functional Language produces 16 fewer bugs than Procedural Language, and among Functional languages, Static Typing produces 6 fewer bugs than Dynamic Typing. 
As with language and defects, the relationship between language class and defects is based on a small effect. The deviance explained is similar, albeit smaller, with language class explaining much less than one percent of the deviance. 




%## Domain vs. Language Choice

%## Summary




%## References

1.  B. Ray, D. Posnett, P. Devanbu, and V. Filkov, "A Large Scale Study of Programming Languages and Code Quality in Github", FSE 2014

2. Meyerovic




