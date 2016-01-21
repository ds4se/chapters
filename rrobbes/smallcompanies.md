#Software Analytics for Small Software Companies: More Questions than Answers

*Romain Robbes. DCC, University of Chile*

Software analytics have been shown to be useful for many use cases. Examples are numerous, and many of these are mentioned in this book. Software analytics has also been succesfully applied in the industry. Again, the examples are numerous. But these examples share one characteristic: they come mostly from large software companies. For instance, Microsoft has a dedicated research group studying it’s software engineering practice [1], so does Google, or ABB. However, most software companies are small: Richardson and Wangenheim estimated that 85% of software companies had fewer than 50 employees, as of 2007 [2].

These small companies face a different reality than large software companies. They do not have so many resources to allocate to long-term projects, being instead more focused on the short term. Should software analytics also attempt to address these cases? Should practicioners in these companies take an interest in the topic? If the answers to these questions are far from clear, we bring some elements to the discussion, taking examples from the Chilean software industry as a basis. We particularly focus on the example of Amisoft, a small Chilean software company that succesfully used software analytics [3].

## The reality for small software companies

Small software companies have different factors that must be taken into account in order to successfully apply software analytics. We identified the following main factors:

* Projects taken by small software companies may be smaller and shorter than the ones taken by larger companies, limiting the amount of data available.
* The goals and needs of small software companies may be different than the ones in large software companies.
* Resources in small companies are always very tight.

Despite these factors, software analytics could be very important for these companies. Taking the example of Chile, we know that small software companies suffer from a high mortality. Certainly, analytics could be helpful there.

## Small software companies projects: smaller and shorter

The Diagnostic Report of the Chilean Software and Services Industry mandated by the GECHS (the Chilean Association of Software and Services Companies) reports on the reality faced by 40 software companies in Chile [4]. Among other findings, companies that were working on projects for clients had project durations of six months or less. Service contracts were of similar lengths. Companies developing products did so in a large majority of cases in less than a year. A recent survey by the GEMS project found similar results.

The consequences of this is that shorter projects have necessarily much less data to provide for software analytics approaches. If an approach needs at least two years of data to be effective, it will not be applicable in the context of many software companies. Unfortunately, this evaluation criteria is often not present in the evaluation of many Software Analytics or Mining Software Repostories approaches. Evaluations are generally seen as much more convincing if they involve large-scale projects. 

While a few MSR approaches (such as the work of Zimmermann et al. [5]) did some evaluation of the technique’s performance over time as part of a comprehensive evaluation, it is very uncommon to see this. Further, these approaches did show that a certain amount of time (either measured by amount of time or amount of commits) was necessary for the approaches to reach good performance, telling us that performance with a low amount of data should not be taken as granted, and should definitely be evaluated explicitly. This leads us to formulate this requirement for the design and evaluation of software analytics approaches:

*Software Analytics approaches should consider the cases were little data is available, and be evaluated in these cases, so that practitioners in these situations have an idea of the performance they can expect.*

## Different goals and needs

We know of one Chilean small company, Amisoft, that made use of software analytics [3]. Our interview with them was insightful on the differences in priorities between what a large company such as Microsoft needs, and what a small company such as Amisoft needed. We found the overlap between information needs at Amisoft, and the ones at Microsoft [6], to be narrow: of the 17 indicators found to be of interest at Microsoft by Buse and Zimmermann, only 3 were similar to indicators in use at Amisoft.

Of course, we cannot answer for all companies based on one datapoint. However, we found that project-level indicators were much more interesting for the CEO than low-level indicators as could be found in the software repositories that are often mined. To paraphrase the CEO: “I don’t really have a need for an approach that tells me where the bugs are. I know that the database access component is the most risky already, hence I personally review changes to it already”. Needless to say, actually deploying a defect prediction approach may still have an impact, particularly to reveal other defect-prone modules that are not as prevalent.  

However, the CEO particularly appreciated that the approach that Amisoft implemented, based on following higher-level tasks described in the process that they were using, gave him and his project managers far better visibility in their progress. This helped them react much quicker to delays, and avoid the “heroic” rushes before deadlines that can lead to developer burnout. It also helped them negotiate much more comfortable schedules with their clients, “building in” the estimate the most likely delays, avoiding that the delay be shown to clients.

