
# Mining Apps for Normal Behavior

## The specification problem

So you have some program.  It can be yours, it can come from a third party.  You want to use it.  But before you do so, you may ask: Does it do what it is supposed to do?  And will it continue to do so in the future?  

Getting guarantees on program behavior is a fundamental problem of software development.  It is typically addressed by static and dynamic verification techniques, ranging from simple random testing to full-fledged symbolic correctness proofs.  Sufficient testing will give you confidence that the basic functions work as expected.  Static checks guarantee that variables only hold the correct data types.  And modern verification tools may even produce a guarantee that your program will never crash -- even for nontrivial programs.

In practice, the problem with verification is not only the verification itself, though -- it is to know _what to verify against_.  This is the problem of _specification_, writing down what a program should do (and what not).

Take a simple mobile game like Flappy Bird, for instance.  Your aim is to move a little bird up and down such that it does not hit an obstacle.  As a developer, you don't want the game to crash, that's for sure; so "no crashes" would be part of your specification.  (Actually, this one is so common you would not have to write it down.)  But suppose you want to teach a computer to test the game.  You'd have to specify the basic gameplay, let the computer control the bird, and check whether the game correctly ends if and only if the bird has crashed into an obstacle.  How would you specify all this?  And is it not as complex as writing the program in the first place?

A human, on the other hand, needs no such specification of how to play the game.  That's because we humans can build on our _experience_ with similar games on similar devices.  If you ever toyed with a touch screen, you'll know how to interact with it; if you ever played a Jump-And-Run game, you'll get the grasp of Flappy Bird.  But not only will you be able to play it, you will also be able to compare it against other games you have seen, and give an assessment of how the game stacks up.  All this experience and implicit context makes humans great testers.  The only problem is that humans are a pretty limited resource.  Which raises the question: _Is there a way we can teach computers all this implicit knowledge about programs and the world they're in?_  This is where app stores and app mining come into play.


## App mining

From a researcher's perspective, app stores are nothing but collections of programs.  If you want to investigate programs, there's millions of them freely available - many even come with source code, which makes their analysis particularly easy.  Apps in app stores have three exciting features, though:

* First, apps are pretty much _uniform_, as they cater towards one (mobile) platform only.  They use the same binary format and the same libraries, which on top use fairly recent designs.  All this makes apps easy to analyze, execute, and test - and consequently, easy to compare.

* Second, apps come with all sorts of _metadata_, such as names, descriptions, categories, downloads, reviews, ratings, and user interfaces. All of these can be associated with program features, so you can, for instance, associate program behavior with descriptions.  (You can also mine and associate just the metadata, finding that bad reviews correlate with low download numbers - but than, this would be product mining, not app mining.)

* Third, apps are redundant.  There's plenty of apps that all address similar problems - in similar or dissimilar ways.  This is in sharp contrast to open source programs, where each solution would typically be implemented exactly once, and then reused.  This redundancy in apps allows to learn common patterns of how problems are addressed - and, in return, detect anomalies.

All of this offers plenty of research opportunities; all you need is the data and a means to dig through it.  The data, though, is not that easy to get. You cannot simply download a huge app collection from some research server - that would be a huge copyright violation.  Instead, you have to download your own collection from the app store of your choice, one app after another, together with the associated metadata.

Depending on your investigation, you may need several thousand apps.  Since the offering in the app store does not necessarily match what's on user's devices, you should focus on frequently downloaded apps from all app categories, from gaming to productivity.  All these apps and their metadata then forms your source of knowledge - the very knowledge a computer can and should use as it comes to identifying "normal" behavior.


## Normal and abnormal programs

One of the first and foremost applications of app mining is to identify _malicious behavior_ - that is, behavior that is directed against the user's interests.  But how do we know what the user's interests are?  And if we don't know, how can we tell whether some behavior is malicious or not?  By mining a set of benign apps, we can at least tell whether some behavior is normal or abnormal.  If it's normal, then it may well be expected and accepted; if it's abnormal, though, then it may require further scrutiny.

The problem with "normal" behavior is that it varies according to the app's purpose.  If an app sends out text messages, for instance, that would normally be a sign of malicious behavior - unless it is a messaging application, where sending text messages is part of the advertised features.  If an app continuously monitors your position, this might be malicious behavior - unless it is a tracking app that again advertises this as a feature.  As a consequence, simply checking for a set of predefined "undesired" features is not enough - if the features is clearly advertised, then it is reasonable to assume the user tolerates or even wants these features, because otherwise, she would not have chosen the app.

To determine what is normal, we thus must assess program behavior together with its _description_.  If the behavior is advertised (or can be implied by the kind of application), then it's fine; if not, it may come as a surprise to the user, and thus should be flagged.  This is the idea we followed in our first app-mining work, the CHABADA tool.

CHABADA stands for "Checking App Behavior Against Descriptions of Apps"; it is a general tool to detect mismatches between the behavior of an app and its description. CHABADA works in two stages:

