

# This chapter is still unfinished!


# How You Learn [Data Models] Does Matter and There Are Many Ways You Can Do This
Leandro L. Minku, University of Leicester, UK

## Learning Styles
An unarguable fact in teaching is that people do not all learn in the same way. Some of us spend hours reading instructions, whereas others just start trying things out to see the outcome. Some of us quickly adjust to new situations and technologies, whereas others tend to stick to the traditions. People also tend to use different approaches to learn different tasks. If we try to use an approach that is unsuitable, we will not be able to learn well or will take much longer time to learn.

This is no different in machine learning for software data analytics. There is a plethora of machine learning algorithms that can be used for different purposes. Such algorithms can give us several insights into software processes and products, such as what software modules are most likely to contain bugs (Hall et al 2012), what amount of effort is likely to be required to develop a software project (Dejaeger et al 2012), what commits are most likely to induce crashes (An and Khomh 2015), how the productivity of a company changes over time or how to improve productivity (Minku and Yao 2014), etc.

Different types of algorithm are most adequate depending on the type of data, the environment being modelled and problem in hands. In order to create good data models, it is thus important to investigate certain aspects of the problem, data and environment before choosing the type of algorithm to be used. Here are a few useful questions to ask for that.


## Do additional data arrive over time?
Databases containing software project data may not have a static size -- they may grow with time. For example, new commits and information on whether they induced crashes may be available overtime. When additional data is produced over time, it is desirable to use such incoming data to improve data models. Online learning algorithms are able to update models with incoming data in a continuous way. Chunk-based learning algorithms wait for a new chunk of data to arrive, and then use it to update models. Different from offline learning algorithms, these algorithms do not need to re-process previous data or completely re-build the model once new data become available (Gama and Gaber 2007). In this way, they are able to update models faster. This is very useful when the amount of data is large. 

## Is the environment being modelled likely to suffer changes with time?
Environments that produce data may suffer changes over time. For example, software companies may hire new employees, may change their development process, may adopt new programming languages, etc. Such changes may cause old data to become obsolete. They may also bring back situations that used to occur in the past but were not occurring recently. Therefore, simply using all past data can lead to contradictory and misleading models. When temporal information about the data is available, change detection techniques can be used in combination with online or chunk-based algorithms (Gama and Gaber 2007) to identify when a change that affects the adequacy of the current model is occurring (Minku and Yao 2012a), which existing models best represent the current situation (Minku and Yao 2012b) and how to update models to the new situation (Minku and Yao 2014). When an environment presents the potential to suffer changes, it is essential to collect additional data over time in order to identify such changes and adapt data models accordingly. 

## Is your problem a prediction / estimation problem? If so, what do you really need to predict / estimate?
In prediction / estimation problems, we wish to predict / estimate a certain category or quantity based on features describing an observation. In these cases, it is important to decide what the target to be predicted really is and then use chose appropriate algorithms for this type of target. 

For example, we may wish to estimate the number of bugs in a software component based on features such as its size, complexity, number of commented lines, etc. For that, we should use a regression algorithm. Or, we may wish to predict whether or not a certain software component contains bugs based on such features, instead of predicting the exact number of bugs. For that, we should use a classification algorithm. Or, we may wish to estimate the ranking of components based on their bug-proneness. For that, we should use a ranking algorithm. Depending on data availability, estimating the precise number of bugs may be more difficult then simply predicting whether or not a component is likely to contain bugs, but also less informative. A good balance between these two may be found by ranking modules instead (Yang et al 2015). 

## Do you have a prediction problem where unlabelled data are abundant and labelled data are expensive? 
In order to create predictive models, supervised learning algorithms count with the existence of several past observations whose quantity / category to be estimated is known (labelled data). These algorithms are said to be taught these labels by a "teacher". Even though the existence of a teacher can help us to create good predictive models, it is sometimes expensive to hire such a teacher, i.e., it is sometimes expensive to collect labels. This may result in few labelled data despite the existence of abundant unlabelled data. An example of that is the problem of software effort estimation, where information about the effort required to develop a software project is costly, whereas collection of other features describing the software project may be automated (Kocaguneli et al 2013ab). 

Semi-supervised learning algorithms are able to use abundant unlabelled data in combination with few labelled data in order to improve the predictive ability of models. They learn the structure underlying the data based on the unlabelled data, and then combine knowledge about this structure with the available labels in order to build predictive models. If it is possible to request specific observations to be labelled, one can also use active learning algorithms. These algorithms are able to determine which observations should be furthered labelled in order to improve the predictive models (Kocaguneli et al 2013b).

## Are your data imbalanced?
In some cases, there may be abundant labelled data of certain categories, but little labelled data from other categories. This imbalance nature of the data may be a result of different costs associated to the collection of data from different categories, or may be because certain categories are simply less common. Software defect prediction is an example of imbalanced problem, where are are typically less buggy software components than non-buggy ones. Class imbalance learning techniques based on sampling and possibly artificially generating additional examples of the less common category can be helpful for dealing with that (Wang and Yao 2012).


