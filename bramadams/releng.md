# Are your Post-release Defects Post-al? (or: How the Release Process Impacts your Software Analytics)

Transcript of a recent meeting with an anonymous grad student:

*student:*  ... and then I built the oracles for our defect prediction models. I was able to obtain data for 3 major releases of Mozilla Firefox!

*me:* Nice, so how did you determine whether a defect was a post-release defect?

*student:*  Easy, I compared the date on which the defect was reported, so all defects reported within 3 months after the release date are post-release defects.

*me:* Hmm, and how did you determine which code changes to use for training the prediction model?

*student:* Similarly, I used all the code changes in the version control system within 6 months before the release date!

*me:* 6 months, eh? Did you know that Firefox has a new release every 6 **weeks**?

*student:* ...


This student apparently did not make any real mistake, in fact he/she had done a great job reading the major papers on defect prediction and applying their evaluation methodology on our own research project. Basically, the main idea of a (file-level) defect prediction model is to relate characteristics of the source code files of a software release to the probability that those files would still contain a defect after the release. Testers could use such a model for an upcoming release to focus only on those files (and their features) predicted to be the most defect-prone.

Training and testing a defect prediction model requires at least two releases with known post-release defects. Traditionally, the presence of a post-release defect is approximated by the presence of a defect report in the project's issue repository, which is a reasonable assumption (defects without defect report are ignored, but more than likely do not have a large enough impact on users). Given such defect reports, one just needs to (1) identify for which release and source code files a defect has been reported. Once the post-release defects of each release under study are identified, one then needs to (2) identify the code changes belonging to each release under study, before the prediction model can be trained and evaluated.

The following sections discuss how steps (1) and (2) can go wrong when the release process of a project is not taken into account, and what could be done to resolve these problems. This chapter uses defect prediction only as an illustration of the impact of an incorrect understanding of the release process; the underlying ideas and warnings impact any form of software analytics where the concept of a "release" is important!


## Linking Defect Reports and Code Changes to a Release

Ideally, each reported defect should specify what release it was found in. However, in many cases only the date on which the defect was reported is available and, even if a defect's release would have been recorded, one still needs to identify which files were affected by the defect. This means that the defect report data needs to be linked to the version control code changes that fix the reported defects, i.e., that mention a defect report's identifier in their commit message. The files changed by those defect fixes can be considered as the files containing the defect upon release, however, as observed in the motivational example, the timestamp of the defect fix is not a good indicator of the release the defect was found in.

Indeed, each project has its own release schedule. Roughly speaking, projects either use a feature-based release schedule according to which a release is made once all its intended features are ready, or a time-based schedule where a release is made periodically with all features that are ready at that time. Whereas, by definition, feature-based schedules do not have a fixed *cycle time*, i.e., time period between successive releases, even time-based schedules can have a cycle time anywhere from 12 hours (Facebook web app) to 6 weeks (Mozilla Firefox) or even 6 months (OpenStack).

In other words, the 3 months of defect reports considered by the student in the example would correspond to a timespan of 2 Firefox releases (2 times 6 weeks), but only half of an OpenStack release (0.5 times 6 months). The problem here is not necessarily that 3 months is shorter or longer than a project's cycle time, since not every user switches immediately to a new release. [For example] [1], after 2 weeks, only one third of the Firefox users had adopted Firefox 11, and over half of all users were on Firefox 10 or 11. Hence, one could still expect defects to be reported for a given release well after the next release has been launched.

[1]: https://chitika.com/insights/2012/firefox-11-auto-update-feature-fuels-rapid-adoption-rate-37-4-of-users-on-latest-version "Firefox 11 adoption"

Instead, the real problem is that the timestamp of the code change fixing a defect is no longer sufficient to determine which release the defect is linked to (if this information is not recorded in the defect report). Indeed, defects fixed in weeks 7 to 12 following Firefox 11 could in fact be *post*-release defects of Firefox 12 (which has been released at the end of week 6). Even worse, defects fixed in weeks 1 to 6 or 7 to 12 following Firefox 11 could also be *pre*-release defects of Firefox 12 or 13! To top things off, some time-based projects like Firefox have special [Extended Support Releases (ESR)] [2] that are being supported much longer than regular releases, for example for 1 year (timespan of 8 or 9 regular releases). ESRs are targeted at companies, who need stability and ongoing security updates. Hence, ESRs might have a different behaviour in terms of defects being reported and fixed than regular releases.

