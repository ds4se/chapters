# The Wisdom of the Crowds in Predictive Modelling for Software Engineering
Leandro L. Minku, Department of Computer Science, University of Leicester, UK

## The Wisdom of the Crowds

The wisdom of the crowds phenomenon has long been observed in cognitive, social and political sciences. The idea is that the combination of the judgements given by a large group of people on a certain matter is often better than the judgement given by any individual within this group. 

Classically, the wisdom of the crowds was studied in continuous estimation problems, even though it has also been studied in other types of problems. A landmark study was performed in 1906, when a contest was set up in a country fair in Plymouth (UK) to estimate the weight of a slaughtered and dressed ox. The person whose guess was the closest to the actual weight of 1198 pounds would win a prize. Around 800 people, including both experts and people with no expertise in judging weight of cattle, participated in the contest. The interesting fact was that, even though people gave several different and wrong estimations, statistician Francis Galton found that the average guess of all the participants was 1197 pounds. The collective "wisdom" of the Plymouth crowd was remarkably close to the actual weight of the ox, and better than the estimations given by any of the experts (Galton 1907)! 

The reason why the combined guess was so close to the actual weight was that, even though individual guesses were frequently completely wrong, the overestimations of the weight given by some people cancelled out the underestimations given by others, resulting in an excellent combined guess. 

## So... how is that related to predictive modelling for software engineering?

Existing data on software projects and processes can be used to create predictive models able to help us with several different software engineering tasks, such as prediction of the effort required to develop software projects, prediction of whether a given software module is likely to contain bugs, prediction of whether a commit is likely to induce a crash, prediction of the energy likely to be consumed by a software program, etc. However, the accuracy of the predictions given by single models is sometimes not ideal. 

Similar to the wisdom of the crowds, in order to improve predictive accuracy, we can combine the predictions given by a crowd (ensemble) of different models, instead of using a single model! Numeric predictions (e.g., effort or energy estimations) given by different individual models can be combined by taking their average, allowing errors to cancel each other out. Categorical predictions (e.g., whether or not a software module is likely to be buggy, or whether or not a commit is likely to induce a crash) can be combined by choosing the category "voted" by the majority of the individual models. In this case, the correct categories predicted by some of the models can compensate for the incorrect categories predicted by the others.

## Examples of ensembles and factors affecting their accuracy

The predictive accuracy of an ensemble tends to improve more if individual models are not only themselves accurate, but also diverse, i.e., if they make different mistakes. Without diversity, the combined prediction would make similar mistakes to the individual predictions, rather than individual mistakes cancelling each other out or correct predictions compensating for incorrect ones. Therefore, algorithms for creating ensembles of models consist of different techniques to create diverse (and not only accurate) individual models. 

An example of ensemble learning algorithm is bagging (Breiman 1996). Given a learning algorithm for creating single predictive models and a data set, bagging creates diverse predictive models by feeding different uniform samples of the data set to the learning algorithm in order to create each model. Another example of ensembles are heterogeneous ensembles where each individual model is created based on a different learning algorithm in order to produce different models (Perrone and Cooper 1993). Both of these ensembles have been shown to help improving predictive accuracy (and stability) in software engineering tasks (Minku and Yao 2013a; Kocaguneli et al 2012). 

Besides individual models' predictive accuracy and diversity, another factor that can influence the predictive accuracy of ensembles is their size, i.e., the number of individual models composing the ensemble. A too small ensemble size (e.g., 2 models) may not be enough to improve predictive accuracy. A large ensemble size may use extra computational resources unnecessarily, or even cause reductions in predictive accuracy if too large, e.g., 10,000+ models (Grove and Schuurmans 1998). Even though some early studies suggested that ensembles with as few as 10 models were sufficient for improving predictive accuracy (Hansen and Salamon 1990), other studies suggested that predictive accuracy can be further improved by using more than 10 models, e.g., 25 modes (Opitz and Maclin 1999). The minimum ensemble size before further improvements in predictive accuracy cease to be achieved is likely to depend both on the predictive task and the learning algorithms involved.

