# From Software Data to Software Theory: The Path Less Traveled

_Jim Whitehead, University of California, Santa Cruz_

Software engineering is a pragmatic discipline. From the very beginning, the mindset of the software engineering research 
community has been focused on solving problems faced by practicing software engineers (Naur and Randell, 1968), and hence 
much of software engineering work is motivated by pragmatic outcomes. To this day, software 
engineering research results typically require at least a semi-plausible scenario by which they 
can be used by practicing software engineers to assist their development of software. 
Consistent with the broader software engineering community, Software Analytics also has a pragmatic bent. 
While this has generated many useful results, it has come at the expense of considering more theoretical outcomes from this data. 

This paper argues in favor of greater theory formation in software engineering in general, and 
software analytics in particular. While repository mining has yielded useful tools and 
techniques for practicing developers, it has also highlighted fundamental theoretical questions 
that remain unanswered. Examples abound. Consider the fact that most frequency distributions 
observed in software projects follow a power law or log normal distribution, to the extent that 
it is unusual to find one 
that is not. Why is that? To date, we have only partial explanations (Lin and Whitehead, 2015). 

## Pathways of Software Repository Research

In software repository analysis, researchers use or create tools to make a local copy of project 
data, and then compute software metrics or software relationship networks. Examples include 
calculating the size of every file in a project, or finding all of the inheritance relationships 
among classes. This ability to compute a wide range of metrics and relationships forms a 
powerful new scientific instrument, a kind of software mass spectrometer. It provides 
researchers powerful new ways of observing software, letting us “see” things that 
were previously hidden, or impractical to compute. In a very real sense, this software mass 
spectrometer changes our understanding of the world by making the previously invisible, visible, 
allowing us to ponder what it means.  

The typical pathway for software repository research starts with an _observational_ research phase. 
Just as a traditional mass spectrometer provides a frequency 
distribution of the atoms or molecules available in a physical sample, typical outputs of our 
software mass spectrometer are frequency distributions computed over observed software metrics 
and relationships. These distributions are the frontline outputs of software repository 
analysis, the primary observations that researchers use as initial building blocks in their 
work. For example, directly measuring file size across all files in a project yields a 
(power law) frequency distribution of file size.

The most common next phase is application of the observational knowledge towards the betterment 
of software engineers. This usually takes the form of information or visualizations that can 
support managerial decision making, or some tool that provides benefits for software 
engineers. We term these _pragmatic_ outcomes, since the explicit goal is improving the direct 
practice of software engineering activities. A software team presented with a list of the 20 
largest code files, ordered by change frequency, could use this list to refactor and break apart 
these large files, thereby creating smaller, easier to maintain files that are changed less often.

A less common path forward from the observational step is _theory formation_. Here the goal is to 
use the frequency distributions and relationship networks to support fundamental understandings 
of what software is, and to understand the phenomena which occur during the development of 
software over time, and their underlying causes. This work seeks scientific outcomes, pure 
advances in our understanding of software and its development, and is not concerned with whether 
these understandings have any immediate pragmatic application.

## From Observation to Theory to Practice

Two examples highlight the benefits of forming theories about software repository data: software 
power laws and software entropy.

The software analytics community has observed power law distributions for many different measures of
software systems, such as file size (Herraiz et al., 2011), change sizes (Gorshenev and Pis’mak, 2004), 
and number of subclasses (Turnu et al., 2011). Recent work by Zhongpeng Lin provides one
explanation for why power laws are so prevelant (Lin and Whitehead, 2015) via the simulated evolution
of a large software system. Two generative mechanisms are used. _Preferential attachment_ results in simulated
software changes being made to larger files more commonly than smaller ones --- the software version
of the rich getting richer. A _self-organized criticality_ process determines the size of software commits.
Outside of software, self-organized criticality can be seen in growing sand piles, which have avalanches
of varying sizes as sand trickles down. This generative simulation is able to render power
law distributions out of fine-grained code changes, suggesting preferential attachment and self-organized 
criticality are the underlying mechanisms causing the power law distributions in software systems.

This theoretical result highlights the pathway going directly from observation to theory, without an 
intervening practical result. Yet the results have profound practical implications. Preferential
attachment means that a trend towards large software files is inevitable in software systems, unless
large files are continually refactored. Self-organized criticality implies that large, system-wide changes, 
though infrequent, are inevitable. A significant external change (hardware, requirement, market, etc.)
is not required to trigger large software changes.
 

