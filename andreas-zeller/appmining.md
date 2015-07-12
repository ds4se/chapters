
# Mining Apps for Anomalies

## The million-dollar question

So you have some program.  It can be yours, it can come from a third party.  You want to use it.  But before you do so, you may ask the million-dollar question: _Does the program do what it is supposed to do?_  And will it continue to do so in the future?  To answer this question, we first need to know what it is the program should do, or, conversely, what it should not do.  While it is easy to state a couple of desired and undesired properties, there is a huge gray area that is surprisingly hard to define.

Take a simple mobile game like Flappy Bird, for instance.  Your aim is to move a little bird up and down such that it does not hit an obstacle.  As a developer, you don't want the game to crash, that's for sure; so "no crashes" would definitely be on the list of undesired properties - together with "not spying", "not deleting all my files", and other generic properties we usually take for granted.

But suppose you want to teach a computer to _test_ the game - to check whether the _desired_ properties are all there.  You'd have to specify the basic gameplay, let the computer control the bird, and check whether the game correctly ends if and only if the bird has crashed into an obstacle.  How would you specify all this?  And is it not as complex as writing the program in the first place?

We humans need no such detailed specification of how to play the game.  That's because we humans can build on our _experience_ with similar games: If you ever played a Jump-And-Run game, you'll get the grasp of Flappy Bird.  But not only will you be able to play the game, you will also be able to check it against its description.  All this is based on your experience.  The question is: Can we teach a computer how to do this - _check a program against expectations?_  To do this, we must find a way to have a computer learn such expectations, or in other words, to _learn what program behavior is normal in a given context._  And this is where app stores and app mining come into play.


<!-- Getting guarantees on program behavior is a fundamental problem of software development.  It is typically addressed by static and dynamic verification techniques, ranging from simple random testing to full-fledged symbolic correctness proofs.  Sufficient testing will give you confidence that the basic functions work as expected.  Static checks guarantee that variables only hold the correct data types.  And modern verification tools may even produce a guarantee that your program will never crash - even for nontrivial programs.

In practice, the problem with verification is not only the verification itself, though - it is to know _what to verify against_.  This is the problem of _specification_, writing down what a program should do (and what not).

Take a simple mobile game like Flappy Bird, for instance.  Your aim is to move a little bird up and down such that it does not hit an obstacle.  As a developer, you don't want the game to crash, that's for sure; so "no crashes" would be part of your specification.  (Actually, this one is so common you would not have to write it down.)  But suppose you want to teach a computer to test the game.  You'd have to specify the basic gameplay, let the computer control the bird, and check whether the game correctly ends if and only if the bird has crashed into an obstacle.  How would you specify all this?  And is it not as complex as writing the program in the first place?

A human, on the other hand, needs no such specification of how to play the game.  That's because we humans can build on our _experience_ with similar games on similar devices.  If you ever toyed with a touch screen, you'll know how to interact with it; if you ever played a Jump-And-Run game, you'll get the grasp of Flappy Bird.  But not only will you be able to play it, you will also be able to compare it against other games you have seen, and give an assessment of how the game stacks up.  All this experience and implicit context makes humans great testers.  The only problem is that humans are a pretty limited resource.  Which raises the question: _Is there a way we can teach computers all this implicit knowledge about programs and the world they're in?_  This is where app stores and app mining come into play. -->


## App mining

The key idea of app mining is to _leverage the knowledge_ encoded into the hundreds of thousands of apps available in app stores - specifically, to determine what would be normal (and thus expected) behavior, to detect what would be abnormal (possibly unexpected) behavior, and thus to guide programmers and users towards better security and usability.

From a researcher's perspective, app stores are nothing but collections of programs.  If you just want to investigate programs, there's millions of them freely available - many even come with source code, which makes their analysis particularly easy.  Apps in app stores have three exciting features, though:

* First, apps are pretty much _uniform_, as they cater towards one (mobile) platform only.  They use the same binary format and the same libraries, which on top use fairly recent designs.  All this makes apps easy to analyze, execute, and test - and consequently, easy to compare.

* Second, apps come with all sorts of _metadata_, such as names, descriptions, categories, downloads, reviews, ratings, and user interfaces. All of these can be associated with program features, so you can, for instance, associate program behavior with descriptions.  (You can also mine and associate just the metadata, finding that bad reviews correlate with low download numbers - but than, this would be product mining, not app mining.)

* Third, apps are redundant.  There's plenty of apps that all address similar problems - in similar or dissimilar ways.  This is in sharp contrast to open source programs, where each solution would typically be implemented exactly once, and then reused.  This redundancy in apps allows to learn common patterns of how problems are addressed - and, in return, detect anomalies.

All of this offers plenty of research opportunities; all you need is the data and a means to dig through it.  The data, though, is not that easy to get. You cannot simply download a huge app collection from some research server - that would be a huge copyright violation.  Instead, you have to download your own collection from the app store of your choice, one app after another, together with the associated metadata.

Depending on your investigation, you may need several thousand apps.  Since the offering in the app store does not necessarily match what's on user's devices, you should focus on frequently downloaded apps from all app categories, from gaming to productivity.  All these apps and their metadata then forms your source of knowledge - the very knowledge a computer can and should use as it comes to identifying "normal" behavior.


## Detecting abnormal behavior