[2]: https://www.mozilla.org/en-US/firefox/organizations/faq/ "Mozilla Firefox ESR"

Similar problems pop up when determining the code changes that went into a particular release, which is essential data for training a prediction model. Indeed, at one given point in time, some developers could be working on features for the upcoming release, while others could be fixing defects or perform other maintenance tasks on one of the older releases. Hence, just by looking at the timestamp of a code change, it is impossible to know for sure to which release this code change belongs. In the case of the student, 6 months would span 4 Firefox releases. Given the adoption numbers of new releases, it is very likely that changes to any of these releases could have been made (especially if one of them would be an ESR).

To summarize, release process characteristics like cycle time and the amount of parallel development can substantially impact the accuracy of time-based links between code changes and a release. Similar issues can arise in any other software analytics task that involves "releases".


## How the Version Control System can Help

How to overcome these problems? Unless a project has explicit, detailed release roadmaps, the best recommendation is to analyze how releases are being recorded in the version control system.

The simplest case, which is exactly how most people imagine software projects to work, would be a project working entirely on the master branch (trunk) of their version control system: code changes for new features would enter the master branch (either through direct commits or merges), until the stabilization phase for the upcoming release is started, in which as many defects as possible are ironed out for the upcoming release. Eventually, when deemed ready (or when the scheduled cycle time is up), a release is made, with the corresponding code change tagged in the master branch, after which changes for the next release start entering the master branch.

In this fully sequential scenario, one is sure that all code changes made within one cycle time before a release belong to that release. However, it is impossible to know whether the defects fixed within one cycle time after a release are that release's post-release defects or the next release's pre-release defects. For many software analytics applications, including defect prediction models, this might not be a huge problem. However, if it does pose a problem, project documentation or other data sources (if available) would be needed to refine the data.

![Version control system with two release branches.](branches.pdf "Version control system with two release branches.")

Fortunately, a more realistic scenario is for projects to use so-called release branches to indicate release-specific work, as shown in the figure above. Basically, as soon as regular development for a release is finished, stabilization does not start on the master branch, but on a release branch dedicated to the upcoming release. The master branch can then be used by developers already working on features for the next release. For example, development specific to release "v2" starts on the master branch as soon as the release branch of "v1" has been created. The latter branch will harbour all code changes related to the stabilization of "v1" as well as any post-release maintenance code changes, including defect fixes! Possible minor releases would also be based off this release branch.

In other words, the code changes that went into release "v2" correspond to the bold code lines. They consist of all code changes on the master branch after the release branch for "v1" was created until the "v2" release branch is created, plus any code changes on the latter release branch until the actual release (marked by a small tick in the figure). The code changes *after* the release of "v2" on the release's branch then correspond to post-release defect fixes. Those fixes either can be made directly on the release branch or could be "backported", i.e., the original fix could be made on the master branch or on the release branch of another release, after which developers copied the fix to other (older) release branches. Of course, one would still miss defects whose fixes would not be backported to release "v2", but these would likely correspond to less important defects, since they would have been reported only a long time after the original release or not deemed high-priority enough to fix immediately.

Release branches are popular in modern development, and chances are high that they exist as well in the projects that you will be analyzing. Different branching schemas are of course possible, but most can be interpreted in a similar way, allowing to link code changes more accurately to their release than only time-based information allows to do. Hence, the take-home message of this chapter is to always consider the release process used by a software project, whichever software analytics task you are involved in.


## References

+ Jez Humble; David Farley; Continuous Delivery: Reliable Software Releases Through Build, Test, and Deployment Automation. Addison-Wesley Professional, 2010.
+ Len Bass; Ingo Weber; Liming Zhu; DevOps: A Software Architect's Perspective. Addison-Wesley Professional, 2015.
+ Bram Adams; Stephany Bellomo; Christian Bird; Tamara Marshall-Keim; Foutse Khomh; Kim Moir; [The Practice and Future of Release Engineering - A Roundtable with Three Release Engineers] [3]. IEEE Software, Vol. 32, no. 2, pp. 42 - 49, 2015.

[3]: http://online.qmags.com/ISW0315 "IEEE Software Roundtable"