In our second example, Abram Hindle and collaborators use the concept of entropy from information theory 
to explore the surprisingness of sequences of tokens appearing in source code (Hindle et al., 2012). 
In natural language, entropy can be viewed as a measure of how surprising a 
word is, in context with preceding words. If you see the word “phone”, it is not surprising if 
the following word is “call” or “book”, but very surprising if it is “slug”. Hindle et al. had 
the insight that since software is programmed using languages, it must be possible to 
measure the entropy of software. They mined a large corpus of Java language software, and then 
measured its average entropy for sequences of two, three, four, etc. language tokens in a row 
(called n-grams). These software entropy values were then compared against entropy computed in 
an English language corpus, revealing that software is much more predictable (less surprising) 
than English (~2.5-3.5 bits for software n-grams of 3 tokens and greater, as compared with ~7.5 
bits for English for n-grams of the same length). 

This deeply theoretical result provides a 
different way of thinking about software. Compared to the prevailing view of software as a 
complex clockwork, software entropy values reveal software as having a high degree of local 
regularity. If there is a sequence of 3 or more programming language tokens, the following token 
tends to draw from a very small set of possibilities, and is easy to predict. This supports a 
view of software as being deeply idiomatic, and locally predictable. A beautiful theoretical 
result. 

However, the authors didn’t stop there. In a science focused field, reporting a major 
theoretical result would be sufficient. Software engineering, with its pragmatic focus, 
expected more. In the same paper announcing the entropy calculation, they also explored just how 
well this approach could predict the next token, so as to support the construction of an 
improved suggestion engine for integrated development environments. They found that the 
improved token suggestions were substantially better than those found in native Eclipse. The 
paper thus provides a pragmatic, utilitarian application for the research that could plausibly 
aid real world software engineers in their daily work. In case that was not sufficient, the 
paper also contains an extensive future work section that details several additional plausible utilitarian 
applications of the work.

We hope this inspires practitioners of software analytics work to not just stop after achieving 
a pragmatic result, but also to work to understand this work in a broader context, and ask the 
deeper questions that yield deeper theoretical understandings. Indeed, consideration of theory can
prevent critical misunderstandings. A recent parody by Andreas Zeller and collaborators shows the risk.
After analyzing the source code from several releases of Eclipse, they find that the characters 
I, R, O, and P are highly correlated with software defects. Based on this, they create a keyboard with
those characters removed, to eliminate these high-risk letters! While the flaws are obvious in this case,
other problems with correlation and causation are more subtle. The implication? Software theory is important
for everyone, acaedmics and practitioners alike.

## References

Hindle, Abram, Barr, Earl T., Su, Zhendong, Gabel, Mark, and Devanbu, Premkumar, "On the Naturalness of Software."
In _Proc. 2012 International Conference on Software Engineering (ICSE 2012)_, Zurich, Switzerland, June 2-9, 2012.

A. Gorshenev and Y. Pis’mak, "Punctuated equilibrium in software
evolution," _Physical Review E_, vol. 70, no. 6, Dec. 2004.

I. Herraiz, D. German, and A. Hassan, "On the distribution of source
code file sizes," in _International Conference on Software and Data
Technologies_. Seville, Spain: SciTe Press, 2011.

Lin, Zhongpeng and Whitehead, Jim, "Why Power Laws? An Explanation from Fine-Grained Changes." In _Proc. 
12th Working Conference on Mining Software Repositories (MSR 2015)_, Florence, Italy, May 16-17, 2015.

Naur, Peter and Randell, Brian, Eds., _Software Engineering: Report on a conference sponsored by
the NATO Science Committee_, Garmisch, Germany, October, 1968 (published January, 1969). Version
accessed at http://www.scrummanager.net/files/nato1968e.pdf

I. Turnu, G. Concas, M. Marchesi, S. Pinna, and R. Tonelli, "A modified
Yule process to model the evolution of some object-oriented system
properties," _Information Sciences_, vol. 181, no. 4, pp. 883–902, Feb.
2011.

A. Zeller, T. Zimmermann, and C. Bird. "Failure is a four-letter word: a parody in empirical research." In 
_Proceedings of the 7th International Conference on Predictive Models in Software Engineering (Promise '11)_, 2011.
