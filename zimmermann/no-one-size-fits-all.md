#No "One Size Fits All"
_Thomas Zimmermann, Microsoft Research_

I've spent a large part of my career building defect prediction models. The goal of these models is to explain and in some cases even predict where defects will occur. Typically such models use a set of metrics, such as lines of codes, complexity, etc. and establish some relationship to the presence or the number of defects.

One day back in 2009, Nachi Nagappan, Brendan Murphy, Harald Gall, Emanuel Giger, and I ran a simple experiment [1]: Do defect models built for Internet Explorer predict defects in Firefox and vice versa? Our hypothesis was the models are predictive because both projects belonged to same application domain (browsers) with similar features. The outcome was not what we expected: Firefox models could predict IE defects, but IE models could not predict Firefox defects. Why?

We collected datasets for 12 more projects with multiple version and ran a total of 622 cross project prediction experiments. The shocking number: only 21 times (3.4%!!!) the experiment was successful, that is the defect model could predict with precision, recall, and accuracy of 75% or higher. With a decision tree analysis, we identified some similarities that mattered more for a successful cross-project defect prediction. For example to achieve a high precision, it was beneficial to have about the same number of observations in the datasets, projects that do not use databases, and have about the same median churn. 

The main lesson: **There is no one size fits all model.** Even if you find models that works for most, they will not work for everyone. Academics like the search for general models. In contrast industrial practitioners are often fine with models that just work for their data if the model provides some insight or allows them to work more efficiently. In this context, I often bring an analogy with NFL. As a coach you want to figure out a technique that helps to improve your team by as much as possible. You're not interested if your technique also works for other team. If it doesn't even better because it could provide you with a competitive advantage. You want what's best for your team.

The good news is that while empirical findings often do not generalize to different contexts, the methods typically are applicable on different datasets. So bad news for the NFL coaches among you. In most cases, I can follow the same steps that used to build a prediction model on Internet Explorer data to learn a model from Firefox data. The model Firefox model will then most likely work on Firefox data. From an academic perspective, it is important to document and share these steps; see also the essay by Barbara Russo on Data Analysis Patterns.

Fortunately since our initial analysis in 2009, other researchers figured out how to build more effective cross-project prediction models [2-4], which can help projects with no or low-quality data to benefit from predictive models.

## References

1. Thomas Zimmermann, Nachiappan Nagappan, Harald C. Gall, Emanuel Giger, Brendan Murphy: Cross-project defect prediction: a large scale experiment on data vs. domain vs. process. ESEC/SIGSOFT FSE 2009: 91-100

2. Burak Turhan, Tim Menzies, Ayse Basar Bener, Justin S. Di Stefano: On the relative value of cross-company and within-company data for defect prediction. Empirical Software Engineering 14(5): 540-578 (2009)

3. Jaechang Nam, Sinno Jialin Pan, Sunghun Kim: Transfer defect learning. ICSE 2013: 382-391

4.  Leandro L. Minku, Xin Yao: How to make best use of cross-company data in software effort estimation? ICSE 2014: 446-456

