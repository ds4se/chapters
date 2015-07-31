# The Perils of Energy Mining

## Story

- Shaiful story
- measure HTTP versus HTTP2
- Significant difference between HTTP and HTTP2
- But a counter example showed up
- CPU State mattered

There once was an analyst who enjoyed donuts. The analyst frequented a
shop that sold fresh donuts, fried on demand.  The analyst looked at
french creullers donuts and then at the french crueller donut holes
(the middle part of the donut punched out).  THe analyst reasoned that
donut holes would be faster to produce than full donuts, because they
required less time to fry in the oil.  The analyst then concocted an
experiment where they would order donut holes and time it, followed by
ordering donuts and timing it.  The first week the analyst found that
donut holes took 5 minutes but donuts took 1 minute. This puzzled the
analyst who's theory seemingly was disproved.  The next week the
analyst repeated this experiment in the opposite order, ordering
donuts first and donut holes last. The donuts took 5 minutes and the
donut holes took 1 minute.  This greatly confused the analyst who
asked the donut maker why the times were different depending on the
order. The donut maker said that when someone orders donuts, donut
holes are made at the same time. And when donut holes are made, donuts
are made at the same time. Donuts and donut holes took the same time,
it was the customer request that changed.  Thus the analysts test
relied on an assumption that making donut holes and donuts was
independent, but it was his testing and observation that induced the
creation of both.  When measuring the energy consumption of software
we have to mind our assumptions and we should be very concerned about
what happens when we ask the system to execute our tests in order for
us to measure them.

## Example

Shaiful Chowdhury came into the lab and proclaimed, "HTTP2.0 has
signifcantly better energy performance than HTTP1.1!"  "That's
excellent," I exclaimed. "Do you know why?" I asked.

The next week Shaiful came back to the lab and said, "I think I was
wrong, I don't think there's a difference."  He went on to explain
that he was happy with the results of the first experiment but
something was bothering him.  To test HTTP/1.1 in Firefox he had to
open an about:config in Firefox and disable it. His energy consumption
test of firefox for HTTP/1.1 had to do more work than his HTTP/2.0
tests. His HTTP/2.0 tests did not need to disable HTTP/2.0 features in
Firefox while his HTTP/1.1 test did. He investigated the CPU state of
the HTTP/2.0 and HTTP/1.1 tests and found tjhat the rigourous button
pushing to change settings in the HTTP/1.1 test put the CPU into a
higher state (high frequency, more voltage).  This in turn meant that
when the HTTP/1.1 requests were made the CPU was already consuming
more energy than in teh HTTP/2.0 tests.  In fact the HTTP/2.0 were
unlikely to reach the higher CPU state because the inputs for both
tests were quite sparse.

<!-- describe solution -->

We almost suffered from an attribution error, the change in energy
consumption was not cuased by HTTP/1.1 or HTTP/2.0 code in Firefox.
It was caused by our HTTP/1.1 test inducing the CPU to have a
different state than the HTTP/2.0 tests.

This is one of many perils one faces when engaged in Green Mining,
energy-aware mining, and software energy consumption measurement.

## What to watch for.

The most difficult aspect of measuring and mining software energy
consumption is to juggle all of the confounds and potential threats to
validity one faces.

The first question any software energy miner should ask themselves is
"What am I actually measuring?".  This directly relates to construct
validity. Can we form a test or benchmark that will allow us to
compare energy consumption of the attribute or issue in question?

<!-- AH: Mention task under test -->


<!-- AH: using internal links as footnotes -->
[ENERGISE]{#british} is a simple mnemonic checklist of issues that one should
consider when measuring software energy consumption:

* Environment -- prepare a testbed to allow for measurement.
* N-versions -- run a test across more than 1 version of the software.
* Energy or power -- do we care about total energy consumed for a
  task, like a function
  or the cost of continuous execution (a service)?
* Repeat -- 1 run is not enough, we need to run our tests multiple
  times to deal with background noise.
* Granularity -- how often do we measure, and what level of measurement?
* Instrumentation -- there's a balance between representative
  performance and invasive instrumentation.
* Statistics -- if we repeat measures we need to compute
  statistics. How do we evaluate changes?
* Exceptions -- errors happen, how do we deal with them or notice them?

### Environment

The environment is the testbed and the system that will run the
software under test. Environments should be representative of
realistic scenarios be balanced against noise. Noise is induced by 3rd
party apps or traffic, unneeded applications, or intermittent use by
other stakeholders. Generally environments should be controlled and
quiet, yet still be representative of the environment they will run
it.

### N-Versions

The first step to any successful attempt at optimization is to measure
what the system before optimization. If we are measuring software
energy consumption to determine the impact of changing the code we
should measure the system before the modification to allow for
comparison.

[Green Mining]{#greenmining} studies the evolution of an applications
energy profile, how much energy it consumes per task over different
versions of the software. Our work in Green Mining has shown that
software does indeed change in energy performance over time and
measuring just 1 version of the software might not be representative
of the versions before or after. It is recommended that multiple
versions of the software are measured.

### Energy or Power

Does your task under


## In Summary
 
 
## Footnotes

[British or Canadian spelling]{#british}


## References



<!--
   
   * G for granularity
   * V for Versions  not all software reacts the same way
   * E for Equality of testing  make an even playing field for tests.
   * R for Repeat measurements
   * E for Errors, they occur, watch out.
   * O for 
   * L for
   
   * I
   * N
   * D
   * U
   * C
   * E
   
   * V for version
   * O for oracle order 
   * L for level playing field
   * T for tests
   * A for accuracy? or average
   * G for granularity
   * E for Exception
   
   * A Average/Accuracy
   * M multiple times/versions
   * P Prepare? 
   * E equality
   * R repeat
   * E Exception
   
   * E exception
   * N N-versions
   * E Environment
   * R repeat?
   * G Granularity
   * Y et again
   
   * G - granularity
   * R - Repeat
   * O - Oracle? Order?
   * V - version
   * E - Equality/Errors
   * L - level playing field
   
-->