One of the first and foremost applications of app mining is to identify _malicious behavior_ - that is, behavior that is directed against the user's interests.  But how do we know what the user's interests are?  And if we don't know, how can we tell whether some behavior is malicious or not?  By mining a set of benign apps, we can at least tell whether some behavior is normal or abnormal.  If it's normal, then it may well be expected and accepted; if it's abnormal, though, then it may require further scrutiny.

The problem with "normal" behavior is that it varies according to the app's purpose.  If an app sends out text messages, for instance, that would normally be a sign of malicious behavior - unless it is a messaging application, where sending text messages is part of the advertised features.  If an app continuously monitors your position, this might be malicious behavior - unless it is a tracking app that again advertises this as a feature.  As a consequence, simply checking for a set of predefined "undesired" features is not enough - if the features is clearly advertised, then it is reasonable to assume the user tolerates or even wants these features, because otherwise, she would not have chosen the app.

To determine what is normal, we thus must assess program behavior together with its _description_.  If the behavior is advertised (or can be implied by the kind of application), then it's fine; if not, it may come as a surprise to the user, and thus should be flagged.  This is the idea we followed in our first app-mining work, the CHABADA tool.

CHABADA stands for "Checking App Behavior Against Descriptions of Apps"; it is a general tool to detect mismatches between the behavior of an app and its description. CHABADA works in two stages:

1. CHABADA starts with a (large) set of apps to be analyzed.  It first applies tried-and-proven natural language processing techniques to abstract the app descriptions into topics.  It builds _clusters_ of those apps whose topics have most in common.  Thus, all apps whose descriptions refer to messaging end up in a "Messaging" cluster.  You may also get "Games" clusters, "Office" clusters, or "Travel" clusters, as well as a number of clusters featuring doubtful apps; all these will reproduce realities from the app store.

2. Within each cluster, CHABADA will now search for _outliers_ regarding app behavior.  As proxy for behavior, CHABADA simply uses the set of API calls contained in each app; these are easy to extract using simple static analysis tools.  To identify outliers, CHABADA uses tried-and-proven outlier analysis techniques, which provide a _ranking_ of the apps in a cluster depending on how far away their API usage is from the norm.  Those apps that are ranked highest are the most likely outliers.

What do these rankings give you?  We identified "Travel" applications that happily shared your device identifier and account information with the world (which is rare for "Travel" applications).  Plenty of apps tracked all sorts of user information without mentioning this in their description.  (We had a cluster named "Adware" which contained apps focusing on collecting data.)  But outliers can also come to be because they are the one good app amongst several dubious ones.  In our "Poker" cluster, only one app would not track user data - and would promptly be flagged as an outlier.

The real power of such approaches, however, comes when they are applied to detect _malicious_ apps.  Applied on a set of 22,500 apps, CHABADA can detect 74% of novel malware as such, with a false positive rate below 10%.  Our recent MUDFLOW prototype, which learns normal _data flows_ from apps, can even detect more than 90% of novel malware leaking sensitive data.  Mind again that these recognition rates come from learning _from benign samples only_.  Thus, CHABADA and MUDFLOW can be applied to detect malware even if it is the very first of its kind - simply because it shows unusual behavior compared to the many benign apps found in app stores.


## A treasure trove of data

At this point, API usage and static data but scratch the surface of the many facets of behavior that can be extracted from apps.  To whet your appetite, here's a number of ideas that app stores all make possible:

1. Future techniques will tie program analysis to _user interface analysis_, for instance to detect whether the user agreed to specific terms and conditions before starting whatever questionable behavior.  (And whether the terms and conditions were actually legible on the screen!)

2. Mining user interaction may reveal _behavior patterns_ whose violation may imply usability issues.  If a button named "Login" does nothing, for instance, it would be very different from the other "Login" buttons used in other apps.

3. Given good test generators, one can systematically explore the dynamic behavior, and gain information on concrete text and resources accessed.  For instance, an app that shows a map would typically send the location to a known maps service - but not necessarily to some obscure server we don't know nothing about.

The fun with apps is that they offer so many different data sources that can all be associated with each other - and there's so many instances of apps that one can indeed learn what makes normal and expected behavior.  Plus, there are so many ways the resulting patterns can be used to guide programmers and secure users.  Enjoy app mining!
 


## References

+ Alessandra Gorla, Ilaria Tavecchia, Florian Gross, and Andreas Zeller: [Checking App Behavior Against App Descriptions](http://www.st.cs.uni-saarland.de/appmining/chabada/).  Proceedings of the International Conference on Software Engineering, 2014.

+ Konstantin Kuznetsov, Alessandra Gorla, Ilaria Tavecchia, Florian Gross, and Andreas Zeller: Mining Android Apps for Anomalies.  In Christian Bird, Tim Menzies, and Thomas Zimmermann (Eds.), _Art and Science of Analyzing Software Data_, Springer, 2015.

+ Vitalii Avdiienko, Konstantin Kuznetsov, Alessandra Gorla, Andreas Zeller, Steven Arzt, Siegfried Rasthofer, and Eric Bodden: [Mining Apps for Abnormal Usage of Sensitive Data](http://www.st.cs.uni-saarland.de/appmining/mudflow/).  Proceedings of the International Conference on Software Engineering, 2015.

+ [Saarland University app mining project page](http://www.st.cs.uni-saarland.de/appmining/)