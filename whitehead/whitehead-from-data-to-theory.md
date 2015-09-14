# From Software Data to Software Theory: The Path Less Traveled

_Jim Whitehead, University of California, Santa Cruz_

Software engineering is a pragmatic discipline. A sense of concern in late 1967 about the “many 
current problems in software engineering” led to the formation of the discipline at the 1968 NATO 
Software Engineering Conference (Naur and Randell, 1968). The very term software engineering was 
coined in an aspirational way, in hopes that the engineering approach would produce solutions to 
the software crisis. From this founding moment, the mindset of the software engineering research 
community has been focused on solving problems faced by practicing software engineers, and hence 
much of software engineering work is motivated by pragmatic outcomes. To this day, software 
engineering research results typically require at least a semi-plausible scenario by which they 
can be used by practicing software engineers to assist their development of software. 

The widespread availability of the CVS distributed configuration management tool and the emergence 
of free software forges in the late 1990s created an environment rich in software repository data 
and ripe with promise. The Mining Software Repository workshop (later conference) in 2004 
crystallized an academic community around the research potential inherent in this large and 
growing corpus of software data. Consistent with the pragmatic focus of software engineering, the 
Mining Software Repository community also has a pragmatic bent. While this has generated many 
useful results, it has come at the expense of considering more theoretical outcomes from this data. 

This paper argues in favor of greater theory formation in software engineering in general, and 
mining software repositories in particular. While repository mining has yielded useful tools and 
techniques for practicing developers, it has also highlighted fundamental theoretical questions 
that remain unanswered. Examples abound. Consider the fact that most frequency distributions 
observed in software projects follow a power law or log normal distribution, to the extent that 
it is unusual to find one 
that is not. Why is that? To date, we have only partial explanations (Lin and Whitehead, 2015). Or how about software 
bugs. These are a pervasive part of the experience of developing software, yet efforts to classify 
bugs into common types vary as much as they agree, and there is no agreement on the fundamental 
causes of bugs.

## Pathways of Software Repository Research

In software repository analysis, researchers use or create tools to make a local copy of project 
data, and then compute software metrics or software relationship networks. Examples include 
calculating the size of every file in a project, or finding all of the inheritance relationships 
among classes. This ability to compute a wide range of metrics and relationships forms a 
powerful new scientific instrument, a kind of software mass spectrometer. It provides 
researchers powerful new ways of observing software, giving us the ability to “see” things that 
were previously hidden, or impractical to compute. In a very real sense, this software mass 
spectrometer changes our understanding of the world by making the previously invisible, visible, 
allowing us to think about it and ponder what it means.  

The typical pathway for software repository research starts with an _observational_ research phase. 
Just as a traditional mass spectrometer provides a frequency 
distribution of the atoms or molecules available in a physical sample, typical outputs of our 
software mass spectrometer are frequency distributions computed over observed software metrics 
and relationships. These distributions are the frontline outputs of software repository 
analysis, the primary observations that researchers use as initial building blocks in their 
work. For example, directly measuring the size of files over all files in a project yields a 
(power law) frequency distribution of file size.

The most common next phase is application of the observational knowledge towards the betterment 
of software engineers. This usually takes the form of information or visualizations that can 
support managerial decision making, or some tool that provides benefits for line software 
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

Recent work by Abram Hindle and others illustrates this (Hindle et al., 2012). A key concept in information theory is the 
notion of entropy. In natural language, entropy can be viewed as a measure of how surprising a 
word is, in context with preceding words. If you see the word “phone”, it is not surprising if 
the following word is “call” or “book”, but very surprising if is “slug”. Hindle et al. had 
the realization that since software is programmed using languages, it must be possible to 
measure the entropy of software. They mined a large corpus of Java language software, and then 
measured its average entropy for sequences of two, three, four, etc. language tokens in a row 
(called n-grams). These software entropy valued were then compared against entropy computed in 
an English language corpus, revealing that software is much more predictable (less surprising) 
than English (~2.5-3.5 bits for software n-grams of 3 tokens and greater, as compared with ~7.5 
bits for English for n-grams of the same length). This deeply theoretical result provides a 
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

