# Log It All? 

Gail C. Murphy, University of British Columbia, Canada

## A Parable: The Blind Woman and an Elephant

Imagine a group of blind women are asked to describe what an elephant
looks like by touching different parts of the elephant [1]. One blind woman
touches the trunk and says it is like a tree branch. Another blind woman
touches the leg and says it is like a column. 
The third and fourth blind women touch the ear and tail, saying the elephant is like a
fan and a rope respectively.

Each of these women belives she is right, and, from her own
perspetive, each is right.
But, each decision is being made on only partial data 
and tells only part of the entire story. 

## Misinterpreting Pheonmenon in Software Engineering

When we collect data to investigate a software engineering phenomenon,
we have to take care not to fall into the trap of taking a single
perpsective.  Let's consider that we want to know more about the
phenomenon of how software developers learn commands available in an
integrated development environment (IDE). Understanding what commands
are being used, and how and when new commands are learned, might help to
develop tools to suggest other useful commands developers are not already
using as a means of improving the developer's productivity (e.g.,
[2]).

To investigate this phenomenon, we decide to monitor each and every
command the developer executes as she works. As part of the logged
information, we capture the time at which the command was executed,
the command itself, and how the command was invoked. We then deploy
a monitoring tool and start gathering the information from as many
developers as we can convince to install the monitor.

As we gather the logged command data from (hopefully thousands of)
developers and begin the analysis, we realize that there are many
different subsequences of command usage we did not initially
anticipate.  For example, we may be surprised to see searches for
references to uses of methods interspersed with debugging commands,
such as step forward.

It is only at this point in our analysis when we realize that we are
missing data about the context in which commands are executed, such
as which windows were visible on the screen in the integrated
development environment when the command was executed. Had we captured
this information, we could infer from the visible
windows whether a command is likely
being executed while debugging or while writing code.  Understanding
more about this context could enable us to build better recommender
tools.

We had inadvertently fallen into the trap of looking at the phenomenon
from only one perspective.

## Using Data to Expand Perspectives

As the example demonstrates, capturing more data and making it
available for analysis can help us expand our perspective on a
software engineering phenomenon.

Imagine if we were now able to not just capture the windows visible
when a command is executed, but we also knew which task on which the developer
was working, such as the particular feature being developed.
With this data, we might be able to start understanding which
commands are most applicable for different kinds of tasks. And what if
we could capture the developer's face as the tasks were performed?
This data might help identify which commands require more
concentration than others to execute and might change the sequence
or situations in which a tool recommends particular commands to learn.

Although we might want to capture many kinds of data to understand a
pheomenon, is more data always better? In determining what data to
capture, we must consider a number of issues: 

* can the data be captured practically? Although we might want to
capture video of a developer's face using an IDE and although cameras
for web conferencing are becoming more readily available, it is not
practical to capture this data for a large number of developers
working in a variety of environments.

* will the developers accept the capture and use of the data? Not every
developer is likely to feel comfortable with video of their face being
captured as it raises many privacy concerns.

* what are the constraints on transmission and sharing of the data?
Some data that might be captured might need to be protected because
transmission or sharing of that data with the researchers might
comprise intellectual property. In some cases, it may be possible
to transform the data in such a way that alleviates the concerns
about transmission and sharing. In other cases, there may not
be a meaningful transform. Researchers must carefully consider
how to ensure the data meets any constraints of the environment
in which it is collected.

* can the data be captured at a cost proportional to its likely value?
Not all data can be captured at a reasonable cost to either the
developer or the user or both. The potential benefits of how the
data might influence the study of the software engineering phenomenon
must be weighed against its collection costs.

## Recommendations

We have described that collecting more data can help lead to a more
accurate interpretation of a phenomenon of interest. We have also
described that there are constraints on simply gathering data
about everything happening in a situation of interest.

How can a researcher decide what data to collect when? Here are
some recommendations:

1. Decide on the minimal data you need to make progress on the problem
of interest. Make sure you can collect at least this data.

2. Consider what other data it is feasible to collect and try to
collect any and all data that is practical and cost-effective to collect and that will
not violate privacy or security concerns of those in the environment
in which the data will be collected.

3. Think through the analysis and/or techniques and tools driving the
collection of the data. Ask questions about how whether the data
intended to be collected is sufficient for the analysis or technique
and tool creation.

4. Think about the threats to any analysis and/or techniques and
tools driving the collection of the data. How might the
data mislead?

5. Iterate across each step until you are certain that you have
the right balance between data collection concerns and
ensuring as accurate a view of a phenomenon as possible.

Above all, make sure your data doesn't lead you to miss
the elephant for one of its parts.

## References

[1] Wikipedia, "Blind men and an Elephant": https://en.wikipedia.org/wiki/Blind_men_and_an_elephant

[2] Murphy-Hill, E.R., Jiresal, R. and Murphy, G.C. Improving software developers' fluency by recommending development environment commands. SIGSOFT FSE 2012: 42