1. CHABADA starts with a (large) set of apps to be analyzed.  It first applies tried-and-proven natural language processing techniques to abstract the app descriptions into topics.  It builds _clusters_ of those apps whose topics have most in common.  Thus, all apps whose descriptions refer to messaging end up in a "Messaging" cluster.  You may also get "Games" clusters, "Office" clusters, or "Travel" clusters, as well as a number of clusters featuring doubtful apps; all these will reproduce realities from the app store.

2. Within each cluster, CHABADA will now search for _outliers_ regarding app behavior.  As proxy for behavior, CHABADA simply uses the set of API calls contained in each app; these are easy to extract using simple static analysis tools.  To identify outliers, CHABADA uses tried-and-proven outlier analysis techniques, which provide a _ranking_ of the apps in a cluster depending on how far away their API usage is from the norm.  Those apps that are ranked highest are the most likely outliers.

What do these rankings give you?  We identified "Travel" applications that happily shared your device identifier and account information with the world (which is rare for "Travel" applications).  Plenty of apps tracked all sorts of user information without mentioning this in their description.  (We had a cluster named "Adware" which contained apps focusing on collecting data.)  But outliers can also come to be because they are the one good app amongst several dubious ones.  In our "Poker" cluster, only one app would not track user data - and would promptly be flagged as an outlier.

The real power of such approaches, however, comes when they are applied to _malicious_ apps.  Applied on a sample of NNN apps, CHABADA ...  In our more recent MUDFLOW work, ... 

Mind again that these recognition rates come from learning _from benign samples only_.  That is, CHABADA and MUDFLOW can be applied to detect malware even if it were the very first of its kind.


## Outlook

APIs and data flows are just the beginning.  Better dynamic analysis, better testing.  More data sources (in apps) to extract and to exploit.  We hope we have whet your appetite!








Legend has it that Archimedes once solved a problem sitting in
his bathtub.
Crying  _Eureka!_ ("I have it!"), legend says he leapt out
of the bath and ran to tell the king about the solution.
Legend does not say if he stopped to get dressed first.

When we stumble onto some pattern in the data, it is
so tempting to send a _Eureka!_ text to the business
users.  This is a natural response that stems from
the excitement of doing science and discovering an
effect that no one has ever seen before.

Here's my warning: don't do it. And least, don't do it straight away.

I say this because I have often fallen into the trap
of _correlation is not causation_. Which is to say,
just because some  connection pattern has been observed between
variables does  not necessarily imply that a  real-world causal mechanism
has been discovered. In fact, that "pattern" may actually just
be an accident- a mere quirk of cosmic randomness.  

## Example

For an example of nature tricking us and offering a "pattern"
where, in fact, no such pattern exits, consider the following
two squares (this example comes from  Peter Norvig).
One of these was generated by people pretending
to be a coin toss while the others were generated by actually
tossing a coin, then writing vertical and horizontal marks
for heads or tails.

```
-||--|-|-||-|-||-||-|--|-|
--||---|--||--|-|--|-|-|--
---|-|-|--||-|-|||-|--|-||
--|-|-||--|--||-||-|-|-||-
-|-||--||-||-||-|-|--|-|||
|-||||-||-|||-|-|||-||---|
|-|-|-||--|--|---|-|--||-|
-|-|||--|-||-||-|-|-||---|
-|--||----|||-|-||-|-||-|-
||-|||-|-|-||-|--|-|-||||-
---||-|-|||--|-|-|---|-|--
|||--|--|-|-||-||-|-|-||-|
           (A)
		   
-|-|||-----|-------||--|-
-||--|||||--|--|-|||-||||
--||----||-||-|----|--|-|
||-|-|-|||-||--|||-|-||||
|-|||-|-|--||-|-|-||--|--
||-|--|-----|----|---||--
||---|---|-||||-|||||-|-|
|---|---||-||||-|-|------
-|---|-|||-|---||-||-|---
|||-||----||||||-|||||---
|-|------||----||-||-----
-|||-|||-|--|--|-||------
             (B)
```
Can you tell which one is really random? Clearly, not (B) since it has too
many runs long runs of horizontal and vertical marks.
But hang on-- is that true?
If we toss a coin 300 times, then at probability 25%, 12%, 6%, 3% we will
get a run of the same mark that is three, four,  five, or six ticks long.
Now 0.03*300=9 so in (B), we might expect several  runs that are at least
six ticks long. That is, these "patterns" of long ticks in (B) are actually
just random noise.

## Case Studies in SE

Sadly, there are many examples in software
engineering of data scientists uncovering "patterns"
which, in retrospect, was more "jumping at shadows"
than discovering some underlying causal
mechanism.  For example,  Shull et al. reported
one study at NASA's
Software Engineering Laboratory that
"discovered" a category of software that seemed
inherently most bug prone.
The problem with that
conclusion was that, while certainly true, it missed
an important factor. It turns out that that
particular sub-system was the one deemed least
critical by NASA. Hence, it was standard policy to let
newcomers work on that sub-system in order to learn
the domain.  Since such beginners make more
mistakes, then it is hardly surprising that this
particular sub-system saw most errors.

