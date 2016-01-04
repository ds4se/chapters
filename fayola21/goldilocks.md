# Becoming Goldilocks: Privacy and Data Sharing in “Just Right” Conditions

*Fayola Peters, Lero - The Irish Software Research Centre, University of Limerick*

If we forget that Goldilocks trespassed, ate food, and, used and broke furniture that did not belong to her - we can appreciate her sense of figuring out what was **just right** for her. Baby Bear's porridge was neither too hot nor too cold. Baby Bear's chair was not too big. Baby Bear's bed was neither too hard nor too soft. Finding that middle ground, that balance between two extremes or confliting goals such as privacy and utility is the basis of research in data privacy and data sharing. 

## The "Data Drought"
One of the facets of data science is reproducible reporting. To do this, data used for analysis must be shared, but this is not always possible. Extracting project data from organizations is often very difficult due to the business sensitivity associated with the data. For example, during his 11 year stint at NASA’s software IV&V center, Tim Menzies observed that NASA divides its IV&V work between multiple contractors who all work on similar projects. Every three years, all the contracts are subject to competitive bidding. Hence, those contractors are very reluctant to share data about (say) the effort associated with finding mission-critical errors in manned spacecrafts, lest that data is used against them during the bidding process. Consequently, researchers and NASA managers suffer from a severe “data drought” that inhibits their ability to learn effective defect detection models for life-threatening software errors (Menzies et al. 2008).

In a similar vein, many researchers doubt the practicality of data sharing for the purposes of research. In a personal communication, Barry Boehm reports that he can release none of the data that his COCOMO team collected after 1981. Also, at a keynote address at ESEM’11, Elaine Weyuker doubted that she will ever be able to release the AT&T data she used to build defect predictors.

One way to convince data owners to share their data is to offer them a means to obfuscate their data in a way that is "just right" for both the data owners and researchers. In other words, the shared data should not allow the competition to learn specific sensitive infomation and remain useful for research purposes such as cross defect prediction.

This was echoed by Sebastian Elbaum et al. in 2014 when they released a google testing results data set online. These contain 3.5 million test suite execution results. When questioned about sharing source code being tested and details on the failures, their response was an echo of what privacy research has been working to achieve:

>Sharing industrial datasets with the research community is extremely valuable, but also extremely challenging as it needs to balance the usefulness of the dataset with the industry’s concerns for privacy and competition (Sebastian Elbaum et al. 2014).

Over that last six years we have accepted the challenge of *Becoming Goldilocks* for privacy research in the domain of Cross Project Defect Prediction. Our aim was and is to create privacy algorithms that produce "just right" data sets that offer data owners their prescribed privacy level and that are still useful for researchers and other users.  Along the way, we learned some valuable lessons.

## Change Is Good
When I first started my research into data privacy for software engineering, I focused on the literature for privacy-preserving data publishing and social data privacy work. Four main issues stood out:

1. Privacy could not be 100% guaranteed;
2. Obfuscating data could damage the usefulness (utility) of the data;
3. There are many different ways to measure privacy;
4. The question of whether the privacy of one matters, when the utility of the data provides benefits for all.

With these issues in mind, our first effort at generating "just right" data was MORPH, an instance mutator for obfuscating numerical data (Peters et al. 2012). The intuition behind MORPH is to change the data enough to avoid privacy breaches but not enough to degrade utility. The result  showed MORPH offering four times more privacy than the non-obfuscated data and comparable utility.

**This is lesson one**: Little changes in your data can offer privacy and comparable utility. 

## Don’t Share Everything
This next lesson came as a side effect of work in data minimization with the focus on dealing with the drawbacks of the k-Nearest Neighbor algorithm. These drawbacks include, (1) the high computation costs caused by the need for each test sample to find the distance between it and each training sample (2) the storage required to hold the entire dataset in memory; (3) the effects of outliers which can negatively affect the accuracy of the classifier; (4) the negative effect of data sets with non-separable and/or overlapping classes; and (5) the effects of noise on k-Nearest Neighbor inference (Wilson and Martinez 2000). 

We overcame these drawbacks with CLIFF which retains the subset of data that are the better representatives of the dependent variable of the data. The result was that with just 20% of the original data, utility could be maintained with the added bonus that 80% of the data could be protected because it does not have to be shared. Also, in conjunction with MORPH, we have a powerful privacy algorithm (Peters et al. 2013). 