## Software Bug Taxonomies: Repository Data Reveal Theoretical Problems

Many of the key abstractions in software engineering were developed early on in the field, the 
result of early developers trying to create or appropriate words to describe their experiences. 
Software bugs are one example. Commonly attributed to Grace Hopper and an infamous moth 
discovered in a relay of the Mark II computer at Harvard University in 1947, the term bug 
actually traces back to at least 1875, where it was used to describe flaws in telegraph 
equipment. Hopper’s moth shows appropriation of the term "bug" in computing, and as software 
slowly distinguished itself from hardware, bug applied equally to software and hardware errors. 
By 1968, software bugs and debugging are such pervasive elements of the programming experience 
they are not worth defining in the 1968 NATO conference report. The term computer bug is a useful one 
because, “having a short general term that covers a wide variety of flaws has been useful, 
particularly because the exact source of the error was often unknown. Calling such problems bugs 
rather than failures suggests that they are small faults that can be corrected—not a general 
failure in thinking or design.” (Kidwell, 1998).

Since “computer bug” derives its utility from being an umbrella term that captures a wide range 
of undesired and incorrect behavior in software, a natural impulse is to try and characterize 
this range of experience. That is, one way of answering the question, “what are software bugs,” 
is to enumerate all of the different kinds of bugs that might occur. Researchers and 
practitioners have been creating such “bug taxonomies” for many years. Early examples include an 
extensive taxonomy by Beizer (Beizer, 1983), and the IEEE 
standard classification for software anomalies (IEEE Std 1044-1993). A companion to the IEEE standard notes, 
“the big advantage {of the standard} is the effort saved by not re-inventing and debating yet 
another bug taxonomy.” This suggests that by 1993 the development of bug taxonomies was 
practiced by enough organizations that a standardization problem was perceived, and a standard 
would yield benefits for multiple actors. The quote also points out the most dominant and 
curious characteristic of bug taxonomies: they are all different. 

By different, we don’t mean a little bit different, minor quibbles about esoteric details. No, 
differences include entire whole top-level categories that exist in one taxonomy, and are 
entirely missing from another. Two recent papers from within the software repository mining 
community, (Herzig et al., 2013) and (Tan et al., 2014) illustrate this trend, though we emphasize that any 
two chosen bug taxonomies would show some disagreement. Both of these papers have similar goals, 
that of automatically classifying bug reports in software systems to identify the type of bug. 

In the case of Herzig et al., two researchers spent approximately 90 days manually reading and 
classifying 7,401 bug reports mined from five open source projects. All types of bug reports 
were classified, and hence the goal of the work is to be exhaustive. Classification was 
performed according to their bug taxonomy, which was revised as needed to sharpen the 
distinctions among categories. Top level categories in this taxonomy are BUG (corrective 
maintenance), RFE (adaptive maintenance, implementing new functionality), IMPR (perfective 
maintenance, improving overall performance or handling of existing functionality), DOC (updates 
to documentation), REFAC (issues resolved by code refactoring), and OTHER (issues that didn’t 
fit into the other categories). The BUG category was selected if a bug report describes a null 
pointer exception, an issue requiring a semantic change to the code to fix, or fixes runtime or 
memory issues caused by defects.