For another example, 
Kocaguneli et al. had to determine which code files were
created by a distributed or centralized development
process. This, in turn, meant mapping files to their
authors, and then situating some author in a
particular building in a particular city and
country.  After  weeks of work  they "discovered" that a very small number
of people seemed to produced most of the core
changes to certain Microsoft products. Note that if
this was the reality of work at Microsoft, it would
mean that product quality would be most assured by
focusing more on this small group. 

However, that conclusion was completely wrong.
Microsoft is a highly optimized organization that
takes full advantage of the benefits of
auto-generated code.  That generation occurs when
software binaries are being built and, at Microsoft,
that build process is controlled by a small number
of skilled engineers. As a result, most of the files
appeared to be "owned" by these build engineers even
though these files are built from code provided by a
very large number of programmers working across the
Microsoft organization.  Hence, Kocaguneli had to
look elsewhere for methods to improve productivity
at Microsoft.

## What to do

Much has been written on how to avoid spurious and misleading
correlations to lead to bogus "discoveries". Vic Basili
and Steve Easterbrook and colleagues advocate a "top-down"
approach to data analysis where the collection process
is controlled by research questions, and where those
questions are defined _before_ data collection. 

The advantage of "top-down" is that you never ask data
"what have you got?"-- a question that can lead to the
"discovery" of bogus patterns. 
Instead, you only ask "have you got X?"
where "X" was defined before the data was collected.

In practice, there are many issues with top-down, not the
least of which is that in SE data analytics, we are often
processing data that was collected for some other purpose
than our current investigation. And when we cannot control
data collection, we often have to ask the open-ended question"what is there?" rather
than the top-down question of "is X there?".

In practice, it may be best to mix up top-down with some "look around"
inquires:

+  Normally, before we look at the data, there
are questions we think are important and issues we want to explore.
+ After contact with the data, we might find that other issues
are actually more important and that other questions might be
more relevant and answerable.

In defense of a little less top-down analysis,
I note that many important  accidental discoveries
 might have been overlooked if researchers restricted themselves
to just the questions defined before data collection. 
Here is a list of discoveries, all
made by researchers were pursuing other goals:

+ North America (by Columbus)
+ Penicillin
+ Radiation from the big bang;
+ Cardiac pacemakers (the first pacemaker was a badly built cardiac monitor);
+ X-ray photography;
+ Insulin;
+ Microwave ovens;
+ Velcro;
+ Teflon;
+ Vulcanized rubber; 
+ Viagra.

## In Summary: Wait and Reflect Before you Report

My message is _not_ that data miners are useless algorithms
that torture data till they surrender some spurious conclusion.
By asking open-ended
"what can you see?" questions, our
data miners can find
unexpected novel patterns that are actually true and
useful-- even if those patterns fly in the face of
accepted wisdom. For example, Schmidt and Lipson's  Eureqa machine can learn
models that make no sense (with respect to current
theories of biology) yet can make accurate
predictions on complex phenomena (e.g.  
ion exchanges between living cells).


But, while
data miners can actually produce useful models, sometimes
they make mistakes. So, my advice is:

+  Do not rush to report the conclusions that you just uncovered,
just this   morning.  
+ Most definitely, **do not** confuse business
users with such recent raw results. 
+ Always, always,
always, wait a few
days. 

And while you wait,
critically and carefully review how you
reached that result.  See if you can reproduce it
using other tools and techniques or, at the very
least, implement your analysis a second time using
the same tools (just to check if the first result
came from some one letter typo in your scripts).



 
 


## References


+  Victor R. Basili. 1992. Software Modeling and Measurement:
   The Goal/Question/Metric Paradigm. Technical Report. University of Maryland at College Park, College Park, MD, USA. 
+ Easterbrook, Steve; Singer, Janice; Storey,
  Margaret-Anne; Damian, Daniela; Selecting
  empirical methods for software engineering
  research Guide to advanced empirical software
  engineering 285-311 2008 Springer London
+ Ekrem Kocaguneli, Thomas Zimmermann, Christian
  Bird, Nachiappan Nagappan, and Tim
  Menzies. 2013. Distributed development considered
  harmful?. In Proceedings of the 2013 International
  Conference on Software Engineering (ICSE
  '13). IEEE Press, Piscataway, NJ, USA, 882-890.
+ Peter Norving, Warning Signs in Experimental Design and Interpretation, http://goo.gl/x0rI2
+ Schmidt M., Lipson H. (2009) Distilling Free-Form Natural Laws from Experimental Data, Science, Vol. 324, no. 5923, pp. 81 - 85.  
+ Forrest Shull, Manoel G. Mendoncaa, Victor Basili,
  Jeffrey Carver, Jose; C. Maldonado, Sandra Fabbri,
  Guilherme Horta Travassos, and Maria Cristina
  Ferreira. 2004. Knowledge-Sharing Issues in
  Experimental Software Engineering. Empirical
  Softw. Engg. 9, 1-2 (March 2004), 111-137.
  
