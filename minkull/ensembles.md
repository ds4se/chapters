# The Wisdom of the Crowds in Software Engineering Predictive Modelling
Leandro L. Minku, Department of Computer Science, University of Leicester, UK

## The Wisdom of the Crowds

The wisdom of the crowds phenomenon has long been observed in cognitive, social and political sciences. The idea is that the combination of the judgements given by a large group of people on a certain matter is often better than the judgement given by any individual within this group. 

<div style="float: right;margin:10 10px 10px 10">
    ![Cow](cow.jpg = 150x150)
</div>


Classically, the wisdom of the crowds was studied in continuous estimation problems, even though it has also been studied in other types of problems. A landmark study was performed in 1906, when a contest was set up in a country fair in Plymouth (UK) to estimate the weight of a slaughtered and dressed ox. The person whose guess was the closest to the actual weight of 1198 pounds would win a prize. Around 800 people, including both experts and people with no expertise in judging weight of cattle, participated in the context. The interesting thing was that, even though people gave several different and wrong estimations, statistician Francis Galton found that the average guess of all the participants was 1197 pounds. The collective "wisdom" of the crowd was remarkably close to the actual weight of the ox, and better than the estimations given by any of the experts! 

The reason why the combined guess was so close to the actual value was that, even though individual guesses were frequently completely wrong, the overestimations of the weight given by some people cancelled out the underestimations given by others, resulting in an excellent combined guess. 

## So... how is that related to predictive modelling in software analytics?

Existing data on software projects and processes can be used to create predictive models able to help us with several different software engineering tasks, such as prediction of the effort required to develop software projects, prediction of whether a given software module is likely to contain bugs, prediction of whether a commit is likely to induce a crash, prediction of the energy likely to be consumed by a software program, etc. However, the accuracy of the predictions given by single models is sometimes not ideal. 

Similar to the wisdom of the crowds, in order to improve predictive accuracy, we can combine the predictions given by a crowd (ensemble) of different  models, instead of using a single model! Numeric predictions (e.g., effort or energy estimations) given by different individual models can be combined by taking their average. Categorical predictions (e.g., whether or not a software module is buggy, or whether or not a commit is likely to induce a crash) can be combined by choosing the category "voted" by the majority of the individual models. 

Predictive accuracy tends to improve more if individual models are diverse, i.e., if they make different mistakes. Otherwise, the combined prediction would make similar mistakes to the individual predictions, rather than individual mistakes cancelling each other out. Therefore, algorithms for creating ensembles of models consist of different techniques to create diverse individual models. An example of ensemble learning algorithm is bagging, which creates several different predictive models by training them with different uniform samples of the data. Another example are ensembles of models where each model is trained based on a different learning algorithm. Both of these ensembles have been shown to help improving predictive accuracy (and stability) in software engineering tasks (Minku and Yao 2013a; Kocaguneli et al 2012). 



## Crowds for transferring knowledge and dealing with changes

Sometimes there is not much data for building predictive models within a given environment, hindering the accuracy of predictive approaches. There may be more data available from other environments, but these data are not always directly relevant for predictions in the targeted environment. For example, the effort required to develop a certain software project within a given company may be different from the effort required in another company because they adopt different management strategies. So, a software effort estimation model created with data from one of these companies may not be directly applicable to the other. 

<div style="float: left;margin:10 10px 10px 10">
    ![SnowBeach](snow-beach.jpg)
</div>

Even though data from different environments are not always compatible, they may become more or less relevant over time. This is because environments may change over time, becoming more or less similar to other environments. For example, a software company may adopt a new software development process, resulting in its productivity becoming more similar to other companies that adopt this process. If we can identify <em>when</em> data from other environments become useful and <em>how much useful</em> they are, we can benefit from them to create better predictive models. 

Ensembles are useful in this context because they can maintain several different models representing different environments. When changes affect the adequacy of a given model to the targeted environment, we can identify which other models would be most adequate for the new situation, based on a few new data examples from the targeted environment. We can then emphasise the predictions of these most adequate models. This is useful for improving predictive performance while there are not enough new examples from the targeted environment to create a whole new model to represent the new situation of this environment. Given that it may take a lot of time and effort to collect enough new data from the targeted environment, ensemble approaches can be particularly useful to transfer knowledge from different models in changing environments (Minku and Yao 2012). 

Moreover, it is possible to use a few incoming examples from the targeted environment to learn functions able to map the predictions given by models representing different environments to the context of the targeted environment. An ensemble of such mapped models can transfer knowledge from models representing environments that do not directly match the targeted environment. This can greatly reduce the number of examples that need to be collected from within the targeted environment, being particularly useful when data collection is expensive within the targeted environment (Minku and Yao 2014). 


## Crowds for multiple goals

Ensembles of models can also be used to deal with different goals in software engineering predictive tasks. For example, in software bug prediction, one may wish to point out the largest possible number of software components that contain bugs at the same time as making very few mistakes in terms of pointing out a non-buggy software module as buggy. These are two different and often conflicting goals. In order to deal with different goals, we can create models that emphasise different goals. Combined, these models can provide a good trade-off among different goals (Minku and Yao 2013b).

## A crowd of insights

Ensembles have the potential to provide several insights into software engineering. Besides the insights produced by the predictions themselves, different models representing different environments can give us insights into the differences between these environments. In particular, when used for software effort estimation, ensemble models themselves can be visualised in order to reveal how a company's productivity compares to the productivity of other companies (Minku and Yao 2014). This can then be used to monitor how the productivity of a company changes over time in comparison to other companies and to help identifying areas where improvement is needed. The differences between the predictions given by different models to different sets of input values can also potentially lead to insights into how best choices can vary from one environment to another, and whether it is worth trying to migrate from one environment to another.

## Ensembles as versatile tools

In summary, ensembles are versatile tools that can help us to deal with different issues in software engineering predictive modelling. They can help us to improve predictive accuracy (and stability) across data sets, to deal with changes and transfer knowledge, to deal with different objectives, and to gain insights into software processes. 

## References

+ Ekrem Kocaguneli, Tim Menzies and Jacky Keung. On the value of ensemble effort estimation. <em>IEEE Transactions on Software Engineering</em>, vol. 38, no. 6, pp. 1403-1416, 2012.

+ Leandro L. Minku and Xin Yao. Can Cross-company Data Improve Performance in Software Effort Estimation? <em>Proceedings of the 8th International Conference on Predictive Models in Software Engineering (PROMISE'2012)</em>, pp. 69-78, 2012.

+ Leandro L. Minku and Xin Yao. Ensembles and Locality: Insight on Improving Software Effort Estimation. <em>Information and Software Technology</em>, vol. 55, no. 8, pp. 1512-1528, 2013a.

+ Leandro L. Minku and Xin Yao. Software Effort Estimation as a Multi-objective Learning Problem. <em>ACM Transactions on Software Engineering and Methodology</em>, vol. 22, no. 4, article no. 35, 2013b.

+ Leandro L. Minku and Xin Yao. How to Make Best Use of Cross-company Data in Software Effort Estimation? <em>Proceedings of the 36th International Conference on Software Engineering (ICSE'14)</em>, pp. 446-456, 2014.

