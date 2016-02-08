# How the Release Process Impacts your Software Analytics

Transcript of a recent meeting with an anonymous grad student:

*student:*  ... and then I built the oracles for our defect prediction models. I was able to find defects for 3 major releases of Mozilla Firefox!

*me:* Nice, so how did you determine what release a defect belonged to?

*student:*  Easy, I compared the date on which the defect was reported, so all defects reported within 3 months after the release date are post-release defects of that release.

*me:* Hmm, and how did you determine which code changes to use for training the prediction model?

*student:* Similarly, I used all the code changes in the version control system within 6 months before the release date!

*me:* 6 months, eh? Did you know that Firefox has a new release every 6 **weeks**?

*student:* ...


This student apparently did not make any real mistake, in fact he/she had done a great job reading the major papers on defect prediction and applying their evaluation methodology on our own research project. Basically, a file-level defect prediction model aims to relate characteristics of the source code files of a software release to the probability that those files would still contain a defect after the release. Testers could then use such a model for an upcoming release to focus only on those files predicted to be the most defect-prone.

Training and testing a defect prediction model requires at least two releases with known post-release defects. Since (by definition) no data is available about defects that have **not** been reported by users, only those defects recorded in the analyzed project's issue repository are considered. Given such defect reports, a prediction model can be trained and evaluated once it is known (1) for which release a defect has been reported and which source code files were involved, and (2) which code changes are part of each release under study.

Unfortunately, steps (1) and (2) are not as straightforward as one might think, and require thorough knowledge of the release process used by the project being studied. While this chapter illustrates this impact of of the release process in the context of file-based defect prediction, the underlying ideas and warnings can impact any form of defect prediction or even software analytics in general!


## Linking Defect Reports and Code Changes to a Release

Ideally, each reported defect should specify what release it was found in. However, in many cases only the date on which the defect was reported is available and, even if a defect's release would have been recorded, one still needs to identify which files were affected by the defect. The most common way to achieve this is by linking each defect report to the code changes that fix the defect, for example by analyzing all code changes in a project's version control system (e.g., git repository), looking for changes whose change message mentions a defect report's identifier. The files changed by those defect fixes can then be considered as experiencing a defect upon release.

Unfortunately, as observed in the motivational example, the timestamp of such a defect fix is not a good indicator either of the release the defect was found in, since each project follows its own release process [Humble and Farley, Bass et al.]. Roughly speaking, projects either use a feature-based release schedule (a release is made once all its intended features are ready), or a time-based schedule (a release is made periodically with all features that are ready at that time). Whereas, by definition, feature-based schedules do not have a fixed *cycle time* (time period between successive releases), even time-based schedules can have a cycle time anywhere from 12 hours (Facebook web app) to 6 weeks (Mozilla Firefox) or even 6 months (OpenStack). In other words, the 3 months of defect reports considered by the student in the example would correspond to a timespan of 2 Firefox releases (2 times 6 weeks), but only half of an OpenStack release (0.5 times 6 months).

The problem here is not necessarily that 3 months is shorter or longer than a project's cycle time, since not every user switches immediately to a new release. [For example] [1], shortly after release 12 of Firefox appeared on the market, 37 percent of the users were still using older, unsupported Firefox releases. Hence, one could still expect defects to be reported for a given release well after the next release has been launched.

[1]: http://arstechnica.com/information-technology/2012/06/may-browser-usage-firefox-users-still-avoiding-updates "May browser usage: Firefox users still avoiding updates"

Instead, the real problem is that the timestamp of the code change fixing a defect is no longer sufficient to determine which release the defect is linked to (if this information is not recorded in the defect report). Indeed, defects fixed in weeks 7 to 12 following Firefox 11 could in fact be *post*-release defects of Firefox 12 (released at the end of week 6) instead of Firefox 11. Even worse, defects fixed in weeks 1 to 6 or 7 to 12 following Firefox 11 could also be *pre*-release defects of Firefox 12 or 13! Those are defects in new features developed for Firefox 12 or 13 rather than in code shipped in Firefox 11. To top things off, some time-based projects like Firefox have special [Extended Support Releases (ESR)] [2] that are being supported much longer than regular releases, for example for 1 year (timespan of 8 or 9 regular releases). ESRs are targeted at companies, who need stability and ongoing defect and security fixes.

[2]: https://www.mozilla.org/en-US/firefox/organizations/faq/ "Mozilla Firefox ESR"

Similar problems pop up when determining the code changes that went into a particular release, which is data that is essential for training a prediction model. At one given point in time, some developers could be working on features for the upcoming release, while others in parallel could be fixing defects or performing other maintenance tasks on one of the older releases. Hence, just by looking at the timestamp of a code change, it is impossible to know for sure to which release this code change belongs. In the case of the student, a training period of 6 months would span 4 Firefox releases. Given the adoption numbers of new releases, it is very likely that changes could have been made to any of these releases (especially if one of them would be an ESR).

