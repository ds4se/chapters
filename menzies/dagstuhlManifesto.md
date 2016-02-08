# Perspectives on Data Science for Software Engineering


- <em>Tim Menzies,   
Laurie Williams,  
Thomas Zimmermann</em>


## Why This Book?

<img src="dagstuhl.JPG" width=400 align=right>
Historically, this book began as a week-long workshop in Dagstuhl, Germany [1].
The goal of that meeting was to
document the wide range of work on software analytics.

That meeting had 
the following premise:

+ _So little time, so much data._

That is, given recent increases in how much data we can collect,
and given a shortage in skilled analysts that can assess that data [2],
there now exists more data than people to study it.
Consequently, the analysis of real world data (using semi-automatic or fully automatic methods) is an exploding field, to
say this least.

This issue is made more pressing by two factors:

- _Many useful methods:_ Decades of research in artificial intelligence, social science methods, visualizations, statistics, etc.
has generated a large number of powerful  methods for learning from data.
- _Much support for those methods:_ Many of those
methods are explored in standard textbooks and
education programs.  Those methods are also
supported in toolkits that are widely available
(sometimes, even via free downloads). Further, given
the "big data" revolution, it is now possible and
to acquire the hardware necessary, even
for the longest runs of these tools. So now the issue becomes not "how to _get_ these tools" but, instead, how to "use'' these tools".

If general analytics is an active field, software analytics is doublely so.
Consider what we know about software projects:

- source code;
- emails about that code;
- check-ins;
- work items; 
- bug reports;
- test suites;
-  test executions;
-  and even some background information
of the developers. 

All that information is recorded in software repositories, such as CVS, Subversion, GIT, GITHUB, and Bugzilla. Found in these repositories are telemetry data, run-time traces, and log files reflecting how customers experience software, application and feature usage, records of performance and reliability, and more.

Never before have we had so much information about the details on how people collaborating to 

- use someone else's insights and software tools;
- generate and distribute new insights and software tools;
- maintain and update existing insights and software tools.

Here, by "tools" we mean everything from the four lines of SQL that are triggered when someone surfs
to a web page, to scripts that might be only dozens to hundreds of lines of code, or to much larger open
source and proprietary systems. Also, our use of "tools" includes building new tools as well as on-going
maintenance work, as well as combinations of hardware and software system. 

Accordingly, for your consideration, this book
explores that process for software development applications.
Our goal is to
offer better insights into that process. The chapters here
were written by participants at the Dagstuhl
workshop, plus numerous other experts in the field
on industrial and academic data mining.


## About this Book


Each chapter is aimed at a generalized audience with some technical interest in software
engineering. Hence, the chapters are very short and  to the point. Also,the chapter authors have taken care
to avoid excessive and confusing techno-speak.

As to insights themselves, they are in two categories:

- _Lessons specific to software engineering:_ Some chapters offer valuable comments on issues that are
  specific to data science for software engineering.  For example, see Geunther Ruhe's excellent
  chapter on decision support for software engineering.
- _General lessons about data analytics:_ Others chapters are more general. These
  comment on issues relating to drawing conclusions from real-world data. The case study material for these chapters come from the domain of software engineering problems.
  That said, this material has much to offer data scientists working in many other domains.
  
Our insights take many forms:

+ Some introductory material to set the scene;
+ Success stories and application case studies;
+ Techniques;
+ Words of Wisdom;
+ Tips for success, traps for the unwary, as well as the steps required to avoid those traps.

That said,  all our insights have one thing in common: _**we wished we known them years ago**_!
If we had, then that
would have
saved us and our clients so much time and money.


## The Future

While these chapters were written by experts, they
are hardly complete. Data science methods for SE are
continually changing so we view this book as a
"first edition" that will need significant and
regular updates. To that end, we have created a news
group for posting new insights. Feel free to make
any comment at all there.

+ To browse the messages in that group, go to https://groups.google.com/forum/#!forum/perspectivesds4se
+ To post to that group, send email to perspectivesds4se@googlegroups.com
+ To unsubscribe from that group, send email to perspectivesds4se+unsubscribe@googlegroups.com


Note that  if you want to be
considered for any future update of this book:

- Make the subject line some eye-catching "mantra";  i.e. some slogan reflecting best practice for data science for SE.
- The post should read something like the chapters of this book. That is, it should be:
  - Short, and to the point.
  - Make little or no use of jargon, formula, diagrams, references.
  - Be approachable by a broad audience and have a clear take away message.

Share and enjoy!



## References

[1] Software Development Analytics (Dagstuhl Seminar 14261), Gall, Harald ; Menzies, Tim ; Williams, Laurie ; Zimmermann, Thomas 
Dagstuhl Reports Journal, 4(6) 64--83, 2014, http://drops.dagstuhl.de/opus/volltexte/2014/4763/

[2] Big data: The next frontier for competition. McKinsey & Company. http://www.mckinsey.com/features/big_data
