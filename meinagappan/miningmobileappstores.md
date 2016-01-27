# Mobile App Store Analytics

Meiyappan Nagappan and Emad Shihab

## Introduction

Today, software engineering research focuses on traditional software systems like the Firefox web browser or Microsoft Windows [19], which take years to develop and teams of designers, developers and debuggers. Software engineering is rapidly changing though. Emerging domains, such as mobile devices, are growing rapidly and depend heavily on new software operating systems like Android and the applications that they run, commonly referred to as apps. Over the past few years, we have seen a boom in the popularity of mobile devices and mobile apps that run on these devices [1]. Recent market studies predict that the global mobile app economy is expected to be worth $143 billion by 2016 [17]. Thus there exists considerable impact in solving the challenges faced by several different stakeholders like the mobile app developers, users, and platform owners (like Apple/BlackBerry/Google/Microsoft).

Mobile apps, unlike traditional software are distributed by the developers directly to the end users via a centralized platform called the app store. Along with the executable mobile app, the app stores contain a large set of meta-data about the app. For each app any end user is able to look at the name and contact details of the developer, description, sample screenshots, feature set of the app, number of downloads and the price for the app. Additionally, the app stores allow users to post reviews of the apps. This is very different from traditional software. Mobile app developers get continuous feedback from users that can be leveraged to help them. For example, prior work leveraged user reviews to extract user-faced issues [12, 11], and new requirements [4].

Using the data from the app stores, several companies like App Annie1, (which recently bought another company - Distimo2) and Appfigures3 have even built successful businesses selling intelligence gained from observing the evolution of several hundred thousand apps in the app stores. Similar to such businesses, researchers can mine the store for meta-data of the apps and the apps themselves [3], and analyze the mined data to compile empirical results to help the various stakeholders of mobile apps. Even the feedback provided by end users on the mobile apps (including closed source apps from private companies) is publicly available in the app stores for researchers to mine.

Since 2012 [6, 20] researchers have begun to mine the data in the mobile app stores to address relevant software engineering issues. One such example is the mining of the feedback given as user reviews in mobile app stores for understanding the end user perspective. We describe some of the advancements made in this regard, below.

## Understanding End Users

One of the key characteristics of mobile app stores is the fact that they allow users to review their apps. Generally, these app reviews consist of two parts: an app star-rating (of which an aggregate makes up the overall app-level rating) and a review-comment that is used to rationalize the star-rating. Previous research has shown that users tend to write reviews when they are either extremely satisfied or extremely dissatisfied with a product [8]. The low star-reviews have a greater impact on than high star-reviews, since buyers are more likely to react to low ratings and complaints [2]. It has also been proven that such user reviews can have a high impact on download counts (i.e., purchases) and are a key measure of the app’s success [6, 16].

Therefore, it is always in a developer’s best interest to make sure app reviews are as high as possible. To ensure high app ratings, a number of studies leverage app review analytics to help developers understand their users. An example of such a study is our earlier work that uses app reviews to understand “why users give low ratings to apps?” [10]. In particular, the aim of the study was to ex- amine the most frequent and the most negatively impacting types of complaints users have. Since the study’s goal was to understand complaints, it focused only on 1 and 2 star reviews of 20 different iOS apps. A statistically signifi- cant sample (6,390) of user reviews were manually examined and tagged. The tags were meant to summarize the type of complaint the user mentions (e.g., a complaint about a functional error or a privacy issue with the app). Then, the tagged reviews were grouped and different analytics were calculated to make some insightful recommendations to developers about negative app reviews.

Since the main goal is to identify the types of complaints so that developers can avoid them, the study starts by determining the most frequent types of complaints. The study found that the majority of negative app reviews can be classified into twelve different categories, namely (ordered in descending order of frequency), Functional Error; Feature Request; App Crashing; Network Prob- lem; Interface Design; Feature Removal; Hidden Cost; Compatibility; Privacy and Ethical; Unresponsive App; Uninteresting Content; and Resource Heavy. In fact, the three most common complaints, i.e., functional errors, feature requests and app crashing accounted for more than 50% of the reported complaints. Ex- amining these complaints can help developers identify existing problems, and give guidance on potentially new features for their app. In fact, follow on work by Iacob et al. [9] showed that app reviews can be mined to successfully identify new app feature requests.

In addition to simply determining the most frequent complaints, the study also investigated the most negatively impacting types of reviews. To do so, the study calculates the ratio of 1 to 2 star ratings for each complaint. For example, a 1 to 2 star ratio of 5 for a complaint type indicates that this complaint type has 5 times as many 1 star ratings as 2 star ratings. This ratio helps us identify the most negatively-perceived complaints. The findings showed an interesting and complementary view to the findings about the most frequent complaints. The most negatively-impacting complaints are related to privacy and ethical issues, hidden costs and feature removals (i.e., disliked features that are degrading the end-user experience). The three aforementioned complaints were not the most frequent, however, clearly they are badly perceived by app users. On the other hand, the most frequent complaints (e.g., functional errors), tend to be not as impacting. The study is a clear example of how user app review analytics can be leveraged to help mobile app developers better understand their users. More about this study is available in the full article [12].

Other examples of research based on mobile app store analytics include: code reuse in mobile apps [20], monetizing apps through ads [21, 22], mining mobile tapp data from the app stores [6], testing mobile apps [14, 15], addressing device fragmentation [5, 11], resource usage and optimization [7, 13, 18], and teaching programming on mobile devices [23].

