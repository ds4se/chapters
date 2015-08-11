# Perspectives on Data Science for Software Engineering

- <em>Tim Menzies, Laurie Williams, Thomas Zimmermann</em>

"In our house, there are many rooms." --John 14:2-3

This book is about _data science for software engineering_. Specifically, 
it offers  a  long list of:

+ hints
+ tips
+ traps for the unawary,
+ and the steps required to avoid those traps.

Each chapter is aimed at a generalized audience with some technical interest in software
engineering. Hence, our chapters are very short and  to the point. Also, we have taken care
to strip our chapters of excessive and
confusing techno-speak.

The field of data science for software engineering is very active and constantly evolving.
Accordingly, our chapters list multiple insights from multiple perspectives.
This
is quite deliberate- data science   is very varied field, so it very rare that "one size fits all".
Rather,  successful data scientists know and apply  a large and diverse toolkit.

<img src="dagstuhl.JPG" width=400 align=right>
Historically, this book began as a week-long workshop in Dagstuhl, Germany [1].
That workshop documented the range of work on software analytics. 
For example, check-ins,
work items, bug reports and test executions are recorded in software repositories such as
CVS, Subversion, GIT, and Bugzilla. Telemetry data, run-time traces, and log files reflect
how customers experience software, which includes application and feature usage and expodeoses
performance and reliability. The sheer amount is truly impressive:

- At the time of that Workshop,  Mozilla Firefox had 900,000 bug reports, and platforms such as Sourceforge.net
and GitHub hosted millions of projects with millions of users.
- Industrial projects had many sources of data at similar scale.

Since then, this data has grown even larger and now it is routine for data scientists in industry
and academia to routinely access terabytes to gigabytes of data,
But how can this data be used to improve software? Software analytics takes this data
and turns it into actionable insight to inform better decisions related to software. Analytics
is commonly used in many businesses—notably in marketing, to better reach and understand
customers. The application of analytics to software data is becoming more popular.

To a large extent, software analytics is about what we can learn and share about software.
The data include our own projects but also the software projects by others. Looking back
at decades of research in empirical software engineering and mining software repositories,
software analytics lets us share all of the following:

- _Sharing insights_. Specific lessons learned or empirical findings. An example is that in
Windows Vista it was possible to build high-quality software using distributed teams if the
management is structured around code functionality (Christian Bird and his colleagues).
- _Sharing models_. One of the early models was proposed by Fumio Akiyama and says that
we should expect over a dozen bugs per 1,000 lines of code. In addition to defect models,
plenty of other models (for example effort estimation, retention and engagement) can be
built for software.
- _Sharing methods_. Empirical findings such as insights and models are often contextspecific,
e. g., depend on the project that was studied. However, the method (“recipe”)
to create findings can often be applied across projects. We refer to “methods” as the
techniques by which we can transform data into insight and models.
_Sharing data_ By sharing data, we can use and evolve methods to create better insight
and models.



## References

[1] Software Development Analytics (Dagstuhl Seminar 14261), Gall, Harald ; Menzies, Tim ; Williams, Laurie ; Zimmermann, Thomas 
Dagstuhl Reports Journal, 4(6) 64--83, 2014, http://drops.dagstuhl.de/opus/volltexte/2014/4763/


===

Notes from a recent Dagstuhl seminar on Software Analytics
tim.menzes@gmail.com
WVU (ish)
NcState
July 20, 2014
http://goo.gl/9MRM78

Dagstuhl: castle in Sth. Germany
Live in workshops. 
No distracting nearby shops, towns.
Seminars: 
invited participants, senior organizers
Locks on exterior doors
none (optional) inside
Booze, coffee, ice creams 24/7
Let’s talk (5 day meetings)


Organizers:    
Tom Zimmermann, Microsoft
Laurie Williams, NCstate
Tim Menzies, WVU
Harald Gall, Zurich 
Software Development Analytics
June 22nd – June 27th, 2014 
Premise:
Not  just data mining; not just quantitative model construction.
Not just “big data” (whatever that is).
But “sharing”:
sharing data
sharing models
sharing methods (qual & quant)
sharing insights (⇐ the real goal?)

Outcomes	
Many plans:
A community portalhttp://goo.gl/3t4Vp1
Community documents,
Open letter to reviewers to  mature their view on how to assess this kindor work.
A book (maybe, 2015):
66 things every  data scientist  should know 
This talk:
Some of the “things”
A repeated theme: “the streetlight effect”


A repeatedly visited story.
The Streetlight effect

Street light effect
“I’m looking for my keys.”
 

Street light effect
Moral #1: 
look at the real data, not just the conveniently available data
“Before we collect the data, need to redefine the right data to collect.”
“Garbage in, garbage out”
“Before analyzing terabytes of data, reflect some on user goals.”  
“I’m looking for my keys.”
 

Can we reason about data, without detailed background knowledge?
Traditional view:
GQM
Traditional science:
Define data to collected
Collect
Infer
“Newer” view:
Operational science (Mockus, keynote, MSR, 2014)
Find data
Reason about it
Prone to “streetlight effect”

 

