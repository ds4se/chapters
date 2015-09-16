#Software Analytics for Small Software Companies: More Questions than Answers

*Romain Robbes. DCC, University of Chile*

Software analytics have been shown to be useful for many use cases. Examples are numerous, and many of these are mentioned in this book. Software analytics has also been succesfully applied in the industry. Again, the examples are numerous. But these examples share one characteristic: they come mostly from large software companies. For instance, Microsoft has a dedicated research group studying it’s software engineering practice [1], as does ABB [2], while Google employs at least one hundred full-time engineers working on improving their tools based on analytics [3], to name a few.

Needless to say, helping large software companies is a very useful goal. These companies work on large and, challenging projects. They also have sizeable resources, such as, as mentioned above, being able to employ 100 engineers on their improvement projects.

However, most software companies are small. Studies have shown that in several countries, a majority or a large minority of the companies have a limited number of employees. In 2007, Richardson and Wangenheim estimated that 85% of software companies had fewer than 50 employees [4]. In specific countries, it has been found that 70% of Brazilian software companies have less than 20 employees [5]; in Canada, 78% of software companies have less than 25 employees [6]; in the US, 94% of software companies have less than 50 employees [7]; Finally, a recent survey in Chile found that the majority of companies has less than 50 employees as well [8]. Hence we expect this phenomenon to be global, and perhaps increasing given the growing popularity of mobile applications and web services nowadays, where the barrier to entry is much lower.

These small companies face a different reality than large software companies. They do not have so many resources to allocate to long-term projects, being instead more focused on the short term. Should software analytics also attempt to address these cases? If the answer is far from clear, we bring some elements to the discussion, taking examples from the Chilean software industry as a basis.

## The reality for small software companies

Small software companies have different factors that must be taken into account in order to successfully apply software analytics. We identified the following two main factors:

* Projects taken by small software companies may be smaller and shorter than the ones taken by larger companies, limiting the amount of data available.
* Most importantly, the goals and needs of small software companies may be different than the ones in large software companies.

Despite these factors, software analytics could be very important for these companies. Taking the example of Chile, we know that small software companies suffer from a high mortality. Certainly, analytics could be helpful there.

## Small software companies projects: smaller and shorter

The Diagnostic Report of the Chilean Software and Services Industry mandated by the GECHS (the Chilean Association of Software and Services Companies) reports on the reality faced by 40 software companies in Chile [9]. Among other findings, companies that were working on projects for clients had project durations of six months or less. Service contracts were of similar lengths. Companies developing products did so in a large majority of cases in less than a year. A recent survey by the GEMS project (that is still under analysis, but the basis of [8]), found similar results.

The consequences of this is that shorter projects have necessarily much less data to provide for software analytics approaches. If an approach needs at least two years of data to be effective, it will not be applicable in the context of many software companies. Unfortunately, this evaluation criteria is often not present in the evaluation of many Software Analytics or Mining Software Repostories approaches. Evaluations are generally seen as much more convincing if they involve large-scale projects. This skews the evaluations presented in papers towards these projects, as demonstrated by Nagappan et al. [10].

While a few MSR approaches (such as the works of Zimmermann et al. [11], and Kim et al. [12]) did some evaluation of the technique’s performance over time as part of a comprehensive evaluation, it is very uncommon to see this. This leads us to formulate this requirement for the design and evaluation of software analytics approaches:

*Software Analytics approaches should consider the cases were little data is available, and be evaluated in these cases, so that practitioners in these situations have an idea of the performance they can expect.*

Further, the approaches by Zimmermann and Kim ([11,12]) did show that a certain amount of time (either measured by amount of time or amount of commits) was necessary for the approaches to reach good performance. This tells us that performance with a low amount of data should not be taken as granted, and should definitely be evaluated explicitly.


## Different goals and needs

We know of one Chilean small company, Amisoft, that made use of software analytics [13]. Our interview with them was insightful on the differences in priorities between what a large company such as Microsoft needs, and what a small company such as Amisoft needed. We found the overlap between information needs at Amisoft, and the ones at Microsoft [14], to be narrow: of the 17 indicators found to be of interest at Microsoft by Buse and Zimmermann, only 3 were similar to indicators in use at Amisoft [13].

Of course, we cannot answer for all companies based on one datapoint. However, we found that project-level indicators were much more interesting for the CEO than low-level indicators as could be found in the software repositories that are often mined. To paraphrase the CEO: “I don’t really have a need for an approach that tells me where the bugs are. I know that the database access component is the most risky already, hence I personally review changes to it already”. Needless to say, actually deploying a defect prediction approach may still have an impact, particularly to reveal other defect-prone modules that are not as prevalent.  

