# Bias in data (and something really clever here)

## Anecdote

The 1948 U.S. presidential election proved to be an instrumental even in the ...

As is often the case, many polls were conducted in the run up to the election and the conclusion drawn from these was that the republican New York Governor Thomas Dewey would defeat the presidential incumbent democrat Harry Truman handily.  In fact, the press was so convinced by the ``empirical evidence'' that the Chicago Tribune had already printed the first edition of the paper with the headline "Dewey Defeats Truman" before all election results were in.  Unfortunately for them, the election results the next morning were anything but expected, as Truman had won the electoral vote with 303 votes to Dewey's 189.  A landslide, but in the opposite direction.

In the modern era of data collection and statistics, how could such a thing have happened?  The answer lies not in the analysis of the data, but the many biases inherrent in it's collection.  Consider how the polling occurred.  Like today, polling was conducted by randomly selecting and contacting people via telephone.  However, in 1948 telephones were mostly owned by individuals who were more financially well-off and those with higher income levels tended to lean republican.  While the polling was indeed random, the population sampled (people that had telephones) was biased with respect to the entire voting population.

This is interesting, but surely such a mistake couldn't in the 21st century on data drawn from software engineering...

## Impact in SE

Unfortunately bias exists in software engineering data as well.  If left unchecked, this can have disastrous effects.

Bird et al examined defect data sets to determine if there was bias in the links between a defect in the defect database and the corresponding defect correcting change in the source code repository.  Many lines of research, including defect prediction and empirical studies of code quality depend on the ability to "trace" or "link" a defect to the fixing commit.  In four out of five projects, they found that there was bias in the severity level.  That is, the lower the severity level for a fixed bug, the higher the likelihood that there was a link between the defect and the commit.  As an extreme example, while 65% of fixed defects labeled "minor" were able to be linked in Apache, only 15% of those deemed "blocker"s could be linked (see image foobar) for all


Describe example of bias in bug linking and it's effects.

Describe what can go wrong if you aren't aware of bias.

## Examples

Maybe one or two more examples of bias in SE...

## Identifying bias

How can you tell if there is bias

## Reporting bias

How and when should you report bias

## Assessing Impact

How can you tell if bias is impacting your results.

## Mitigation Strategies

What should you do if you see that there is bias.

## References

Papers to look at for more details.