To summarize, release process characteristics like cycle time and the amount of parallel development can substantially impact the accuracy of time-based links between a release and code changes or defect reports.


## How the Version Control System can Help

How to overcome these problems? Unless a project has explicit, detailed release roadmaps, the best recommendation is to analyze how releases are being recorded in the version control system. This is typically a Git or Subversion repository containing the entire code change history of a project.

The simplest case, which is how most people imagine software projects to work, would be a project working entirely on the master branch of their version control system. The master branch is a chronological sequence of code changes where new features enter a project. When a release is pending, the master branch enters the stabilization phase, in which all feature development is paused and as many defects as possible are being ironed out for the upcoming release. Eventually, when deemed ready or when the scheduled cycle time is up, a release is made (and tagged in the master branch), after which changes for the next release start entering the master branch.

In this fully sequential scenario, one is sure that all code changes made within one cycle time before a release belong to that release. However, it is impossible to know whether the defects fixed within one cycle time after a release are that release's post-release defects or the next release's pre-release defects. For many software analytics applications, this might not be a huge problem. However, if it does pose a problem, project documentation, project members or other data sources (if available) would be needed to refine the data.

![Version control system with two release branches.](branches.pdf "Version control system with two release branches.")

Fortunately, a more realistic scenario for projects is to use so-called release branches to indicate release-specific work, as shown in the figure above. Basically, as soon as regular development for release v1 is finished (time "t1"), stabilization does not start on the master branch, but on a release branch dedicated to the upcoming release. The master branch can then be used by developers already working on features for release v2.

Apart from harbouring all code changes related to the stabilization of a release, the release branch will also contain any post-release maintenance code changes, including defect fixes! In other words, all code changes that went into release v2 and subsequent minor releases with defect fixes are highlighted by the bold "code lines" in the figure. They consist of all code changes on the master branch after the release branch for v1 was created on "t1" until the v2 release branch is created on "t2", plus any code changes on the latter release branch after "t2". These code changes can easily be obtained by asking a version control system for all code changes on the master branch between times "t1" and "t2" and on the release branch after time "t2". The code changes *after* time "v2" on the release branch then correspond to post-release defect fixes of release v2.

Focussing on defect fixes made after a release on the release's dedicated branch, currently is the most reliable approach to identify a release's post-release defects. It is still not perfect, though. Of course, defects that were never reported will still be missed, but also post-release defects that are reported and/or fixed when the release has become obsolete due to newer releases. Such defects will be fixed in the later releases, but the fixes might not be "back-ported" (i.e., copied) to the release branch of the original, defective release. For example, 98% of the reported defects in the projects with short, time-based releases studied by Alencar et al. took one or more releases before being fixed, compared to up to 60% for feature-based releases [Alencar et al.]. Hence, depending on a project's cycle time and development strategy, the impact of defect fixes that are not back-ported potentially could be large! The date on which the fixed defect was reported could give an indication that the defect is much older than expected, but (as discussed) would still not reveal the exact release.

Despite this issue with back-porting, release branches are popular in modern development, and chances are high that they exist as well in the projects that you will be analyzing, be it for building a defect prediction model or another software analytics task. It is interesting to realize that, whichever the size of a project in terms of developers or source code, a release is a global, project-level event, hence requiring only one (global) release branch. This is why release branches are common and allow to link code changes more accurately to their release than only time-based information allows to do.

Hence, the take-home message of this chapter is to always consider the release process used by a software project, whichever software analytics task you are involved in. For other release process-related pitfalls for software analytics, please check our FoSE 2016 paper [Adams and McIntosh].


## References

+ Jez Humble; David Farley; Continuous Delivery: Reliable Software Releases Through Build, Test, and Deployment Automation. Addison-Wesley Professional, 2010.
+ Len Bass; Ingo Weber; Liming Zhu; DevOps: A Software Architect's Perspective. Addison-Wesley Professional, 2015.
+ Daniel Alencar da Costa; Surafel Lemma Abebe; Shane McIntosh; Uira Kulesza; Ahmed E Hassan; An Empirical Study of Delays in the Integration of Addressed Issues, Proceedings of the 30th IEEE International Conference on Software Maintenance and Evolution (ICSME), Victoria, Canada, 2014.
+ Bram Adams; Shane McIntosh; Modern Release Engineering in a Nutshell - Why Researchers should Care. Leaders of Tomorrow: Future of Software Engineering (FoSE), Proceedings of the 23rd IEEE International Conference on Software Analysis, Evolution, and Reengineering (SANER), Osaka, Japan, 2016.