## References

[1] Berg	Insight.	The	mobile	application	market.	Online: http://www.berginsight.com/ReportPDF/ProductSheet/bi-app1-ps.pdf, Last accessed Oct 2013.

[2] J. A. Chevalier and D. Mayzlin. The effect of word of mouth on sales: Online book reviews. Journal of marketing research, 43(3):345–354, 2006.

[3] S. Dienst and T. Berger. Static analysis of app dependencies in an- droid bytecode, 2012. Tech. Note, available at http://www.informatik.uni- leipzig.de/b ̃erger/tr/2012dienst.pdf.

[4] L. V. Galvis Carren ̃o and K. Winbladh. Analysis of user comments: an approach for software requirements evolution. In Proceedings of the 2013 International Conference on Software Engineering, ICSE ’13, pages 582– 591, 2013.

[5] D. Han, C. Zhang, X. Fan, A. Hindle, K. Wong, and E. Stroulia. Under- standing android fragmentation with topic analysis of vendor-specific bugs. In 20th Working Conference on Reverse Engineering (WCRE), pages 83– 92, 2012.

[6] M. Harman, Y. Jia, and Y. Zhang. App store mining and analysis: Msr for app stores. In Proceedings of the 9th Working Conference on Mining Software Repositories (MSR ’12), Zurich, Switzerland, 2-3 June 2012.

[7] A. Hindle. Green mining: A methodology of relating software change to power consumption. In Mining Software Repositories (MSR), 2012 9th IEEE Working Conference on, pages 78–87, 2012.

[8] N. Hu, P. A. Pavlou, and J. Zhang. Can online reviews reveal a product’s true quality?: empirical findings and analytical modeling of online word-of-mouth communication. In Proceedings of the 7th ACM conference on Electronic commerce, EC ’06, pages 324–330, 2006.

[9] C. Iacob and R. Harrison. Retrieving and analyzing mobile apps feature re- quests from online reviews. In Proceedings of the 10th Working Conference on Mining Software Repositories, MSR ’13, pages 41–44, 2013.

[10] H. Khalid. On identifying user complaints of iOS apps. In Proceedings of the 2013 International Conference on Software Engineering, pages 1474–1476. IEEE Press, 2013.

[11] H. Khalid, M. Nagappan, E. Shihab, and A. E. Hassan. Prioritizing the devices to test your app on: A case study of android game apps. In 22nd ACM SIGSOFT International Symposium on the Foundations of Software Engineering (FSE 2014). ACM, 2014.

[12] H. Khalid, E. Shihab, M. Nagappan, and A. Hassan. What do mobile app users complain about? Software, IEEE, 32(3):70–77, May 2015.

[13] D. Li, S. Hao, W. G. J. Halfond, and R. Govindan. Calculating source line level energy information for android applications. In Proceedings of the 2013 International Symposium on Software Testing and Analysis, ISSTA 2013, pages 78–89, 2013.

[14] A. Machiry, R. Tahiliani, and M. Naik. Dynodroid: an input generation system for android apps. In Proceedings of the 2013 9th Joint Meeting on Foundations of Software Engineering, ESEC/FSE 2013, pages 224–234, 2013.

[15] H. Muccini, A. Di Francesco, and P. Esposito. Software testing of mobile applications: Challenges and future research directions. In International Workshop on Automation of Software Test, pages 29 –35, june 2012.

[16] S. M. Mudambi and D. Schuff. What makes a helpful online review? a study of customer reviews on amazon.com. MIS Quarterly, 34(1):185–200, 2010.

[17] A. Pappas. Developer economics: App market forecasts 2013-2016. On- line:	http://www.visionmobile.com/blog/2013/07/developer-economics- app-market-forecasts-2013-2016/, Last accessed Oct 2013.

[18] A. Pathak, Y. C. Hu, and M. Zhang. Where is the energy spent inside my app?: fine grained energy accounting on smartphones with eprof. In Proceedings of the 7th ACM european conference on Computer Systems, EuroSys ’12, pages 29–42, 2012.

[19] B. Robinson and P. Francis. Improving industrial adoption of software engineering research: a comparison of open and closed source software. In Proceedings of the 2010 ACM-IEEE International Symposium on Empirical Software Engineering and Measurement, ESEM ’10, pages 21:1–21:10, 2010.

[20] I. J. M. Ruiz, M. Nagappan, B. Adams, and A. E. Hassan. Understanding reuse in the android market. In IEEE International Conference on Program Comprehension (ICPC), page To appear, June 2012.

[21] I. M. Ruiz, M. Nagappan, B. Adams, T. Berger, S. Dienst, and A. Hassan. On ad library updates in android apps. IEEE Software, 2014.

[22] I. M. Ruiz, M. Nagappan, B. Adams, T. Berger, S. Dienst, and A. Hassan. On the relationship between the number of ad libraries in an android app and its rating. IEEE Software, 2014.

[23] N. Tillmann, M. Moskal, J. de Halleux, M. Fahndrich, J. Bishop, A. Samuel, and T. Xie. The future of teaching programming is on mobile devices. In Proceedings of the 17th ACM annual conference on Innovation and tech- nology in computer science education, ITiCSE ’12, pages 156–161, 2012.
