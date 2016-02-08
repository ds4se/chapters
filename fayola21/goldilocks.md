# Becoming Goldilocks: Privacy and Data Sharing in “Just Right” Conditions

*Fayola Peters, Lero - The Irish Software Research Centre, University of Limerick*

If we forget that Goldilocks trespassed, ate food, as well as used and broke furniture that did not belong to her - we can appreciate her sense of figuring out what was **just right** for her. Baby Bear's porridge was neither too hot nor too cold. Baby Bear's chair was not too big. Baby Bear's bed was neither too hard nor too soft. Finding that middle ground, that balance between two extremes or confliting goals such as privacy and utility is the basis of research in data privacy and data sharing. 

## The "Data Drought"
One of the facets of data science is reproducible reporting (Peng 2015). To do this, data used for analysis must be shared, but this is not always possible. Extracting project data from organizations is often very difficult due to its business sensitivity. For example, during his 11 year stint at NASA’s software IV&V center, Tim Menzies observed that NASA divides its IV&V work between multiple contractors who all work on similar projects. Every three years, all the contracts are subject to competitive bidding. Hence, those contractors are very reluctant to share data about (say) the effort associated with finding mission-critical errors in manned spacecrafts, lest that data is used against them during the bidding process. Consequently, researchers and NASA managers suffer from a severe "data drought" that inhibits their ability to learn effective defect detection models for life-threatening software errors (Menzies et al. 2008).

In a similar vein, a few researchers have doubts about data sharing because of the proprietary nature of the data which could be used by competitors. In a personal communication, Barry Boehm reports that he can release none of the data that his COCOMO team collected after 1981. Also, at a keynote address at ESEM2011, Elaine Weyuker doubted that she will ever be able to release the AT&T data she used to build defect predictors.

One way to convince data owners to share their data is to offer them a means to obfuscate their data in a way that is "just right" for both the data owners and researchers. In other words, the shared data should not allow the competition to learn specific sensitive infomation and remain useful for research purposes such as dcross project defect prediction.

This was echoed by Sebastian Elbaum et al. in 2014 when they released a Google testing results data set online. These results contain 3.5 million test suite execution results. When questioned about sharing source code being tested and details on the failures, their response was:

> Sharing industrial datasets with the research community is extremely valuable, but also extremely challenging as it needs to balance the usefulness of the dataset with the industry’s concerns for privacy and competition (Sebastian Elbaum et al. 2014).

Since 2009 we have accepted the challenge of *Becoming Goldilocks* for privacy research in the domain of Cross Project Defect Prediction. Our evaluations were conducted using static code defect data sets (Jureczko 2011). Each instance in these data sets represented a source code class and consisted of two parts: 20 independent static code attributes and the dependent attribute labeled "defects" indicating the number of defects in the class. We sought to protect this data from *sensitive attribute disclosure*, a privacy threat which can occur when an instance in the data is associated with information about their sensitive attributes, such as software code complexity. The defect data used in our work contains  attributes that can be considered as sensitive, for example, lines of code (LOC) is seen as a function of code complexity where higher numbers for LOC indicate higher complexity which can make understanding and maintaining code more difficult for developers and testers to find defects.

Our aim was, and is, to create privacy algorithms that produce "just right" data sets that offer data owners their prescribed privacy level and that are still useful for researchers and other users.  Along the way, we learned some valuable lessons.

## Change Is Good
When we first started research into data privacy for software engineering, we focused on the literature for privacy-preserving data publishing (J. Brickell and V. Shmatikov 2008, T. Li and N. Li 2009). Four main issues stood out:

1. Privacy could not be 100% guaranteed;
2. Obfuscating data could damage the usefulness (utility) of the data;
3. There are many different ways to measure privacy;
4. The question of whether the privacy of one matters, when the utility of the data provides benefits for all.