**This is lesson two**: Don’t share all your data. Some of your data are better at representing the dependent variable than others. Only share that data while keeping the rest in your possession. 

## Share Your Leaders
Once we had privacy algorithms, we realized that there was another factor that affected privacy and data sharing, i.e. repeated data from different projects. We surmised that the reason for this is software code reuse in multiple projects. Selby in 2005 did a study and found that in a set of programs, 32% were comprised of reused code (not including libraries). Therefore in a scenario of multiple data owners working together to share an obfuscated version of their combined data sets, there maybe some repitition. 

We adapted the Leader Follower algorithm (Duda et al. 2012) to bring this scenario to life. The algorithm is an online, incremental technique for clustering data. The cluster centers are the "leaders" and all other data are the "followers". The basic algorithm works as follows: First initialize cluster leaders, then for each instance in the data, find its nearest leader. If the distance to the leader is less than a user defined distance, then update the cluster. Otherwise, create a new cluster with the instance as the leader. We were only interested in the leaders. In this way we avoided avoided data repition by not allowing data owners to share what others had already shared. 

Here is an example with three data owners going through the leader sharing process which we call "pass the parcel". 

Let's call the three data owners Alice, Bob and Eve. Alice is the initiator of the process and she has the parcel which is empty at this point. Alice takes her data and minimizes it, then applies the leader follower algorithm to remove similar data, then obfuscates the data that remains. These leaders added to the parcel which is then passed on to Bob. Bob minimizes his data, then applies the leader follower algorithm to what remains and the leaders in the parcel. If any of Bob's data are similar to what what is in the parcel, these are considered to be followers and are not shared. The data that remains are obfuscated in relation to data in the parcel and finally submitted to the parcel. Bob then passes the parcel to Eve who does the same procedure as Bob. 

In the end, we found that privacy levels of the shared data by each data owner increased because they shared less data (~5%) while maintaining the utility of the data (Peters et al. 2015). 

**This is lesson three**: Don’t share what others have already shared. Instead, share your *leaders*, data that are unique to the population of shared data.
		 	 	 		
## Summary
The lessons we learned over the last six years have helped us to generate obfuscated data sets that demonstrate that "just right" balance between privacy and utility of data. These lessons can be used when developing more privacy algorithms for software data. 

1. Most privacy algorithms tend to distort data to obfuscate it and to avoid correct associations with sensitive data. These however, tended to not care about lower utility. But, we found that a little change (distorting) can allow for high privacy level with comparable utility with the original data set.
2. There is no need to share all your data. Sharing a small amount of data does not greatly degrade utility with the added bonus of increasing privacy. 			
3. We already know that! Don’t share what others have already shared. This will allow data owners to share even less data and therefore increase privacy.

## References 
* R. Duda, P. Hart, and D. Stork, Pattern Classification. Wiley, 2012.
* S. Elbaum, A. Mclaughlin, and J. Penix, "The Google Dataset of Testing Results", https://code.google.com/p/google-shared-dataset-of-test-suite-results, 2014.
* T. Menzies, M. Benson, K. Costello, C. Moats, M. Northey, and J. Richarson, “Learning better IV&V practices,” Innovations in Systems and Software Engineering, March 2008.
*  F. Peters and T. Menzies, “Privacy and utility for defect prediction: Experiments with morph,” in Proceedings of the 2012 International Conference on Software Engineering, ser. ICSE 2012. Piscataway, NJ, USA: IEEE Press, 2012, pp. 189–199.
*   F. Peters, T. Menzies, L. Gong, and H. Zhang, “Balancing privacy and utility in cross-company defect prediction,” Software Engineering, IEEE Transactions on, vol. 39, no. 8, pp. 1054–1068, Aug 2013.
* F. Peters, T. Menzies and L. Layman, "LACE2: Better Privacy-Preserving Data Sharing for Cross Project Defect Prediction," in Software Engineering (ICSE), 2015 IEEE/ACM 37th IEEE International Conference on , vol.1, no., pp.801-811, 16-24 May 2015.
* R. Selby, “Enabling reuse-based software development of large-scale systems,” Software Engineering, IEEE Transactions on, vol. 31, no. 6, pp. 495–510, June 2005.
* D. R. Wilson and T. R. Martinez, “Reduction techniques for instance-based learning algorithms,” Machine Learning, vol. 38, pp. 257–286, 2000.