Empiricists : Rationalists
Observation : use of background knowledge
Mockus : Basili
Norvig : Chomsky
Locke : Leibniz
Aristotle : Plato
Newton : Descartes
Newton said (and this has been translated two ways):
“I make no hypotheses.”
“I feign no hypotheses.”
Now “feign” is an interesting word. 
Suggests pretence or even deceit or subterfuge.

 

Working in the light
Moral #2: 
“before we rush to the new, lets reflect on what we can learn from what we can see right now. “
“Too fast, too early  to expect actionable data for some specific area. “
“Building  models on what we have before pushing ahead.”
Yes, I know our users want to know about XYZ, but maybe we should work on ABC first
“Need to invest more in data science infrastructure”


“I’m exploring the data without preconceived biases.”
 
And with experience, we can push out from the light into more of the dark

Full disclosure: Menzies is not rational (he’s an empiricist)
Accidental
discoveries
America
Penicillin
Anesthesia
Big bang radiation
Internal pacemakers
Microwave ovens
X-rays
Plastics (non-conductive heat resistant polymer)
Vulcanised rubber
Viagra 
Wikipedia lists of human cognitive biases
100+ entries
The way we routinely get it wrong, every day.
 

Based on historical evidence:
All (current) conclusions  are wrong
Prone to revisions
By subsequent analysis
Any current models is
Wrong, but useful
Timm’s Law: 
Less conclusions, More conversations
To find better conclusions …
Just keep looking
For a community to find better conclusions
Discuss more, share more

 

A little bit of this, a little bit of that
Moral #3: 
“My Father’s house has many rooms.”
“False dichotomy between these two approaches. Really need to bridge these two modes.“
“Not the scientific method but scientific methods (plural).”



“Aha!  Bus tracks! I can follow these to the bus stop and not drive home drunk.”
 

“N” things every data scientist needs to know
Note: short summaries of very complex positions. Some inaccuracies are possible.

Thing #1: Rumsfeld’s rule
Do analysis with the data you have, not the data you might wish to have 
Never always have the right data
Real-world data expensive to collect
Do what you can with what you have.
Always suspect your data (quality, sanity, variance checks)
Donald Rumsfeld. Did not attend Dagstuhl

Thing #2: Data mining is a shocking experience
e.g. Tom Zimmermann
Few hypotheses survive contact with the data 
e.g. Bertrand Russell:
Everything is vague to a degree you do not realize till you have tried to make it precise. 
e.g. Prem Devanbu:
All that stuff about strongly-typed languages being useful? 
Year… Not so much [see his ICSE’14 paper]

Devanbu et al. ICSE’14
Static code defect predictors (data miners)
vs static analysis tools (FindBugs, etc)

No difference in cost effectiveness of the two approaches
But defect prediction scales better, 
Can be adapted to new languages instantly

Some benefits in ranking results from static analysis tools using defect predictors.
	
Thing #2: Data mining is a shocking experience

Devanbu et al. SIGSOFT FSE’14
Given all the programs we can see at Github
Lets check some of the orthodoxy
It is true that
strong typing > weak typing
static typing > dynamic typing	
functional > procedural  
But: very very modest effects. 
Process factors dominate
e.g. the kind of the programmer attracted to the language
	
Thing #2: Data mining is a shocking experience (more)

Thing #3: Whitehead’s rule:
“Science: it matters”
Pragmatic project results are fine
But… 
We say we are trying to support projects so we don’t do science;
Yet most of our stuff is never used by projects;
So we fail as engineers as well as scientist. 
Moral: 
While servicing our projects, 
Don’t forget to be scientists, looking for generalities, 
Jim Whitehead, UCSC

E.g.. Generality between  Turkish Toasters  AND NASA Space Ships
 
Thing #3: “Science: it matters”
Turhan, Menzies, Bener ESE journal 2009

Raw dimensions less informative than underlying dimensions
 
Thing #3: “Science: it matters”

e.g.: How to TRANSFER  Lessons Learned?
Ignore most of the data
relevancy filtering: Turhan ESEj’09; Peters TSE’13
variance filtering:  Kocaguneli  TSE’12,TSE’13
performance similarities:  He ESEM’13
Contort the data
spectral learning (working in PCA space or some other rotation) Menzies, TSE’13; Nam, ICSE’13
Build a bickering committee
Ensembles Minku, PROMISE’12       
 
Menzies,  et al.
Minku,  et al.
Thing #3: “Science: it matters”

Many, many other things
Thing #4:
Go back and do it again
One study is not enough.
Repeat your experiments
Share your data and scripts
Thing #5:
Don’t overwork the data repo
Sad tales of well defined, but empty, repos.
Contrast with hastily build repos, full of data
Thing #6:
People. They matter
Thing #7: 
Not just predictions:
Takes of users ingoring models but going nuts over some social interaction diagram
Thing #8: 
Not just mere numbers 
Power of visualizations
Many stories
Thing #9: 
Not just qualitative models
Power of qualitative methods
etc etc.

For more things
See forthcoming book

Conclusion
Data science in SE.
Ain’t going away.
A disruptive technology 
That will change much of what we think and do in SE
Not just confirming old insights
But offering new, challenging insights

