# Actionable Metrics Are Better Metrics

  * "Frank, I'm sorry, we're letting you go."
  * "Why? What did I do wrong? I've been your best developer for 30 years!"
  * "We ran some metrics and found that your code used the letter 'm' 10 times more than anyone else."
  * "What does that matter?"
  * "We've found that code using the letter 'm' is more likely to have memory leaks, and you use it all the time, don't you?"
  * "You mean `malloc`? But, you asked me to rewrite our memory manager!"
  * "Not our problem. Data never lie."

True, data is just data. But humans use data to lie all the time... with metrics. Metrics are a huge part of our evidence-based society. Metrics drive what data we collect, determine the exact phrasing of our conclusions, and shape our perspectives. One wrong step with a metric, and we can grossly misunderstand the world around us.

In software development, a common data misinterpretation is to always assume that a metric is *actionable*. That is, are we using this metric to directly drive decisions? Does the metric actually tell us what to do next? Or is it more of an indication of a condition?

# What would you say... I should DO?

An actionable metric is one that inspires us to improve. Consider these metrics in our everyday lives:

  * Hours spent in the gym
  * Speed of your car in relation to the speed limit
  * Number of days since last accident

In each of those situations, a specific property is being measured - and that property is something that the person being measured has direct control over. What happens when "Number of hours spent in the gym" decreases? Improving upon that metric is easy: go to the gym!

Now consider these metrics:

  * Number of home runs hit this season
  * Number of hackers who attacked this operating system
  * Body temperature
  * Exam grade

A general manager would be unfair to approach his players and say "hit more home runs", or a CIO telling her system administrators: "get hacked less". That's not useful. Everybody wants those metrics to improve, but *how* improvement is to be made is not a directly controllable action for the people involved. The above metrics, rather, are **emergent** properties: they are the result of many good forces cooperating at once.

Consider body temperature as another example. In medicine, a high body temperature is a *symptom* of an illness, not the *cause*. Note that body temperature is still useful as a metric because it indicates problems, but it does not provide direction to doctors on how to treat a patient.

# The Offenders

Unactionable metrics are commonplace in software engineering. Two metrics stand out as being particularly frustrating to developers: number of bugs and code churn.

## Number of bugs

The Number of bugs metric is ubiquitous in software quality discussions. Defect density, failure rate, fault occurrences, and many others variations all try to tell the same picture: how many problems have we had with this system? Ideally, software quality is much more nuanced than simply the number of bug reports, but managers count what they have and number of bugs is easy to count.

Unfortunately, the existence of a bug is not the result of one simple action. A single bug can be a combination of all kinds of software engineering failures: requirements mistakes, design flaws, coding errors, lack of testing, miscommunication, or poor process. To aggregate all of these complex scenarios into a single metric and then ask developers to reduce them is simply not helpful to developers. To behave as if it it were actionable is indicative of a get-it-right-the-first-time mentality instead of continuous improvement. Number of bugs, therefore, is *emergent* not actionable.

## Code Churn

Code churn is a metric that describes the amount of change a module has undergone. As a software project evolves, source code is added and deleted constantly. By mining the source code management system (such as the Git or Subversion repository), researchers can collect the number of lines of code that have changed for a given file over time.  Historically, churn is a predictor of quality problems, such as bugs and vulnerabilities: files that change a lot overall are more likely to have big problems later. In the empirical software engineering research world, code churn has become a staple in bug prediction models.

But, code churn is difficult to act upon. What should developers do... not change code? No bugfixes? No new features? No compatibility upgrades? Of course not! That code churn works in a bug prediction model means that we have a good indication of where problems will be, but we don't understand why. Code can churn for all sorts of reasons, most of which are unavoidable.

While code churn by itself is unavoidable, specific variations of code churn can be more actionable. For example, suppose we define a metric called "un-reviewed churn" that counts the number of changes that did not undergo a code inspection. A high un-reviewed churn has a clear recommendation. If we have empirical support that the metric is also correlated with bugs (and we do from some recent studies), then the recommendation is clear: do more code reviews on those changes.

# Actionable Heroes

After seeing the worst, let's take a look at some metrics that are actionable in interesting ways.

## Number of Developers

Source code management is not just a record of what code changed, it can also be a record of how developers are working together. When two developers make changes to the same source code file, they have a common cause. One useful metric that comes out of this is the "number of different developers who changed this file". The metric typically defined over a period of time, such as one year or the most recent release. Historically, this metric is correlated with later having bugs and vulnerabilities - the more developers who work on a file, the higher the probability of bugs later on.

Number of Developers is actionable because it can indicate organizational problems in your team. If a file has 200 developers committing to a single source code file, then chances are they are not all coordinating with each other to make joint decisions. Unintended effects of many changes at once can plausibly introduce bugs. A high number of developers might also indicate design problems that forces developers to maintain a monolithic file. Build files, for example, might need to be touched by many developers if not properly broken down according to subsystem.

## Number of Callees (Coupling) and Number of Parameters

When examining the source code itself, metrics such as "number of method callees" and "number of parameters" can indicate actionable problems in your product. If a method makes many external calls, or accepts many different parameters, perhaps that method has too much responsibility. A well-designed method should have a single responsibility that is clearly understood. Reducing the number of callees and number of parameters through refactoring can directly help this responsibility problem

# Cyclomatic Complexity: An Interesting Case

Metrics can be actionable but not empirically useful at the same time. McCabe's cyclomatic complexity is one such metric. Broadly speaking, cyclomatic complexity is derived by counting the number of potential paths through the system (typically at the method level). Originally designed to estimate the number of unit tests a method needs, cyclomatic complexity is built into a lot of metric tools and static analysis tools. Developers can and often do use it to measure their notion of "cognitive" complexity, and use it to target their refactoring efforts. Lower the cyclomatic complexity, and improve the testability of your code. However, many empirical studies have shown that, historically, cyclomatic complexity is strongly correlated with the number of lines of code. In fact, cyclomatic complexity provides no new information in predicting bugs than the size of the method (or file or other unit of measure). Well-designed code will be both more concise and have fewer conditionals. Therefore, in comparison to the easier-to-collect "number of lines of code", cyclomatic complexity provides very little new information: it is actionable, but typically not useful.

# Are Unactionble Metrics Useless?

Of course not! Unactionable metrics (aka emergent metrics) can be quite useful in telling us about the symptoms of a problems. Like "number of bugs", we can get an overall assessment of how the product is doing. Emergent metrics are most useful when they are a surprise, for example, when a student's grade comes back lower than expected. We simply cannot rely upon emergent metrics to diagnose the problem for us.

Thus, an **actionable** software development metric is one that measures a property directly under a developer's control. An **emergent** metric is one that aggregates a variety of potential problems into a single measurement without an obvious diagnosis. Actionable metrics tell us how to improve, whereas emergent metrics tell us where we are.
