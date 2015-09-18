# Open from the beginning
_by Georgios Gousios, Radboud University Nijmegen, the Netherlands_

In research, we are obsessed with open access. We take extra steps to make our
papers available to the public, we spend extra time for producing pre-prints,
technical reports and blog posts to make our research accessible and we lobby
non-collaborating publishers to play along. We do not show the same jealousy
with the artifacts that comprise our research; source code, data and
documentation are treated as second class citizens that nobody i) publishes ii)
wants to have a look at.

I believe this is a grave mistake and leads to missed opportunities of making
our research even more widespread.

But why is open access to all research artifacts important for software data
scientists? Let me tell you two stories.

### Alitheia Core

My involvement with empirical software engineering started in 2005. My
PhD supervisor, wanted to create a plot of the Maintainability Index metric for
the whole lifetime of the FreeBSD project to include in his book.  The initial
version was a hacky Shell and Perl script solution, similar to what most
repository miners come up with. After creating the plot, he though that it would
be interesting if we had a tool to analyze the lifetime of projects based on
repository mining and combine metrics at will. This gave birth to the Alitheia
Core project, where a joint group of about 15 engineers and researchers set
to write a software analysis platform that would allow anyone to submit a
project repository for analysis.

What we came up with was a rather sophisticated repository mining tool that
comprised of analysis plug-ins and offered a wealth of services, such as
parsers, automatic parallelization and even cluster operation. It also
featured no less than 2 web interfaces and an Eclipse plug-in. When it was
announced, in mid-2008, it was probably the most technologically advanced
repository mining tool. Along with Alitheia Core, we also delivered a curated
dataset of about 750 OSS repositories, including some of the biggest available
at the time. _After the end of the project_, we offered all source code and
datasets to the software analytics community.

In numbers, the project looked like a resounding success; around 20 papers were
published, 4 PhD students have written a dissertation based on it and more
importantly, we could do studies with one or two orders of magnitude more data
from the average study at the time. Unfortunately though, outside of the project
consortium, Alitheia Core had limited impact. From what we know, only one
external user cared to install it and only two researchers managed to produce a
publication using it. By any account, Alitheia Core was impressive technology
but not a successful project.

### GHTorrent

Fast-forward in mid-2011; GitHub's popularity had begun to skyrocket. They just
made available version 2 of their API and I though that this was my chance to
finally teach myself some Ruby and distributed systems programming. I went ahead
to write scripts that monitored GitHub's event timeline and parsed them into two
databases, MySQL and MongoDB. The whole process of monitoring the event timeline
and parsing was decoupled through a queue server, and thus we could have multiple
monitors and parsers working on a cluster. The scripts where released as OSS
software on GitHub on Nov 2011, while data dumps of both databases where offered
through BitTorrent. This marked the birth of the GHTorrent project.

A paper describing the approach and initial implementation was sent to the 2012
Mining Software Repositories conference, but failed to impress the reviewers
much: "The work is messy and often confuses the reader in terms of what have
they done and how they have done." one reviewer wrote. "The experiment seems
foley, results somewhat lacking" another reviewer added. The paper included some
slightly embarrassing plots as well, e.g. featuring holes in the data collection
process, due to "a bug in the event mirroring script, which manifested in both
event retrieval nodes". Nevertheless, the paper was accepted.

Shortly after the conference, something incredible happened; I witnessed a
client connecting to our Bittorrent server. Not only did it connect, it also
downloaded the full data dump of the MySQL dataset! This marked the first
external user of GHTorrent, merely days after the end of the conference where we
presented it. The paper that resulted from this download was published in early
2013, before even my second GHTorrent paper. This motivated me to take GHTorrent more
seriously; I worked together with initial users to fix any issues they had and I
was prompt in answering their questions. On the technical side, we (students,
the community and me) implemented services to access an almost live version of
both databases, a dataset slicer and various interactive analyses and
visualizations.

Since its public availability, GHTorrent grew a lot: As of this writing (July
2015), it hosts more than 9.5TB of data. Vasilescu's paper marked the beginning
of high speed (by academic standards) uptake of GHTorrent: more that 50 papers
where written using it, while at least 100 users have registered to the online
query facilities. GitHub themselves proposed GHTorrent as a potential dataset
for their annual data challenge.