In the case of Tan et al., the focus was on software bugs that show up at runtime, and 
explicitly excludes “new feature requests, compile-time errors, configuration errors, 
environmental errors, and software maintenance requests.” Like Herzig’s work, Tan et al. 
performed a manual classification of 583 runtime bug reports according to their classification 
scheme. As compared with the taxonomy of Herzig et al. above, the entire focus of Tan et al. is 
the BUG category, which is termed “Root Cause” and subdivided into categories of memory 
(improper handling of memory objects), concurrency (synchronization problems), and semantic 
(inconsistency between implementation and requirements and/or programmer intention that do not 
fit in either memory or concurrency categories). While memory issues and semantics issues are 
clearly part of the classification rules outlined by Herzig, the notion of concurrency errors is 
not explicitly discussed. Tan et al. go one step further, and provide multiple sub-categories 
within the memory and semantic bug categories. For example, memory is subdivided into memory 
leak, uninitialized memory read, dangling pointer, null pointer, buffer overflow, double free, 
and other. It doesn’t appear that Herzig et al. subdivided memory errors to such a fine degree.

Comparing the two efforts, at the top level we see similarity. Both classification schemes have 
broad agreement on the BUG category, as distinct from new feature requests, documentation 
changes, etc. However, going one level further down, Tan et al. finds it valuable to model bug 
causes with finer granularity than Herzig et al., due to the goal of finding trends among the 
causes of these kinds of bugs. In contrast, Herzig et al. was more interested in the frequency 
distribution among the top level categories so as to explore the degree to which bug reports 
were misclassified by the original reporter, and hence greater detail wasn’t necessary for this 
analysis. This highlights one source of difference among bug taxonomies: the goal of the bug 
analysis affects the analytical model used to explore bugs. 

However, bringing in additional bug classification schemes shows that something deeper is at 
play than just differences in level of detail. The lowest level categories of the IEEE standard 
(called “Investigation classification scheme – Type”) are at the same level of detail as Tan et 
al., yet are very different. The memory error types of Tan et al. are almost entirely missing 
from the IEEE standard (the exception being buffer overflow, called “data referenced out of 
bounds”). The semantics issues of Tan et al. are of the same kind as the majority of the 
code-related error types in the IEEE standard (bug types IV310-IV356), but there are clearly 
many more semantic categories in the IEEE standard than in the Tan et al. taxonomy. In some 
cases these categories are similar (“missing case” and “forgotten cases or steps”), while others 
appear to be at different levels of abstraction (“wrong control flow” could encompass “iterating 
loop incorrectly”, “missing condition test”, and “checking wrong variable”). Some causes in the 
IEEE standard are entirely missing from Tan et al., such as “sensor data incorrect or missing.”

In a similar vein, a recent paper by Falessi et al. reports on a bug taxonomy used by a company 
called Keymind (Falessi et al., 2014). This taxonomy has nine categories: Accessibility, Incorrect Formatting, Missing 
Incorrect or Incomplete Functionality/Results, Non-Compliance of Program Behavior to Standard, 
Low Performance, Security/Vulnerability, Unexpected Termination, Usability, Other. As compared 
to the Herzig et al. taxonomy, there are several top level categories in use at Keymind that 
don’t appear at all, such as Accessibility and Usability. The runtime bugs in Tan et al. and in 
Herzig et al.’s BUG category could potentially be found in four of the Keymind categories 
(Missing Incorrect..., Non-Compliance..., Security/Vulnerability, Unexpected Termination).  

What all of these examples show are clear examples of different bug classification schemes, a 
condition variously termed schema mismatch, or ontology mismatch (Visser et al., 1997). The 
implication of this is profound. Each of these projects has different models and assumptions 
about what software is, how to model its behavior, and which behaviors are worthy of interest. 
That is, there is instability in the definitions of most fundamental abstractions at play here, 
that of software, and of software bugs. We use the term instability in the sense of lack of 
convergence, to capture how each researcher is seeing software in different ways, and is 
bringing different analytical lenses to bear when thinking about software behavior and software 
bugs.

One top level difference in how the different bug taxonomies view software lies in whether 
software is a self-contained system inside a computer, or whether it is participating in a 
larger Internet-connected ecosystem of programs, and used by a range of people. The existence of 
categories of security, usability, and accessibility bugs in the Keymind taxonomy indicate a 
view of software that is executing software surrounded by a broad environment of users and 
security threats. The lack of these categories in Herzig and Tan’s work suggests a 
view of software more as a self-contained system, with an emphasis on the code itself.