As such: *Software analytics for small companies may need to reassess what the most optimal data sources and insights needed are.*

Perhaps a systematic treatment of the issue is needed. The work on information needs of Buse and Zimmermann made a long way towards documenting the needs and perceptions of actual software engineers at Microsoft. A similar study in the context of small software companies could lead to a much more accurate view of what practicioners in small companies need.

## What to do about the dearth of data?

We can think of two approaches to address the lack of data for short-term projects. The first is to use finer-grained data: while a single commit in a version control repository gives a single data point, developer interaction data recorded while people use their development tools record hundreds. This can be helpful to paint a higher quality picture of the development sooner, and hence make recommender systems helpful earlier (one of our studies provides evidence of this [7]) . 
Fine-grained interaction data also allows developer to focus on self-improvement via personal feedback. Codealike [8] is a commercial tool geared towards practicioners that collects interaction data from the IDE and the web to provide actionable information to individual developers, and small teams. Codealike uses this data to provide developers dashboards with a variety of information, including analyzing in which activities time was spent, technical debt analysis, and, at the team level, predicting whether an interruption to a given developer will be OK or too disruptive.

The other approach is to use data from other projects, instead of the current project where data might be lacking. Cross-project defect prediction is for instance an active area of research, where significant progress has been made to predict defects on projects that have no or little history [9]. Work has been performed in effort estimation as well (which is a topic probably closer to small companies’ interests than defect prediction). It remains to be seen how practical these approaches are, and whether other tasks highly relevant to small software companies can be solved in the same way.

## What to do on a tight budget?

We'll close this chapter by briefly considering the resources needed to use analytics. Again, as little is known so far, we'll focus on the example of Amisoft. Amisoft's CEO found that the cost of implementing the programme was worthwile in his experience. The upfront cost was relatively high, since a full-time employee (out of 43 at the time) was focused on the project for 3 months, with the CEO himself dedicating significant time (3.5% of the workfoce). Once the the program was set up, the impact on individual employees was estimated to be 1 hour a week of manual data gathering (which could be reduced with more automation), with the full-time employee staying on to consolidate and analyze the data. We also note that this was possible due to the previous effort in the company to formalize the development process: there would not have been anything to measure before that.

In case this appears too high, a lighter-weight entry in analytics would be the individual feedback offered by tools such as Codealike: data collection is entirely automatic, the only thing needed is the discipline to regularly check the dashboards produced by the tool. The only uncertainty is whether insights provided by the tool would align with the insights needed in a small company (they certainly seem to be useful at the developer level).

## References

[1] C. Bird, B. Murphy, N. Nagappan, and T. Zimmermann. Empirical software engineering at Microsoft Research. In Proceedings of CSCW 2010, pages 143–150, 2011.

[2] I. Richardson and C. G. von Wangenheim. Guest editors’ introduction: Why are small software
organizations different? IEEE Software, 24(1):18–22, 2007.

[3] Romain Robbes, René Vidal, María Cecilia Bastarrica: Are Software Analytics Efforts Worthwhile for Small Companies? The Case of Amisoft. IEEE Software 30(5): 46-53 (2013)

[4] Sexto Diagnóstico de la Industria Nacional de Software y Servicios, 2008. http://bligoo.com/media/users/0/32814/files/GECHS-6o_informe_diagnostico.pdf

[5] Thomas Zimmermann, Peter Weißgerber, Stephan Diehl, Andreas Zeller: Mining Version Histories to Guide Software Changes. IEEE Trans. Software Eng. 31(6): 429-445 (2005)

[6] R. P. L. Buse and T. Zimmermann. Information needs for software development analytics. In Proceedings of ICSE 2012, pages 987–996, 2012.

[7] Romain Robbes, Damien Pollet, Michele Lanza: Logical Coupling Based on Fine-Grained Change Information. WCRE 2008: 42-46

[8] Codealike. https://codealike.com

[9] Feng Zhang, Audris Mockus, Iman Keivanloo, Ying Zou: Towards building a universal defect prediction model. MSR 2014: 182-191



