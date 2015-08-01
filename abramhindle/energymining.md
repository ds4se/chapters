# Measure a bunch, Compare Once: Perils of Energy Mining

## Story

There once was a donut enthusiast who frequented a donut shop that
fried their own donuts on demand. You could buy donuts and donut
holes, smaller donuts shaped like the hole portion of torodiol donuts.
The enthusiast reasoned that donut holes were faster to make because
they were smaller and thus needed less heat to fry. The enthusiast
designed an experiment to prove this notion: order donuts and time the
order, then order donut holes and time the order. The enthusiast
visited the donut shop and ordered french crueller donuts, which took
5 minutes, and french crueller donut holes, which took 1 minute. The
enthusiast was elated, but doubt set in. The enthusiast repeated the
experiment a few times and the results were the same. The next week
the enthusiast tried something else, the enthusiast visited the donut
shop and ordered french crueller donut holes, which took 5 minutes,
and then ordered french crueller donuts, which took 1 minute. The
enthusiast was baffled and asked the donut maker why? The donut maker
explained that donuts and donut holes were fried at the same time from
the same dough, the minute delay between each order was to find the
right sized box.

The enthusiast assumed that creating donuts and donut holes was
independent, but in fact these orders were not independent to the
donut maker. When measuring software energy consumption one has to be
careful to set up tests appropriately in order to measure the
behaviour being tested.

## Example

