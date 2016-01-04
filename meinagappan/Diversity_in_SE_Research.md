# Diversity in Software Engineering Research

Authors: Harold Valdivia-Garcia and Meiyappan Nagappan

## Introduction

With the popularity and availability of OSS projects, SE researchers have made many advances in understanding how software is developed. However, in Software Engineering (SE) Research like in any other scientific field, it is always desirable to produce results, techniques and tools that can apply to a large (or all if possible) number of software projects. Past SE studies evaluate the hypothesis on a small sample of OSS projects that are out there in the world. More recently, an increasing number of SE researchers have started examining their hypothesis on larger datasets. The aim of the large scale studies are to increase the generality of the research studies. However, generality of results may not be achieved if the sample of projects chosen for evaluation are homogeneous in nature and not diverse with respect to the entire population of SE projects.

To better understand the challenge of sampling, consider a researcher who wants to study a hypothesis about distributed development in a large number of projects in an effort to increase generality. Now, consider two possible strategies to get the sample of projects:

* The researcher goes to json.org and select 20 projects (all of the JSON parsers) that cover a wide variety of programming languages (Java, C#, Python, Ruby, Perl, etc). Then, any findings will not be representative because of the narrow range of functionality of the projects in the sample.

* The researcher goes to gnu.org and select 20 projects (all of them written in C) that cover a wide range of domains (e.g., compilers, dbms, editors, games, web browser, etc). Then, any findings will not be representative because of the narrow range of languages of the projects in the sample.

These two situations are extreme cases, but it helps us to see the importance of systematically selecting the sample of appropriate projects for an empirical study. In this chapter, we present the initial work done on Diversity and Representativeness in SE research. We first define what we mean by diversity and representativeness in SE research. Then, we present: (a) a way to assess the quality of a given sample of projects with respect to Diversity and Representativeness and (b) a selection technique that allows one to tailor a sample with high Diversity and Representativeness.

## What is Diversity and Representativeness?

Diversity and Representativeness are two complementary aspects of the quality of a sample selected from a population. A **diverse sample** contains members of every subgroup in the population and within the sample the subgroups have roughly equal size. In a **representative sample** the size of each subgroup in the sample is proportional to the size of that subgroup in the population. For example, if the population is comprise by two subgroups: 400 members of type X and 100 members of type Y, then a diverse sample would be 50X and 50Y. On the other hand, a representative sample would be 40X and 10Y.

* A large set of projects in a domain are defined as the universe. Examples of SE universes are: all open-source projects, all web applications, all mobile phone ap- plications, all java applications, etc.
* Each project within a universe is characterized by one or more dimensions. Ex- amples of dimensions are: size in LOC, main programming language, number of developers, rating, price, etc. The subset of dimensions that are relevant for research topic are referred to as the space of the research topic.
* For each dimension d in the space of the research topic, a similarity function is de- fined: similard(p1, p2) → {0,1} that decides whether projects p1 and p2 are similar at dimension d. The collection of similarity functions in the space are referred to as the configuration of the space. Now, two projects p1 and p2 are similar, if all their dimensions are similar or *similar(p1, p2) = ∏<sub>d</sub> similard(p1, p2)*.

Based on the definitions described above, the sample coverage of the projects P for a given universe of projects U is computed as follows:
*coverage(P) = |U<sub>p∈P</sub>{q|similar(p,q)}| / |U|*

Depending on the research studies, the universe, space and similarity function can vary. In fact, it is up to the researcher to define the most suitable similarity function for her/his research topic (space) and target population (universe). In addition, it is also important discuss the context in which the coverage was computed. The research should always keep in mind these questions: What projects, is the research intending to be relevant for (universe)? What criteria matter for findings to hold for other projects (space, configuration)?

## What can we do about it?

Now that we know how to assess the coverage of a given sample, the next step is to learn how to systematically tailor a sample with maximum coverage. The selection technique is a hybrid strategy that combines ideas from Diversity and Representativeness. The main parts of the technique can be summarized as follows:
* Takingideasfromdiversity,identifytheneighborhoods(subgroups)ofallprojects in the population. Here, it is important to note that: if two projects are similar, their neighborhood will overlap each other.
* Taking ideas from representativeness, select the project based on the size of their neighborhood not yet covered by the sample. With the “not yet covered” condition, the projects in the sample are ensured to not share neighborhoods.
* For selecting a sample of K projects with high coverage, the previous step is repeated at most K times.

A detailed description of the algorithms to compute the sample-selection and the sample-coverage can be found in prior work [Nagappan et al. 2013]. Additionally, an R implementation of the technique is provided in the [online repository](http://sailhome.cs.queensu.ca/replication/representativeness). This way, the interested reader can easily use them either in her/his research or to complement the reading of the present chapter.

## Evaluation

### Evaluating the Sample Selection Technique

All the active projects monitored by the OpenHub platform (formerly Ohloh) was considered as the universe. The universe consisted of a total of 20,028 projects. For the purpose of the demonstration, the ‘comparison features’ in OpenHub was used as the dimensions of the space. More precisely, the data for 7 dimensions: language, size in LOC, # contributors, churn, # commits, project-age and project-activity was extracted.

The experiment shows that the best sample with 100% of coverage has 5,030 projects. A deeper analysis of the top 15 projects with the highest coverage in the sample show that they are very small projects (< 1000 LOC) written mostly in scripting languages. This result also counters a common criticism of some software engineering research: some people expect that research always has to scale to large software and pay less attention to smaller projects

### Evaluating the Sample Coverage Score

For our second experiment, the sample coverage of projects from papers in over two years of two SE conferences was computed. Although, 635 unique projects was found in the papers, only 207 projects could be mapped to the universe of OpenHub projects.

The experiment showed that these 207 projects studied in papers at the two SE conferences covered 9.15% of the OpenHub population. At a first glance this score seems low, but one has to keep in mind that (a) it is based on strict notion of coverage; and (b) the relevant target universe may be different for each paper and therefore different from OpenHub.

## Recommendations

So far, based on the results from past work, the reader may be tempted to think that studies with low coverage does not contribute to much to the body of knowledge in SE. On the contrary, we think that Coverage scores do not increase or decrease the importance of research, but rather enhance our ability to reason about it and understand the context under which the results are applicable.

In SE research it is common practice to have a section that summarizes the characteristics of the studied projects. We think that this section is the appropriate place to report the coverage of such projects and discuss the target population to be researched (universe) as well as the dimensions relevant for the research (space).

## References
[Nagappan et al. 2013] Nagappan, M., Zimmermann, T., and Bird, C. (2013). Diversity in software engineering research. In Proceedings of the 2013 9th Joint Meeting on Foundations of Software Engineering - ESEC/FSE 2013, pages 466 - 476. ACM Press.
