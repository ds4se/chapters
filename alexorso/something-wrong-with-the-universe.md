#Software Analytics Under the Lamppost (or What Star Trek Teaches Us About the Importance of Asking the Right Questions)

_Nenad Medvidovic_, University of Southern California
<br>
_Alessandro Orso_, Georgia Institute of Technology

## Prologue

In “Remember Me”, an episode of _Star Trek: The Next Generation_, Dr. Beverly Crusher does not realize that, due to a science experiment gone awry, she has ended up inside a spacetime disturbance.  After a series of unexpected and, to her, unexplainable events, she tries to calm herself and assess her situation so that she can find a way out of it.  Thinking back over what has transpired, Dr. Crusher states: “If there's nothing wrong with me, maybe there's something wrong with the universe!”

This was an easy conclusion to make in that it did not require Dr. Crusher to question her assumptions.  However, it was an extreme conclusion, and in this instance obviously the wrong one.  Yet, as a scientist, frustrated by her inability to understand the observations she has made inside the spacetime disturbance (i.e., the data she collected “with her own eyes and ears”, with her handheld tricorder, and via the countless sensors on the starship Enterprise), she actually considered this possibility.  Fortunately, the episode had to be concluded in 45 minutes and, as always, one of the main characters had to be saved.  Otherwise, Dr. Crusher may still be trying to resolve her predicament based on incomplete data, lack of awareness of the precipitating event, and analysis of the available data from the wrong perspective—she was unaware that she got pulled into the spacetime disturbance and that, in the world of Star Trek at least, the usual laws of physics did not apply there.

How does this relate to software analytics? Very closely, actually!  First, we are practitioners of one of Herb Simon’s "sciences of the artificial", meaning that we cannot rely on laws of physics or their analogs to help us understand the phenomena we are studying. Second, very often, we do not understand the precipitating events for the phenomena in which we are interested, either because that data was never recorded or because nobody actually realized at the time that they had encountered something important.  Third, despite the seemingly huge amounts of data we can now collect about a system (the humans who built it, the bugs that were in it, and so on), by definition that data is incomplete; we are often looking for “second-order events” because the actual phenomena in which we are interested have not been recorded or are altogether unobservable (e.g., we routinely try to assess code quality by measuring the number of bug reports for that code).  Finally, we bring our biases to the processes of data collection and analysis.  In other words, we often (consciously or otherwise) select the perspectives from which we collect and analyze the data, and those perspectives may end up coloring our conclusions.

##Learning from Data 

In the remainder of this chapter, we describe our view, as informed outsiders, of the landscape of the research in and applications of data science for software engineering.  To do so, we introduce seven categories of results that we have observed in this field, which we order by quality (and ultimately usefulness) of the corresponding research, from low to high. In other words, the first category is to avoid at all costs, whereas the last category is the one for which one should strive.

Note that, while the discussion below may be generally applicable to any Big Data endeavor, our particular interest is in the role and potential impact of conclusions drawn specifically within data science for software engineering.  We urge the reader to approach the below discussion in that vein. 

We also want to point out that, although our objective is to provide a general overview that can be used to categorize existing work in this area, we do not engage in such a categorization.  Put another way, we deliberately refrain from focusing on specific projects or publications even though our discussion is informed by our (and, as it turns out, many other colleagues') impressions of the work that has appeared in various software engineering venues over the past decade.

###1. Incorrect Conclusions

Incorrect conclusions can be drawn because of reliance on incomplete, tainted, and/or noisy data, poor statistical analysis, wrong inferences, and overgeneralization.  Some of these pitfalls (e.g., bad statistics) can be remedied through appropriate training.  Others (e.g., bad data) cannot be remedied as readily.  Acting on incorrectly drawn conclusions can clearly have serious consequences.

###2. Partially Correct Conclusions

Conclusions regarding complex phenomena may be correct in certain respects, while being wrong in others. Unfortunately, basing important decisions on them may be as detrimental as acting on completely incorrect conclusions.  Especially in software engineering, the extent of our current understanding of the factors that yield such (partially) incorrect conclusions is limited at best.  This is certainly exacerbated by the temptation, as researchers, to highlight and focus on positive results.

###3. Correct but Useless Results

Certain phenomena, while analyzable, are not worthy of analysis, as they provide answers to questions that are not worth asking in the first place.  Many examples of “low hanging fruit” fall in this category.  Although they are often attractive, because they are easy, they should be avoided just the same.  In other words, if a paper “practically writes itself”, let it and move on to something else.

###4. Correct but Obvious Results

Certain phenomena may be worthy of analysis, but only if it is not already clear ahead of time what results the analysis will yield.  Empirically confirming a hypothesis or a suspicion, even if they appear well founded and likely, is an important part of science.  Answering questions that have already been answered, or that can be answered much more quickly and easily than through a given data analysis procedure, is wasteful. 

###5. Correct, Somehow Interesting, but Not Actionable Results

Analysis of certain phenomena may correctly yield conclusions that are somehow interesting (i.e., they are not completely useless) but are "dead ends". In other words, those conclusions may prove to be neither usable to practicing engineers in solving the problems they face nor a reasonable foundation for further studies. In such cases, the analysis is little more than an intellectual exercise à la “we do it because we can”—the kind of work performed by researchers who live in the proverbial ivory tower.

###6. Correct, Non-Obvious, Modest Steps

Certain conclusions may enrich an engineer's palette of methods, techniques, and tools.  Even a moderate improvement over the current state of the art is valuable, regardless of the complexity of the underlying analysis that yielded that improvement.  The assumption is, of course, that the complex analysis was not undertaken in lieu of a simpler, much more straightforward approach that would have yielded the same answers (see above).

###7. Correct, Non-Obvious Game-Changers

This is the "holy grail" of software analytics research and practice—a result that can change how researchers think about and approach their field, as well as how developers think about and do their work.  This type of result is often obtained through a a combinations of painstaking work, subtle insights, unique perspective, and sometime also luck.  It is not necessarily repeatable,  it cannot be forced, and at least some parts of it cannot be taught. 

##Which Bin Is Mine?

We believe that the principal risk faced by research on data science for software engineering is that its results, when clustered into the above seven areas, will form a bell curve such as the one shown in the below diagram.  Note that, in this hypothetical diagram, only a small fraction of research falls in Categories 6 and 7, which represent the most beneficial work.  By contrast, the work in Categories 3, 4, and 5 is most abundant, but not particularly useful. The latter three categories are what we would refer to as “software analytics under the lamppost”: instead of asking important questions, one asks questions that are easy to answer.

![](BellCurve.jpg)<br>
_Figure1: A (not entirely) hypothetical bell curve for data analytics research._

##Epilogue

There is a range of questions one can ask and a range of conclusions one can draw from the same data. Even when we pursue the right questions, the biggest problem we face as a community is that many of the questions about what, how, when, where, and why software engineers do what they do fall in the category of inadequately understood phenomena.  This means that our suspicions and biases may, and often do, influence what specific questions we ask, how we go about trying to answer them, and the slant we put on the data we collect in the process.  For this reason, as in Dr. Crusher’s case, at least some of our findings are at risk of being not useful or even meaningless. 

To avoid this situation, we believe that researchers in the area of data science for software engineering should carefully assess where their work falls in terms of usefulness and the actionability of their findings. We also believe that doing so, and acting accordingly (i.e., by holding back the temptation to publish or considering more specialized venues in case of non-actionable or unsurprising results) could considerably improve both the quality and the longevity of this important area.