However, the CEO particularly appreciated that the approach that Amisoft implemented, based on following higher-level tasks described in the process that they were using, gave him and his project managers far better visibility in their progress. This helped them react much quicker to delays, and avoid the “heroic” rushes before deadlines that can lead to developer burnout. It also helped them negotiate much more comfortable schedules with their clients, “building in” the estimate the most likely delays, avoiding that the delay be shown to clients.

As such: *Software analytics for small companies may need to reassess what the most optimal data sources and insights needed are.*

Perhaps a systematic treatment of the issue is needed. The work on information needs of Buse and Zimmermann, and the recent work of Begel and Zimmermann [15] on what research questions researchers should tackle, made a long way towards documenting the needs and perceptions of actual software engineers at Microsoft. Replicating these studies in the context of small software companies could lead to very instructive results.

## What to do about the dearth of data?

We can think of two approaches to address the lack of data for short-term projects. The first is to use finer-grained data: while a single commit in a version control repository gives a single data point, developer interaction data recorded while people use their development tools record hundreds. This can be helpful to paint a higher quality picture of the development sooner, and hence make recommender systems helpful earlier. We have initial evidence of this, in that evaluating logical coupling based on fine-grained change data is more precise than on coarse grained change data, and can be used to predict later coarse-grained logical coupling [16]. This early detection of logical coupling can be used as an early warning of potential future quality issues. 

Tools recollecting fine-grained interaction data, such as Codealike [17], are starting to become mainstream, and may be interesting in the case of small software companies. This applies only to companies that value these technical insights, which, as seen above, might not always be their first priority.

The other approach is to use data from other projects, instead of the current project where data might be lacking. Cross-project defect prediction is for instance an active area of research, where significant progress has been made to predict defects on projects that have no or little history [18]. Work has been performed in effort estimation as well (which is a topic probably closer to small companies’ interests than defect prediction). It remains to be seen how practical these approaches are, and whether other tasks highly relevant to small software companies can be solved in the same way.

## References

[1] C. Bird, B. Murphy, N. Nagappan, and T. Zimmermann. Empirical software engineering at microsoft research. In Proceedings of CSCW 2010, pages 143–150, 2011.
[2] ABB Software Development Improvement Program (SDIP).  
http://new.abb.com/about/technology/sdip
[3] A. Kumar. Qcon talk: Development at the speed and scale of Google, 2010. 
http://www.infoq.com/presentations/Development-at-Google
[4] I. Richardson and C. G. von Wangenheim. Guest editors’ introduction: Why are small software
organizations different? IEEE Software, 24(1):18–22, 2007.
[5] C. G. von Wangenheim, A. Anacleto, and C. F. Salviano. Helping small companies assess software processes. IEEE Software, 23(1):91– 98, 2006.
[6] C. Y. Laporte, S. Alexandre, and A. Renault. Developing international standards for very small
enterprises. IEEE Computer, 41(3):98–101, 2008.
[7] M. E. Fayad, M. Laitinen, and R. P. Ward. Software engineering in the small. Commun. ACM, 43(3): 115–118, 2000.
[8] M. Radnic. Así son las empresas de software en Chile. El Mercurio, 2014. http://www.economiaynegocios.cl/noticias/noticias.asp?id=182711
[9] Sexto Diagnóstico de la Industria Nacional de Software y Servicios, 2008. http://bligoo.com/media/users/0/32814/files/GECHS-6o_informe_diagnostico.pdf
[10] Meiyappan Nagappan, Thomas Zimmermann, Christian Bird: Diversity in software engineering research. ESEC/SIGSOFT FSE 2013: 466-476
[11] Thomas Zimmermann, Peter Weißgerber, Stephan Diehl, Andreas Zeller: Mining Version Histories to Guide Software Changes. IEEE Trans. Software Eng. 31(6): 429-445 (2005)
[12] Sunghun Kim, E. James Whitehead Jr., Yi Zhang: Classifying Software Changes: Clean or Buggy? IEEE Trans. Software Eng. (TSE) 34(2):181-196 (2008)
[13] Romain Robbes, René Vidal, María Cecilia Bastarrica: Are Software Analytics Efforts Worthwhile for Small Companies? The Case of Amisoft. IEEE Software 30(5): 46-53 (2013)
[14] R. P. L. Buse and T. Zimmermann. Information needs for software development analytics. In Proceedings of ICSE 2012, pages 987–996, 2012.
[15] Andrew Begel, Thomas Zimmermann: Analyze this! 145 questions for data scientists in software engineering. ICSE 2014: 12-13
[16] Romain Robbes, Damien Pollet, Michele Lanza: Logical Coupling Based on Fine-Grained Change Information. WCRE 2008: 42-46
[17] Codealike. https://codealike.com
[18] Feng Zhang, Audris Mockus, Iman Keivanloo, Ying Zou: Towards building a universal defect prediction model. MSR 2014: 182-191



