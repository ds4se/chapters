##  Lies, Damned Lies and Analytics: Why Big Data Needs Thick Data

* TODO: add references to other chapters that may touch on the points raised in this one
* TODO: one more pass on writing style, flow.


### How great it is, to have data like you

In a relatively short time, software analytics or the use of computational methods on "big" data in software engineering, is transforming the ways software is developed, used, improved and deployed [Zhang2012]. 

We now have vast amounts of software data at our finger tips. Data on usage patterns, development methods, software quality, user opinions and more.   This is data at a scale that researchers and practitioners alike could only dream of in the past.  But more than that, we also have sophisticated and "intelligent" methods for mining, cleaning, classifying, clustering, predicting,  recommending, sharing and visualizing this data.   We can, for example,  discover unproductive developers and teams, identify development processes and programming languages that lead to buggier software, spot unusable or insecure software features, and recommend how the software should be used in different contexts. OK, there is still much to be done in improving the types and the scale of data that are collected and improving tools for analyzing such data, but the path to our desired future is clearly illuminated.  Isn't it?

In this short article, I ask you, the reader, to consider the risks from following and pursuing this utopian Software Analytics Path and to ponder: are we asking the right questions, are we answering the questions correctly, are we anticipating the impact these answers may have, and more importantly are we ready to handle the inevitable changes these potentially disruptive insights will bring on the human-centric socio-technical settings these insights emerge from.   
	
### Looking for answers in all the wrong places

