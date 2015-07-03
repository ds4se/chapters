# Open from the beginning



## A tale of two systems

### Alitheia Core

My involvement with empirical software engineering search started in 2005. My
PhD supervisor, wanted to create a plot of the Maintainability Index metric for
the whole lifetime of the FreeBSD project to include in his book.  The initial
version was a hacky Shell and Perl script solution, similar to what most
repository miners come up with. After creating the plot, he though that it would
be interesting if we had a tool to analyze the lifeline of projects based on
repository mining and combine metrics at will. This gave birth to the Alitheia
Core project, where a joint group of about 15 engineers and researchers set
to write a software analysis platform that would allow anyone to submit a
project repository for analysis.

What we came up with was a rather sophisticated repository mining tool that
could accept plug-ins and offered a wealth of services to the repository miner,
like parsers, automatic parallelization and even cluster operation. It also
featured not less than 2 web interfaces and an Eclipse plug-in. When it was
announced, in mid-2008, it was probably the most technologically advanced
repository mining tool. Along with Alitheia Core, we also delivered a curated
dataset of about 750 OSS repositories, including some of the biggest available
at the time. _After the end of the project_, we offered all source code and
datasets to the software analytics community.

In numbers, the project looked like a resounding success; around 20 papers were
published, 4 PhD students have written a dissertation based on it and more
importantly, we could do studies with one or two orders of magnitude more data
from the average study at the time. Unfortunately though, outside of the project
consortium, Alitheia Core had limited impact. From what we know, only ONE
external user cared to install it and only TWO researchers managed to produce a
publication using it. By any account, Alitheia Core was impressive technology
but not a successful project.

### GHTorrent

Fast-forward in mid-2011; GitHub's popularity had begun to skyrocket. They made
available the version 2 of their API and I though that this was my chance to
finally teach myself some Ruby and distributed systems programming. I went ahead
to write scripts that monitored GitHub's event timeline and parsed them into two
databases, MySQL and MongoDB. The whole process of monitoring the event timeline
and parsing was decoupled through a queue server, so we could have multiple
monitors and parsers working on a cluster. The scripts where released as OSS
software on GitHub on Nov 2011, while data dumps of both databases where offered
through BitTorrent. This marked the birth of the GHTorrent project.

A paper describing the approach and initial implementation was sent to the 2012
Mining Software Repositories conference, but failed to impress the reviewers
much: "The work is messy and often confuses the reader in terms of what have
they done and how they have done." one reviewer wrote. "The experiment seems
foley, results somewhat lacking" another reviewer added. The paper included
some slightly embarrassing plots as well, for example a hole in the
data collection process, due to "a bug in the event mirroring script, which manifested in both event retrieval nodes". Nevertheless, the paper
was accepted.

Shortly after the conference, something incredible happened; I witnessed a
client connecting to our Bittorrent server. Not only did it connect, it also
downloaded the full data dump of the MySQL dataset! This marked the first
external user of GHTorrent, merely days after the end of the conference where we
presented it.  The paper that resulted from this download was published in early
2013, before my second GHTorrent paper. This motivated me to take GHTorrent more
seriously; I worked together with initial users to fix any issues they had and I
was prompt in answering their questions. On the technical side, we (students,
the community and me) implemented services to access an almost live version of
both databases, a dataset slicer along and various interactive analyses and
visualizations.

Since its inception, GHTorrent grew a lot: As of this writing (July 2015), it
hosts more than 9.5TB of data. Vasilescu's paper marked the beginning of high
speed (by academic standards) uptake of: more that 50 papers where written using
it, while at least 100 users have registered to the online query facilities.
GitHub themselves proposed GHTorrent as a potential dataset for their annual
data challenge.

## Why the difference?

To me, this is a clear win of the open source process and how open access from the very beginning can only be good. If I learned something from this experience, that would be:

Offer the minimum viable product. The least possible piece of functionality that makes sense and lets people create by building on top of it. This can be data plus some code, or just data with good documentation.

The effort required to learn how the infrastructure works before should not be overlooked. The invested effort must return some gains. Big effort demands big gains in return. There is always the risk of deprecation. IMO, this is why many people in research keep re-inventing the wheel and do not reuse.


Finally and most importantly, no one is going to wait for you to perfect what you ‘re doing. Open access is an absolute must for adoption and widespreading of research and research results. This should happen as early as possible.

## Open up or be irrelevant

There is not much


To cut the long story short: make your research open from the beginning!

## References