## Why the difference?

The relative indifference that the research community reserved for Alitheia Core
is in stark contrast with the fast uptake of GHTorrent. But why? Why did the
community embrace a hacky, obviously incomplete and, in some cases, downright
erroneous dataset while it almost ignored a polished, complete, and fully
documented research platform? Let us consider some potential reasons:

* _GitHub is hot as a research target_: This is obviously true. But when
Alitheia Core was done, SourceForge was also very hot as a research dataset,
as evidenced by the number of projects that targeted it. Moreover, the
unaffiliated Github Archive project offers a more easily accessible version
of a subset of GHTorrent, so researchers could have just used this and
ignored GHTorrent altogether.

* _The not invented here syndrome_: Researchers (and, to a lesser extend,
practitioners) are very reluctant to use each other's code. This is not
entirely unfounded: code, especially research code, is very prone to have issues
that may be hard to debug. Researchers also know that dealing with
inconsistencies in data is even worse; still, they flocked on GHTorrent.

* _Ad hoc solutions work best_: Data analytics is a trial and error approach;
researchers need to iterate fast and an interactive environment coupled with a
database makes them more productive than a rigid, all encompassing platform.


Despite the fact that there is some truth in the above, I believe that the main
reason is **openess**.

Alitheia Core was developed using an opaque process that the project members
certainly enjoyed, but was obviously not in touch with what the users wanted. On
the other hand, GHTorrent grew _with_ its users. As any entrepreneur or
innovation expert can confess, it is very hard for an innovative product or
service to be adopted by a community; adoption is much easier if it grows
organically with it. Moreover, it is extremely difficult to dazzle users with
feature lists (except perhaps if you are Apple): users, especially tech savvy
ones, put high value on construction transparency and compatibility to their
work habits.

## Be open or be irrelevant

To me, the difference is a clear win of the open source process and its
application on research. Open access to all research artifacts from the very
beginning can only be a good thing: collaboration attraction, spreading of
research results, replication and advancement of science in general are all
things for which open access is a prerequisite. There is not much at risk,
either: the only thing we risk with open access is that our research will be
ignored; then, this already says something about the relevance of our research.

If I learned something from this experience, that would be the following 3 things:

* **Offer a minimum viable product:** Offer the least possible piece of
functionality that makes sense and let people create by building on top of it.
This can be data plus some code, or just data. Make sure that you make it easy
for others to build on what you offer: make sure that your tools easy to install
and that your data is well documented. Be frank in the documentation; accurately
state the limitations and the gotchas of your code/data.

* **Infrastructures are overrated:** The effort required to learn how
infrastructure code works should not be overlooked. The invested effort must
return some gains. Big effort must be followed by big gains in return and there
is always the risk of deprecation; this is why only very few infrastructure
tools survive the test of openness. The Unix experience should be our guide;
make tools and services that do one thing well, accepted text and return text.

* **Open now trumps open when it is done:** Finally and most importantly, no one
is going to wait for you to perfect what you are doing. Opening your research up
early on is not a sign of sloppiness; it is a sign of trusting in your work and
acknowledging the fact that done is better than perfect. Don't be afraid that
someone will steal your idea, for if someone invests time in stealing it, it
is a great idea and you have a head start. Open access is an absolute must
for the adoption and wide spreading of research results. This should happen as
early as possible.

To cut the long story short: make your research open from the beginning!

## References
* G.Gousios and D. Spinellis, [Conducting quantitative software engineering studies with Alitheia Core.](http://www.gousios.gr/bibliography/GS14.html), Empirical Software Engineering, vol. 19, no. 4, pp. 885–925, 2014.


* G.Gousios, [The GHTorrent dataset and tool suite](http://ghtorrent.org), in Proceedings of the 10th Working Conference on Mining Software Repositories, 2013, pp. 233–236.

* B.Vasilescu, V. Filkov, and A. Serebrenik, [Stack Overflow and GitHub: Associations between software development and crowdsourced knowledge](http://bvasiles.github.io/papers/socialcom13.pdf).
2013 ASE/IEEE International Conference on Social Computing, Social Computing, IEEE (2013), 188–195.