On the one hand, this instability in the core concepts of software bugs has not prevented 
significant pragmatic progress in bugs. Static analysis tools can identify specific classes of 
bug types that depend only on programming language semantics to detect, and hence work perfectly 
well by viewing software as a self-contained system of code. Software bug prediction techniques 
duck the issue of what is and isn’t a bug, and just predict those things developers call bugs on 
a given project, even if developers on another project might disagree on certain bug 
classifications. They are ontologically neutral in this sense.

Yet, to make progress on more fundamental questions such as the underlying causes of bugs, 
clearly some theoretical work is needed. If there is no agreement on the various types of bugs, 
it is challenging to develop explanations for why these bugs occur, since the explanations might 
vary across different bug categories. Better understandings of the many ways of viewing software 
would help inform work in software bugs, and software engineering in general. Even for more 
pragmatically oriented work, one would imagine that richer, better developed understandings of 
software, and software bugs, would lead to better approaches for bug finding and removal. 

We hope this inspires practitioners of software analytics work to not just stop after achieving 
a pragmatic result, but also to work to understand this work in a broader context, and ask the 
deeper questions that yield deeper theoretical understandings.

## References

Beizer, Boris, _Software Testing Techiques_, Van Nostrand Reinhold, New York, 1983.

Falessi, Davide, Kidwell, Bill, Hayes, Jane H. and Shull, Forrest, "On Failure Classification: 
The Impact of 'Getting It Wrong'." In _Proc. New Ideas and Emerging Results (NIER)Track, 2014
International Conference on Software Engineering (ICSE 2014)_, Hyderabad, India, May 31-June 7, 2014.

Herzig, Kim, Just, Sascha, and Zeller, Andreas, "It's Not a Bug, It's A Feature: How
Misclassification Impacts Bug Prediction." In _Proc. 2013 International Conference on
Software Engineering (ICSE 2013)_, San Francisco, California, USA, May 18-26, 2013.

Hindle, Abram, Barr, Earl T., Su, Zhendong, Gabel, Mark, and Devanbu, Premkumar, "On the Naturalness of Software."
In _Proc. 2012 International Conference on Software Engineering (ICSE 2012)_, Zurich, Switzerland, June 2-9, 2012.

IEEE Classification Standards Working Group, _IEEE Standard Classification for Software 
Anomalies (IEEE Std 1044-1993)_, Approved Dec. 2, 1993.

Kidwell, Peggy A., "Stalking the Elusive Computer Bug." _IEEE Annals of the History of Computing_,
Vol. 20, No. 4, 1998, pp. 5-9.

Lin, Zhongpeng and Whitehead, Jim, "Why Power Laws? An Explanation from Fine-Grained Changes." In _Proc. 
12th Working Conference on Mining Software Repositories (MSR 2015)_, Florence, Italy, May 16-17, 2015.

Naur, Peter and Randell, Brian, Eds., _Software Engineering: Report on a conference sponsored by
the NATO Science Committee_, Garmisch, Germany, October, 1968 (published January, 1969). Version
accessed at http://www.scrummanager.net/files/nato1968e.pdf

Tan, Lin, Liu, Chen, Li, Zhenmin, Wang, Xuanhui, Zhou, Yuanyuan, and Zhai, Chengxiang, 
"Bug Characteristics in Open Source Software." _Empirical Software Engineering_, Vol. 19, No. 6,
Dec. 2014, pp. 1665-1705.

Visser, Pepijn R. S., Jones, Dean M., Bench-Capon, T.J.M, Shave, M.J.R., "An Analysis
of Ontology Mismatches; Heterogeneity versus Interoperability." In _Proc. AAAI Spring
Symposium on Ontology Engineering, 1997_, _AAAI Technical Report SS-97-06_, 1997.