As humans we often have a tendency to "look for the car keys where the light shines" or to go after the "low hanging fruit".Indeed, technologists (I won't use the term geeks here) may be particularly attracted by the "shininess" of data that is both quantifiable and relatively easy to collect.  
But important insights that our stakeholders may care about will often lie in qualitative data that is unstructured, messy and resistent to automatic collection and analysis methods. 

Consider for example data from A/B testing, although it will help a designer understand which feature is preferred, it may be the blog posts and tweets that provide insights into why a particular feature is shunned by its users.
Qualitative data requires the application of sound and rigorous manual analysis methods to make sense of it 
[Seaman1999].  But a warning, these manual qualitative methods are both time consuming and expensive, and such efforts to reveal rich and insightful stories are unfortunately often not valued by some stakeholders that have a tendency to only trust "numbers" and "statistics".  

### Beware the reality distortion field

But no matter which data is analyzed (quantitative or qualitative), it is important for Software Analysts to do a reality check and to ask if the data under consideration is really bringing about an "epiphany" or an "apopheny" [boyd2011].   

We may start off with an awareness that the metrics or measurements defined may only be loosely connected to the concepts being studied, but over time this connection becomes hardened and the risks in relying on the construct are long forgotten.   The answers that emerge may be completely wrong if the constructs that are used are poor representations of reality (e.g., # of commits as a proxy for developer productivity), or the data may have biases that are  hidden (e.g., some developers may game the number of commits when they realize commits are being counted),  or the data that is collected is somehow inaccurate (e.g., layers of tool integrations may lead to multiple counting of certain commits).   

Furthermore, it may be possible that when we have so much data,  meaningless patterns and correlations may emerge, and small effects may be highly significant. The New York Times mentions this example when discussing limitations of big data: 
"The first thing to note is that although big data is very good at detecting correlations, especially subtle correlations that an analysis of smaller data sets might miss, it never tells us which correlations are meaningful. A big data analysis might reveal, for instance, that from 2006 to 2011 the United States murder rate was well correlated with the market share of Internet Explorer: Both went down sharply. But it’s hard to imagine there is any causal relationship between the two." [Marcus2014]  

Finally, Software Analysts need to remember that although "data" itself may be rational, the creators of much of this data (the humans), whether they passively or actively create it, may not be rational and may not do things in a way we anticipate for the reasons we think we understand [Harper2013].   All human stakeholders may have hidden motivations, that even they do not wish to acknowledge within their own distorted view of reality.

### Build it and they will come, but should we?

Even assuming we can find a good and reasonably fair way to represent and provide insights on some version of "reality", should we?   We sometimes witness a "build it because we can" attitude with the tools and methods Software Analysts develop. But access to data and especially to derived data, brings many potential opportunities for misuse or worse for abuse, especially when there are power imbalances or politics at play.  

The ethics behind the kinds of trace data,  i.e., from the direct or indirect actions of one or more humans, that can be collected, aggregated, analyzed, repurposed and presented has not been adequately considered.   In some cases, it is of course, very hard, if not impossible, to predict the negative implications that may arise.  But Software Analysts need to acquire skills at recognizing and  anticipating some of these ethical issues, or to form alliances with those that do.  The fallout from the "mood manipulation" study at Facebook, has led to data scientists across many domains calling for an ethical framework or set of policies they can use as guidance (http://www.informationweek.com/big-data/big-data-analytics/data-scientists-want-big-data-ethics-standards/d/d-id/1315798).  Some domains, notably health, do have such guidelines in place, but this is not the case for many other domains, e.g., web-based businesses.

### To classify is human, but analytics relies on algorithms

Even when we are armed with the best intentions and do pay attention to ethical issues, there may still be risks lurking in the shadows. 

Human beings seem to have an innate desire not just to count things, but also to classify.  Bowker and Star in their landmark article [Bowker1999] warn us about the drastic implications that some classification systems have had on the world we live in and on people.  They describe how health classifications (such as those going back to the 1900's) are used to determine which diseases are "counted" and therefore should have treatments paid for by insurance companies.  People suffering from rare diseases may be out of luck. 

Similarly, when we use software analytics, and decide to count some features, but not others, we make decisions about what is valued and what is not.  Managers for example may be implicitly making decisions about the value of certain activities their employees do.  For example, they may count the number of code reviews done in a week signaling those are valued, but they may not count (because they can't!) the number of times those same employees mentored newcomers to do more effective code reviews.  

Furthermore, when humans make judgements, as humans ourselves we may have at least some insights into the biases they are likely to have, but when judgements are made or based on algorithms, many of the biases become opaque to the consumers to those analytics [Tufekci2015]. 

### Lean in:  How ethnography can improve software analytics and vice versa

Software Analytics is an important field of research and practice, there is no doubt.  But how can it be improved?   It is too simplistic to quote the mythical quantitative-qualitative divide in software engineering.  The more important difference to consider here is about WHO generates the data.  Is it the participants of the phenomenon under study that create the so called trace data (or as McGrath refers to them "outcroppings of past behaviour" [McGrath1995]),  or is the data generated by researchers (e.g., through interviews, surveys or observations in the field)? 

This latter kind of data (much of which may qualitative, but not always), may be much harder to collect and analyze (http://www.gousios.gr/blog/Scaling-qualitative-research/), but it can be used to augment and enrich the big data that is harvested and analyzed with the purpose to form richer insights about a software scenario under study.   Ethnographic methods, that is direct studies of the field under study, can be used to inform which questions we should spend time trying to answer, which data we should collect (and conversely which data we should NOT collect), what is the meaning of the data that is collected, and how should those insights be shared and used. 

Moreover, data may tell you what is going on (giving us results), but they won't necessarily tell you why a phenomenon is happening nor how you can fix a noted problem (that is, theory may be lacking) [Easterbrook2008].  For example, from our previous research [Singer2013], from data alone we could tell that some developers use Twitter and some do not. But we could not understand the benefits or barriers some developers faced until we probed further through interviews and surveys.  Furthermore, by talking directly to users and non-adopters of Twitter, we were able to discover recommendations that may lower barriers to other developers wishing to avail of the advantages that using Twitter may bring.  Such insights could only be generated by us as researchers asking these questions in a field setting, not by analyzing trace data alone.

On the other side, ethnography can likewise benefit from data science! 
Ethnographic methods can be subject to respondent and researcher biases, problems in self reporting, issues with ambiguity and lack of precision in the data collected.   Furthermore, the findings from such methods can be dangerous to generalize to broader populations of actors.  In light of these limitations, data science is  being seen by many social scientists as the "new kid on the block" and  many ethnographers are thus turning to  "ethnomining" methods to enhance the work they do and to benefit from the big data they can gain access to (http://ethnographymatters.net/editions/ethnomining/).  There is no doubt that this big data increase the reliability of and speeds up many kinds of insights, an improvement in speed that is much appreciated in today's world of rapid technology development, diffusion and adoption.   

### Finding the ethnographer within

So far we have asked you, the reader, to consider the risks that may arise from developing and using Software Analytics' methods and we have made a call for software analysts to partner with ethnographers to improve the questions that are asked, to bring more meaning to the data being analyzed and to call into question the ethics of the analytics being applied.   In an ideal world, both methods would be applied in tandem by experts in both disciplines.  This is perhaps more feasible and more important in research settings then in practice, as research relies on social theories as a foundation for analytics. 

In terms of practitioners, we do recognize that using ethnographic methods to collect thick data to enrich big data, is challenging, expensive, and time consuming, and in many cases just not feasible.  Instead, we suggest that practitioner software analysts should spend much more time thinking like an ethnographer and seek out stories about real people that will bring richness to the data being analyzed, and for them to consider and imagine the possible implications of the analytics that may arise in the short and long terms. 

Tool builders should think not just about the analyst perspective but also consider the consumer of the analyses (that may be provided with reports, visualizations or interactive and customizable dashboards).  Do these tools support stakeholders in adding "meaning" to these reports, dashboards and visualizations through conversations, annotations and links to other resources?   Should these tools themselves be designed so that data concerning their use can be analyzed to gain more insights into how Software Analytics is used and how?

In summary, we make a plea for Software Analytics' researchers and practitioners to consider these issues, to discuss them, and to share both positive and negative experiences with one another.


### References 

   * [Zhang2012] Dongmei Zhang & Tao Xie, [Software Analytics in Practice, a Mini-Tutorial at ICSE 2012](http://research.microsoft.com/en-us/groups/sa/softwareanalyticsinpractice_minitutorial_icse2012.pdf) 
   * [Seaman1999] Carolyn Seaman, "Qualitative methods in empirical studies of software engineering", IEEE Transactions on Software Engineering, pp. 557-572, vol 25(4). 
   * [boyd2011] boyd, danah and Crawford, Kate, "Six Provocations for Big Data", A Decade in Internet Time: Symposium on the Dynamics of the Internet and Society, September 2011.
   * [Marcus2014] Gary Marcus and Ernest Davis, "Eight (No, Nine!) Problems with Big Data", [New York Times, April 6, 2014](http://www.nytimes.com/2014/04/07/opinion/eight-no-nine-problems-with-big-data.html?_r=1)
   * [Harper2013] Richard Harper, Christian Bird, Thomas Zimmermann, and Brendan Murphy"Dwelling in Software: Aspects of the felt-life of engineers in large software projects", Proceedings of the 13th European Conference on Computer Supported Cooperative Work (ECSCW '13), Springer, September 2013. 
   * [Bowker1999]  Bowker, G. C., & Star, S. L. (1999). Sorting things out: Classification and its consequences. Boston: MIT press.
   * [Tufekci2015] Zeynep Tufekci, "Algorithms in our Midst: Information, Power and Choice when Software is Everywhere", Proceedings of the 18th ACM Conference on Computer Supported Cooperative Work & Social Computing, pp.1918-1918, ACM 2015.
   * [McGrath1995] E. McGrath,  "Methodology matters: Doing research in the behavioral and social sciences", Readings in Human-Computer Interaction: Toward the Year 2000 (2nd ed.) 1995.
   * [Easterbrook2008], Steve Easterbrook, Janice Singer, Margaret-Anne Storey, and Daniela Damian. "Selecting empirical methods for software engineering research." In Guide to advanced empirical software engineering, pp. 285-311. Springer London, 2008.
   * [Singer2013] Leif Singer, Fernando Figueira Filho, and Margaret-Anne Storey, "Software engineering at the speed of light: how developers stay current using twitter", Proceedings of the 36th International Conference on Software Engineering. ACM, 2014.
 
 
   

