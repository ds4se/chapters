How Data Scientists can Effectively Impact Organizations
==================================================================

Miryung Kim


Data Science has become popular over the past few years as companies have recognized the value of data, either in data products, or to optimize operations and to support decision making. Not only did Davenport and Patil proclaim that data scientist would be “the sexiest job of the 21st century,” [2] many authors have published data science books based on their own experiences (see books by O’Neill and Schutt [3], Foreman [4], or May [5]). Patil summarized strategies to hire and build effective data science teams based on his experience in building the data science team at LinkedIn. 

Software produces large quantities of data, such as user-oriented telemetry data, repository-based productivity and quality data, and business-oriented process data. Software development organizations are hiring data scientists to debug software, to estimate failure rates, to identify new features, and to assess software reliability.  

Kim et al. [1] conducted interviews with 16 data scientists across several product groups at Microsoft. This chapter describes some lessons that we learned from the data scientists regarding how they increase the impact and actionability of their work and the strategies that they use to ensure that their results matters for the company.

"Actionability is actually a big thing. If it’s not actionable, the engineers then look at you, say, “I don’t know what to do with this, so don’t even bother me.”

The strategies discussed in this chapter are from the study of data scientists at Microsoft. The complete details are in a technical report [1], which also include other information such as why data scientists are needed in software development teams, the education and training background of data scientists and their skillsets, the problems that data scientists work on and their daily activities, the organization structure of data scientist teams, how they interact with others in the teams, etc. 

## Choose the Right Questions for the Right Team
An important strategy for success is to choose the right questions for the right team. One data scientist described three conditions that must be met before his data science team engages in a project: priority, actionability, and commitment. 

"(a) Is it a priority for the organization (b) is it actionable, if I get an answer to this, is this something someone can do some- thing with? and, (c), are you as the feature team — if you're coming to me or if I'm going to you, telling you this is a good opportunity — are you committing resources to deliver a change? If those things are not true, then it's not worth us talking anymore."

It is important to define actions in addition to generating insights from data. 

"You need to think about, “If you find this anomaly, then what?” Just finding an anomaly is not very actionable. What I do also involves thinking, “These are the anomalies I want them to detect. Based on these anomalies, I’m going to stop the build. I’m going to communicate to the customer and ask them to fix something on their side.”

For data scientists, there are many more questions to pursue than they have time and resources for. So it is important for them to choose questions that enable their stakeholders to achieve their goals.

## Work Closely with Your Consumers
Another strategy that was mentioned in several interviews was to interact closely and engage with the stakeholders who plan to consume the results from the data analysis. Data scientists often set up channels such as weekly data meet-ups and brown bag lunches to regularly deliver project outcomes. It is important for stakeholders to define the questions and scenarios addressed by data analysis early and often. To make their data science work adopted by stakeholders, data scientists iterate with them to interpret the data and refine important questions and scenarios. 

"You begin to find out, you begin to ask questions, you being to see things. And so you need that interaction with the people that own the code, if you will, or the feature, to be able to learn together as you go and refine your questions and refine your answers to get to the ultimate insights that you need."

## Validate and Calibrate Your Data
The validation of quantitative data through qualitative channels was also mentioned as a criteria to ensure that measurements are meaningful and lead to correct actions. 

"If you could survey everybody every ten minutes, you don’t need telemetry. The most accurate is to ask everybody all the time. The only reason we do telemetry is that (asking people all the time) is slow and by the time you got it, you’re too late. So you can consider telemetry and data an optimization. So what we do typically is 10% are surveyed and we get telemetry. And then we calibrate and infer what the other 90% have said."

It is important for data scientists to triangulate multiple data resources to increase the confidence in their analysis results. 


## Speak Plainly to Give Results Business Value
Many data scientists emphasized the need to explain findings in simple terms to non-experts. Talking to non-experts also required the development of intuitive measurements. Data scientists need to “translate” findings into business values such as dollars saved, customer calls prevented, and number of days that a product can be shipped early. Reporting precision, recall, and ROC curves, while convenient for the data scientists, is of less importance when presenting findings to analytics consumers.

Some data scientists argued that producing fancy results is bad, because fancy requires them to be there to explain in order for the person reading the results to figure out what’s going on. So, it is better to produce easy-to-understand results than statistically valid yet complex results. 

## Go the Last Mile – Operationalizing Predictive Models
A strategy that we noticed in several interviews was the willingness to go the last mile to actively contribute to the operationalization of predictive models. 

"They accepted (the model) and they understood all the results and they were very excited about it. Then, there’s a phase that comes in where the actual model has to go into production. ... You really need to have somebody who is confident enough to take this from a dev side of things." 

Many stakeholders want to deploy predictive models as a part of the product, so it is important to produce working software that leverages and integrates the predictive models. Producing accurate models that are not integrated or instantiated as new software features is not useful for the stakeholders. This implies that data scientists must be not only scientists who draw new findings but engineers who build systems based on their findings. 

1. M. Kim, T. Zimmermann, R. DeLine, and A. Begel, "The Emerging Role of Data Scientists on Software Development Teams", "Technical Report MSR-TR-2015-30 

2. T. H. Davenport and D. Patil, "Data Scientist: The Sexiest Job of the 21st Century," Harvard Business Review, pp. 70-76, October 2012.

3. C. O'Neil and R. Schutt, Doing Data Science: Straight Talk from the Frontline, O'Reilly Media, 2013.

4. J. W. Foreman, Data Smart: Using Data Science to Transform Information into Insight, Wiley, 2013.

5.  T. May, The New Know: Innovation Powered by Analytics, Wiley, 2009.