Shaiful Chowdhury [#chowdhury2015] came into the lab and proclaimed,
"HTTP2.0 has significantly better energy performance than HTTP1.1!"
"That's excellent," I exclaimed. "Do you know why?" I asked.

The next week Shaiful came back to the lab and said, "I think I was
wrong, I don't think there's a difference." He went on to explain that
he was happy with the results of the first experiment but something
was bothering him. To test HTTP/1.1 in Firefox he had to open an
about:config in Firefox and disable it. His energy consumption test of
firefox for HTTP/1.1 had to do more work than his HTTP/2.0 tests. His
HTTP/2.0 tests did not need to disable HTTP/2.0 features in Firefox
while his HTTP/1.1 test did. He investigated the CPU state of the
HTTP/2.0 and HTTP/1.1 tests and found that the rigourous button
pushing to change settings in the HTTP/1.1 test put the CPU into a
higher state (high frequency, more voltage). This in turn meant that
when the HTTP/1.1 requests were made the CPU was already consuming
more energy than in teh HTTP/2.0 tests. In fact the HTTP/2.0 were
unlikely to reach the higher CPU state because the inputs for both
tests were quite sparse.

The solution was to inject some idle time into the HTTP/1.1 to bring
the CPU back down to the lower state. Then via manual ensure that this
idle time did its job. Afterwards both tests produced results that
were comparable.

We almost suffered from an attribution error, the change in energy
consumption was not cuased by HTTP/1.1 or HTTP/2.0 code in Firefox. It
was caused by our HTTP/1.1 test inducing the CPU to have a different
state than the HTTP/2.0 tests.

This is one of many perils one faces when engaged in Green Mining,
energy-aware mining, and software energy consumption measurement.

## What to watch for

The most difficult aspect of measuring and mining software energy
consumption is to juggle all of the confounds and potential threats to
validity one faces.

The first question any software energy miner should ask themselves is
"What am I actually measuring?".  This directly relates to construct
validity. Can we form a test or benchmark that will allow us to
compare energy consumption of the attribute or issue in question?

<!-- green mining methodology -->

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
* Granularity -- how often do we measure, and what level of
  measurement?
  There's a balance between representative
  performance and invasive instrumentation.
* Idle -- many applications and service have idle operation, this
  operation is often ignored in tests, yet is valuable as it shows the
  difference between idling and executing tasks.
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

[Green Mining]{#hindle2012} studies the evolution of an applications
energy profile, how much energy it consumes per task over different
versions of the software. Our work in Green Mining has shown that
software does indeed change in energy performance over time and
measuring just 1 version of the software might not be representative
of the versions before or after. It is recommended that multiple
versions of the software are measured.

### Energy or Power

Energy is the cost of work or the capacity to do work, energy is
typically measured in joules (J). Power is the rate of energy
consumption, measured in watts (W) where 1 W = 1 Js (1 watt is 1 joule
second). Wattage also equals to voltage times amperage (W=VI).
Energy is essentially power integrated. But when we measure
energy consumption or power we have to decide which measure is more
important.

When you measure a task that a system executes, ask your system, does
this task have a clear beginning or end? Does this task continuously
run? If the task has a clear beginning and end then measuring the
energy, the workload's cost, consumed during that task makes more
sense than the power or average power of the test. Where as a
continuous running task or service might be better measured as the
power, the rate of work done. Mean-watts are also useful when speaking
about tasks that are being compared that have the same runtime.

### Repeat!

While we already recommended measuring multiple versions of software,
something even more important is to repeat your measurements. Modern
computers are very noisey and active systems with lots of background
processes and lots of state. They have many peripherals and
services. It is hard to guarantee what tasks are executing on a modern
system and what the current environment is like. If you're running a
test using WIFI your own cellphone could affect the
experiment. Furthermore we're measuring physical phenomena: energy
consumption. Our measurement equipment, our testbeds, or energy
measurement devices all have error in them, error is inherent in
physical measurement thus we need to take multiple measurements so we
can rely upon statistics to give us a more clear picture of what we
measured.

### Granularity

When designing a energy consumption test one has to choose the level
of granularity. Do you want to measure method calls, system calls, CPU
use, memory use, processes, etc.? What frequency of measurement do you
need and you can your measurement equipment report that. Many
measurement devices and chips, such as the Watts Up? Pro device, are
sampling at thousands of times per second, integrating the results and
reporting back to you. But if you only have 1 second of granularity
you won't be measuring the cost of a method call unless you repeatedly
and expressly benchmark that method call, regardless of the realism of
that scenario. Granularity is important because it might induce
overhead. If you need method call level measurements, the
instrumentation overhead will be high.

Another issue with granularity is if you measure just a single process
or component or whether you measure the whole system. An example
scenario is if you asked the soundcard to play a sound for 1
second. The request to play a sound might return in 1ms to the
process, for the next second the OS, the sound card driver and sound
card will be interacting, playing the requested 1 second of audio. If
we measure at the process level we miss the induced cost on the system
of the software, the software commanded work but we are not measuring
that work. If we measure at the entire system level we will be
including a lot of other processes and drivers that will be
irrelevant.

### Idle Measurement

Not all applications or tasks have idle behaviour. Many programs run
until their task is complete and then exit, but many user facing
applications and services run continuously or intermittently in the
foreground or background. What programs do when they aren't in direct
use is important because usually their idle operation is a waste of
resources. Unless work is being executed during idle time, most
applications that consume energy with no input as being wasteful. A
good process can stay asleep until it receives input. The operating
system's scheduler is very good at sleeping and waking processes.

Furthermore it is important to understand what the baseline energy
consumption for an application is. If executing tasks and idleness use
the same amount of energy perhaps the idle components can be optimized
to use less energy. From an analysts perspective have statistics on
idle consumption is useful during analysis to determine what impact
changes might have on implementation of non-functional requirements.

### Statistical Analysis

Repeat measurements cause 1 problem, there is no longer 1 measurement,
there are many. Thus summary statistics must be employed to describe
the distribution of measurements. There is one saving grace, energy
measurements are of physical phenomena and the Normal (or Gaussian)
distribution works quite well to model natural measurements and
natural errors in measurement. Thus the variance and mean are two
reasonable descriptors of our multiple runs. Furthermore the central
limit theorm states that means of means tend to be a normal
distribution. Thus we can assume normal distributions while measuring
energy for 1 system and we can use tests, such as Student's T-test to
compare two distributions of measurements to see if they are
statistically significantly different. Without tools such as T-test we
would not have much confidence to determine if distribution's were
different or not based on random chance.


### Exceptions

To err is human and to throw uncaught exceptions is to execute
code. Mobile devices and modern computers still suffer from crashing
software and your tests can suffer from crashes as well. Exceptions
happen, core dumps occur, sometimes apps decide to update, sometimes
the network goes down. Sometimes a remote site goes down. Regardless
exceptions occur and must be identified and dealt with. Sometimes the
software is just inherently buggy and only 1/2 of the test runs will
complete. When developing tests one should instrument the tests with
screenshot capabilities such that you know what is actually running at
the time. Furthermore all outliers should be investigated and
potentially re-run. Weird things can happen and if your analysis is
saying two sets of runs are different, hopefully it wasn't the errors!

## Summary

In summary, there are many confounds that one faces when measuring
software energy consumption. First and foremost, energy consumption is
a physical process and energy consumption measurement requires
repeated measurement and statistical analysis. Thus remember and use
ENERGISE mnemonic to help evaluate energy measurement scenarios:
environment, N-versions, energy or power, repeated measurement,
granularity, idle measurement, statistical analysis, and exceptions.


 
## Footnotes

[British or Canadian spelling]{#british}


## References

[chowdhury2015]{#chowdhury2015} Shaiful Alam Chowdhury, Varun Sapra ,
and Abram Hindle.  "Is HTTP/2 More Energy Efficient Than HTTP/1.1 for
Mobile Users?" , PeerJ Preprints, 2015.

[hindle2012]{#hindle2012} Hindle, Abram. "Green mining: A methodology
of relating software change to power consumption." In Proceedings of
the 9th IEEE Working Conference on Mining Software Repositories,
pp. 78-87. IEEE Press, 2012.