With these issues in mind, our first effort at generating "just right" data was MORPH, an instance mutator for obfuscating numerical data (Peters et al. 2012). The intuition behind MORPH is to change the data enough to avoid privacy breaches but not enough to degrade utility. To generate MORPHed instances we first find for each original instance, its *nearest unlike neighbour*, that is, if an instance is defective then its nearest unlike neighbour is non-defective. We then apply the following equation: 

![img](http://www.sciweavers.org/tex2img.php?eq=%24%24y_i%20%3D%20x_i%20%5Cpm%20%28x_i%20-%20z_i%29%20%2A%20r%24%24%0A%0A%0A&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0[/img]),

where *y* is the MORPHed instance generated when we find the difference between the values of the original instance (*x*) and it's nearest unlike neighbor (*z*). The random value (*r*) can be set to between *0* and *1* and represents the boundary between the original instance and its nearest unlike neighbor which the MORPHed instance must not cross. A small *r* value means the boundary is closer to the original instance, while a large *r* value means the boundary is farther away from the original instance.

To measure the privacy of a MORPHed data set compared with the original data set, we use an Inverse Privacy Ratio (Peters et al. 2012). The Inverse Privacy Ratio models an attacker's background knowledge of a source code class in the form of queries. In an example with static code metrics, if our sensitive attribute is LOC and an attacker knows the values of other attributes for a class such as *number of children* and *weighted methods per class*, when applied to the original data set, they will know the exact LOC value. However, when a data set has been MORPHed, the value for LOC is likely to be different from the original result. Therefore, if the same query applied to the original data set and the MORPHed data set yields the same result (LOC), then we say that there has been a privacy breach, else there is no privacy breach.

When MOPRH was applied to our static code defect data sets (Peters et al. 2012), it offered four times more privacy than the original data along with comparable utility for cross project defect prediction.

**This is lesson one**: Little changes in your data can offer privacy and comparable utility. 

## Don’t Share Everything
This next lesson came as a side effect of work in data minimization, with the focus on dealing with the drawbacks of the k-Nearest Neighbor algorithm. These drawbacks include, (1) the high computation costs; (2) the storage required to hold the entire dataset in memory; (3) the effects of outliers; (4) the negative effect of data sets with non-separable and/or overlapping classes; and (5) the effects of noise on k-Nearest Neighbor inference (Wilson and Martinez 2000). 

We overcame these drawbacks with CLIFF, an algorithm which retains the subset of data that are the better representatives of the dependent variable of the data. CLIFF operates on discrete values, therefore, for the numeric values of static code metrics, we bin the values into sub-ranges. We then calculate a rank for each sub-range by the frequencies of the attribute sub-range of values present for defective instances versus non-defective instances and vice versa. We then find the product of the ranks for each instance and keep those instances that are ranked in the the top 20% for both defective and non-defective instances.

The result was that with just 20% of the original data, utility could be maintained. Recognizing the potential of this result for privacy where 80% of the data could be protected because it does not have to be shared, we combined CLIFF with MORPH to form a powerful privacy algorithm (Peters et al. 2013). We generated obfuscated data sets from only 20% of the original data. 

**This is lesson two**: Don’t share all your data. Some of your data are better at representing the dependent variable than others. Only share that data - keep the rest in your possession. 

## Share Your Leaders
Once we had privacy algorithms, we realized that there was another factor that affected privacy and data sharing, i.e. repeated data from different projects. We surmised that the reason for this is software code reuse in multiple projects. Selby in 2005 did a study and found that in a set of programs, 32% were comprised of reused code (not including libraries). Therefore in a scenario of multiple data owners working together to share an obfuscated version of their combined data sets, there maybe some repetition which would allow them to share less of their data. 

We adapted the Leader Follower algorithm (Duda et al. 2012) to bring this scenario to life. The algorithm is an online, incremental technique for clustering data. The cluster centers are the "leaders" and all other data are the "followers". The basic algorithm works as follows: Randomly select an instance from the data to be the first leader, then for every other instance in the data, find its nearest leader. If the distance to the leader is less than a user defined distance, then update the cluster. Otherwise, create a new cluster with the instance as the leader. These steps are repeated until each instance has either updated a cluster or became a leader. We were only interested in the leaders. In this way we avoided data repition by not allowing data owners to share what others had already shared. 

The diagram below shows an example with three data owners, Alice, Bob and Eve, going through the leader sharing process which we liken to a game of "pass the parcel". In our rendition of the game, the parcel starts empty and as it is passed around, each player (data owner) adds leaders to the parcel. In the end, we found that privacy levels of the shared data by each data owner increased because they shared less data (~5%) while maintaining the utility of the data (Peters et al. 2015). 

![goldilockspic](https://cloud.githubusercontent.com/assets/5220943/12323056/53b33b02-bab0-11e5-81c3-0ca887700731.png)

**This is lesson three**: Don’t share what others have already shared. Instead, share your *leaders*, data that is unique to the population of shared data.
		 	 	 		
## Summary
The lessons we learned since 2009 have helped us to generate obfuscated data sets that demonstrate the "just right" balance between privacy and utility of defect data. 
We recognize that there are a variety of different data types that could be shared in software engineering and that each type may require different approaches. However the lessons learned can be considered when developing or using other privacy algorithms for  different types of software data. 

## Acknowledgements
This work was partially funded by a National Science Foundation CISE medium grant (#1302169), Science Foundation Ireland grant 10/CE/I1855 and by the European Research
Council (Advanced Grant 291652 - ASAP).

## References 
* J. Brickell and V. Shmatikov. "The cost of privacy: destruction of data-mining utility in anonymized data publishing". In Proceedings of the 14th ACM SIGKDD international conference on Knowledge discovery and data mining (KDD 2008). ACM, New York, NY, USA, 70-78.
* R. Duda, P. Hart, and D. Stork, Pattern Classification. Wiley, 2012.
* S. Elbaum, A. Mclaughlin, and J. Penix, "The Google Dataset of Testing Results", https://code.google.com/p/google-shared-dataset-of-test-suite-results, 2014.
* M. Jureczko, "Significance of different software metrics in defect prediction," Software Engineering: An International Journal, vol. 1, no. 1, pp. 86–95, 2011.
* T. Li and N. Li. On the tradeoff between privacy and utility in data publishing. In Proceedings of the 15th ACM SIGKDD international conference on Knowledge discovery and data mining (KDD 2009). ACM, New York, NY, USA, 517-526. 
* T. Menzies, M. Benson, K. Costello, C. Moats, M. Northey, and J. Richarson, “Learning better IV&V practices,” Innovations in Systems and Software Engineering, March 2008.
* R.D. Peng, "The reproducibility crisis in science: A statistical counterattack." Significance 12, no. 3 (2015): 30-32.
*  F. Peters and T. Menzies, “Privacy and utility for defect prediction: Experiments with morph,” in Proceedings of the 2012 International Conference on Software Engineering, ser. ICSE 2012. Piscataway, NJ, USA: IEEE Press, 2012, pp. 189–199.
*   F. Peters, T. Menzies, L. Gong, and H. Zhang, “Balancing privacy and utility in cross-company defect prediction,” Software Engineering, IEEE Transactions on, vol. 39, no. 8, pp. 1054–1068, Aug 2013.
* F. Peters, T. Menzies and L. Layman, "LACE2: Better Privacy-Preserving Data Sharing for Cross Project Defect Prediction," in Software Engineering (ICSE), 2015 IEEE/ACM 37th IEEE International Conference on , vol.1, no., pp.801-811, 16-24 May 2015.
* R. Selby, “Enabling reuse-based software development of large-scale systems,” Software Engineering, IEEE Transactions on, vol. 31, no. 6, pp. 495–510, June 2005.
* D. R. Wilson and T. R. Martinez, “Reduction techniques for instance-based learning algorithms,” Machine Learning, vol. 38, pp. 257–286, 2000.