## Crowds for transferring knowledge and dealing with changes

Sometimes there is not much data for building predictive models within a given environment, hindering the accuracy of predictive approaches. There may be more data available from other environments, but these data are not always directly relevant for predictions in the targeted environment. For example, the effort required to develop a certain software project within a given company may be different from the effort required to develop the same project in another company because these companies adopt different management strategies. So, a software effort estimation model created with data from one of these companies may not be directly applicable to the other. 

Even though data from different environments are not always compatible, they may become more or less relevant over time. This is because environments may change over time, becoming more or less similar to other environments. Changes in the environment are referred to as concept drifts by the machine learning community. As an example, a software company may adopt a new software development process, resulting in its productivity becoming more similar to the productivity of other companies that adopt this process.  If we can identify <em>when</em> data from other environments become useful and <em>how much useful</em> they are, we can benefit from them to create better predictive models. 

Ensembles are useful in this context because they can maintain several different models representing different environments. When changes affect the adequacy of a given model to the targeted environment, we can identify which other models would be most adequate for the new situation, based on a few new data examples from the targeted environment. We can then emphasise the predictions of the most adequate models. This is useful for improving predictive accuracy while there are not enough new examples from the targeted environment to create a whole new model representing the new situation of this environment. Given that it may take a lot of time and effort to collect enough new data from the targeted environment, ensemble approaches can be particularly useful to transfer knowledge from different models in changing environments (Minku and Yao 2012). 

Moreover, it is possible to use a few incoming examples from the targeted environment to learn functions able to map the predictions given by models representing different environments to the context of the targeted environment. An ensemble of such mapped models can transfer knowledge from models representing environments that do not directly match the targeted environment. This can greatly reduce the number of examples that need to be collected from within the targeted environment, being particularly useful when data collection is expensive within the targeted environment (Minku and Yao 2014). 


## Crowds for multiple goals

Ensembles of models can also be used to deal with different goals in software engineering predictive tasks. For example, in software bug prediction, one may wish to identify the largest possible number of software components that contain bugs at the same time as making very few mistakes in terms of pointing out a non-buggy software module as buggy. These are two different and often conflicting goals. In order to deal with different goals, we can create models that emphasise different goals. Combined, these models can provide a good trade-off among different goals (Minku and Yao 2013b).

## A crowd of insights

Ensembles have the potential to provide several insights into software engineering. Besides the insights given by the predictions themselves, different models representing different environments can give us insights into the differences between these environments. In particular, when used for software effort estimation, ensemble models  can themselves be visualised in order to reveal how a company's productivity compares to the productivity of other companies (Minku and Yao 2014). This can then be used to monitor how the productivity of a company changes over time in comparison to other companies and help identifying areas where improvement is needed. The differences between the predictions given by different models to different sets of input values can also potentially lead to insights into how best choices vary from one environment to another, and whether it is worth trying to migrate from one environment to another.


## Ensembles as versatile tools

In summary, ensembles are versatile tools that can help us to deal with different issues in predictive modelling for software engineering. They can help us to improve predictive accuracy (and stability) across data sets, to deal with changes and transfer knowledge, to handle different goals, and to gain insights into software processes. 

Even though some ensemble approaches have potential drawbacks, depending on the problem in hand, other ensemble approaches can actually help us to overcome these drawbacks. For example, a potential drawback of ensembles is the possible increase in the computational resources (e.g., running time and memory) required for creating ensembles in comparison to single models. Even though many ensemble approaches do not increase the time and memory <em>complexity</em> of the learning algorithms used by their individual models, their increase in required computational resources may still become a problem for very large data sets. That said, several other ensemble approaches are specifically designed to reduce the computational resources that would be required by single models when data sets are very large. This can be easily achieved, for example, by creating individual models with disjoint subsets of the data, as done by chunk-based incremental learning ensembles (Street and Kim 2001). 