## Do you need to use data from different sources?
Even though there may be little data from within the targeted environment, there may be more data available from other environments. Such data may be useful to improve models for the targeted environment. For example, in software defect prediction, there may be little data telling whether components within a given software are buggy, but a lot of data from other softwares. Learning algorithms able to transfer knowledge from other environments to the targeted environment can be used in these cases (Minku and Yao 2012ab, Turhan et al 2009, Nam et al 2013). 


## Do you have big data?
Certain data analyses may need to process large quantities of potentially complex data, causing traditional algorithms to struggle in terms of computational time. This may be the case, for example, of modelling developers behaviour based on large software repositories hosting hundreds of thousands of projects. Online learning algorithms able to process each observation only once can help to build models faster (Gama and Gaber 2007, Minku and Yao 2012a).


## Do you have little data?
When there is not so much data to learn from, learning algorithms tend to struggle to create accurate models. This is because the available data are not enough to represent a whole environment or population well. This is typically the case of software effort estimation data, but other software engineering problems may suffer similar issues. When there is not much data, simpler learning algorithms that do not have too many parameters to learn tend to perform better (Kocaguneli et al 2012).


## In summary, examine your data first, then chose the type of algorithm to consider
It is important to understand the issues faced by data analysis in order to select learning algorithms. It is also advisable to run experiments to compare different algorithms and find out which of them is best suited for your data.


## References
+ Tracy Hall, Sarah Beecham, David Bowes, David Gray and Steve Counsell. A Systematic Literature Review on Fault Prediction Performance in Software Engineering. <em>IEEE Transactions on Software Engineering</em>, vol. 38, no. 6, pp. 1276-1304, 2012.

+ Karel Dejaeger, Wouter Verbeke, David Martens and Bart Baesens. Data Mining Techniques for Software Effort Estimation: A Comparative Study. <em>IEEE Transactions on Software Engineering</em>, vol. 38, no. 2, pages 375-397, 2012.

+ Leandro Minku and Xin Yao. How to Make Best Use of Cross-company Data in Software Effort Estimation? <em>Proceedings of the 36th International Conference on Software Engineering</em>, pp. 446-456, 2014.

+ Le An and Foutse Khomh. An Empirical Study of Crash-inducing Commits in Mozilla Firefox. <em>Proceedings of the 11th International Conference on Predictive Models and Data Analytics in Software Engineering</em>, 2015 (accepted).

+ Joao Gama and Mohamed Gaber. Learning from Data Streams. Springer-Verlag Berlin Heidelberg, 2007.

+ Leandro Minku and Xin Yao. DDD: A New Ensemble Approach For Dealing With Concept Drift. <em>IEEE Transactions on Knowledge and Data Engineering</em>, vol. 24, no. 4, pp. 619-633, 2012a.

+ Leandro Minku and Xin Yao. Can Cross-company Data Improve Performance in Software Effort Estimation? <em>Proceedings of the 8th International Conference on Predictive Models in Software Engineering</em>, pp. 69-78, 2012b.

+ Xiaoxing Yang, Ke Tang and Xin Yao. A Learning-to-Rank Approach to Software Defect Prediction. <em>IEEE Transactions on Reliability</em>, vol. 64, no. 1, pp. 234-246, 2015.

+ Ekrem Kocaguneli, Bojan Cukic, Tim Menzies and Huihua Lu. Building a Second Opinion: Learning Cross-Company Data. <em>Proceedings of the 9th International Conference on Predictive Models in Software Engineering</em>, article no. 12, 2013a.

+ Ekrem Kocaguneli, Tim Menzies, Jacky Keung, David Cok, and Ray Madachy. Active learning and effort estimation: Finding the essential content of software effort estimation data. <em>IEEE Transactions on Software Engineering</em>, vol. 39, no. 2, pp. 1040-1053, 2013b.

+ Jaechang Nam, Sinno Pan and Sunghun Kim. Transfer Defect Learning. <em>Proceedings of the International Conference on Software Engineering<\em>, pp. 382-391, 2013.

+ Ekrem Kocaguneli, Tim Menzies, Ayse Bener, Jacky Keung. Exploiting the Essential Assumptions of Analogy-Based Effort Estimation. <em>IEEE Transactions on Software Engineering<\em>, vol. 38, no. 2, pp. 425-438, 2012.

+ Burak Turhan, Tim Menzies, Ayse Bener and Justin Distefano. On the Relative Value of Cross-Company and Within-Company Data for Defect Prediction. <em>Empirical Software Engineering</em>, vol. 14, no. 5, pp. 540-578, 2009.

+ Shuo Wang and Xin Yao. Using Class Imbalance Learning for Software Defect Prediction. <em>IEEE Transactions on Reliability</em>, vol. 62, no. 2, pp. 434-443, 2012.