Another potential drawback of ensembles is lack of explanatory power. As the ensemble size increases, it becomes difficult to "read" ensembles in order to explain how exactly their predictions are made. This is not a problem if practitioners are more interested in how helpful the predictions themselves are, rather than in how the predictions are made. However, if practitioners wish to understand the models behind the predictions, lack of explanatory power can become a problem. Even though lack of explanatory power is a drawback of many ensemble approaches, some ensemble approaches do not hinder explanatory power or can even help us to understand certain conditions better. For example, ensembles where a single model is created for each different environment can be useful for understanding the relationship and the differences between environments (Minku and Yao 2014).

To learn more about ensembles and their applications to software engineering, I recommend Polikar (2006)'s and Menzies et al (2014)'s manuscripts, respectively.



## References

+ Leo Breiman. Bagging Predictors. <em>Machine Learning</em>, vol. 24, no. 2, pp. 123-140, 1996.

+ Adam J. Grove and Dale Schuurmans. Boosting in the limit: Maximizing the margin of learned ensembles. <em>Proceedings of the Fifteenth National Conference on Artificial Intelligence</em>, pp. 692-699, 1998.

+ Francis Galton. Vox Populi. <em>Nature</em>, pp. 450-451, 1907. URL: http://galton.org/essays/1900-1911/galton-1907-vox-populi.pdf (accessed on 04 January 2016).

+ Lars K. Hansen and Peter Salamon. Neural Network Ensembles. <em>IEEE Transactions on Pattern Analysis and Machine Intelligence</em>, vol. 12, no. 10, pp. 993-1001, 1990.

+ Ekrem Kocaguneli, Tim Menzies and Jacky Keung. On the value of ensemble effort estimation. <em>IEEE Transactions on Software Engineering</em>, vol. 38, no. 6, pp. 1403-1416, 2012.

+ Tim Menzies, Ekrem Kocaguneli, Leandro L. Minku, Fayola Peters and Burak Turhan. Sharing Data and Models in Software Engineering, Part IV - Sharing Models. Morgan Kaufmann, 2014.

+ Leandro L. Minku and Xin Yao. Can Cross-company Data Improve Performance in Software Effort Estimation? <em>Proceedings of the 8th International Conference on Predictive Models in Software Engineering (PROMISE'2012)</em>, pp. 69-78, 2012.

+ Leandro L. Minku and Xin Yao. Ensembles and Locality: Insight on Improving Software Effort Estimation. <em>Information and Software Technology</em>, vol. 55, no. 8, pp. 1512-1528, 2013a.

+ Leandro L. Minku and Xin Yao. Software Effort Estimation as a Multi-objective Learning Problem. <em>ACM Transactions on Software Engineering and Methodology</em>, vol. 22, no. 4, article no. 35, 2013b.

+ Leandro L. Minku and Xin Yao. How to Make Best Use of Cross-company Data in Software Effort Estimation? <em>Proceedings of the 36th International Conference on Software Engineering (ICSE'14)</em>, pp. 446-456, 2014.

+ David Opitz and Richard Maclin. Popular ensemble methods: an empirical study. <em>Journal of Artificial Intelligence Research</em>, vol. 11, pp. 169-198, 1999.

+ Michael P. Perrone and Leon N. Cooper. When networks disagree: Ensemble methods for hybrid neural networks. In R. J. Mammone, editor, <em>Neural Networks for Speech and Image Processing</em>, pp 126–142, ChapmanHall, 1993.

+ Robi Polikar. Ensemble based systems in decision making. <em>IEEE Circuits and Systems Magazine</em>, vol. 6, no. 3, pp. 21-45, 2006.

+ W. Nick Street and WongSeog Kim. A streaming ensemble algorithm (SEA) for large-scale classification. <em>Proceedings of the 7th ACM SIGKDD International Conference on Knowledge Discovery and Data Mining</em>, pp. 377-382, 2001.
