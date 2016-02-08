# Why Provenance Matters

###Michael W. Godfrey, University of Waterloo, migod@uwaterloo.ca

Here's a problem:  You're a lead dev for a company that produces a web content management system, and you get email from an open source project leader who claims that your closed source project probably contains some of their open source code, in violation of their license.  She lists three features of your product that she suspects are built around code copied from her system, and she asks you to investigate and respond.  Can you determine if her claim has merit?  How do you investigate it?

Here's another problem:  Your company uses a commercial Java application that ships with embedded third-party libraries.  One of these libraries is known to have had a major security flaw in version 2.1 that was fixed in version 2.1.1.  Are you vulnerable?  How can you tell?

Here's one more:  You've recently agreed to take on the role of bug triage for a large open source project; that is, you are to examine each incoming bug report, decide if the report is legitimate and worth proceeding with, and, if so, assign a developer to investigate.  However, often a single bug will manifest itself in different ways; obviously you don't want to assign multiple developers to fix the same underlying defect.  So how can you tell if a given bug report is truly new, and not just a manifestation of something you've seen before?  That is, how can you effectively "de-dup" a voluminous set of bug reports?

## What's provenance?

What these problem scenarios have in common is that they depend on the *provenance* of software entities [Godfrey-SCP-97-1]; that is, we need to be able to analyze various kinds of evidence that pertain to the origin, history, and ownership of software entities to answer questions such as:
<ul>
<li> What is the history of this entity? How did it come to be where it is currently?  
<li> What other entities is it related to, and how?
<li> What is the evidence? How reliable is it?
</ul>

Understanding the raw design artifacts that comprise our system &mdash; such as the source code, documentation, build recipes, etc. &mdash; gives us only a small part of the larger story. We need also to be able to reason about the relatedness of a wide variety of development artifacts, the processes that produce and manage them, their history and evolution, and the people involved and their roles.

## What are the key entities?

To be able to address these issues, we need to able to identify which particular entities we are interested in, and how they relate to each other.  There are several kinds of entities that we might want to consider:
<ul>
<li> software artifacts that are managed by some tool as first-class entities, such as source code files, commits in a version control system (VCS), or bug reports in an issue tracking system;
<li> attributes of these artifacts, such as version identifiers, current status, comment histories, and timestamps;
<li> synthetic entities such as software features and maintenance tasks, which have strong meaning to developers but may not have crisp definitions or even independent existence; and
<li> relationships between any of the above, which may be explicit, implicit, inferred, or even probabilistic.
</ul>

## What are the key tasks?

Armed with a broad understanding of the kinds of entities in our project, we can then consider how we might use them to answer our questions.  The are two key tasks that we need to be able to perform here:
<ul>
<li> defining and scoping the entities that are of particular interest, and
<li> establishing artifact linkage and ground truth.
</ul>

Additionally, we often need techniques to be able to explore the entity space, such as:
<ul>
<li> scalable matching algorithms to query the large entity space, and
<li> various kinds of historical analyses to answer questions about the evolution of the system.
</ul>

Depending on the task at hand, *defining and scoping the entities of interest* may be straightforward, or it may require tool support and/or manual intervention.  For example, in the first problem scenario, we need to decide how to define and scope a feature.  Then, we need to be able to map these features to sets of code fragments for both our system and the open source system.  Finally, we need to examine the VCS commit history of the code that is related to these features within our system (and if the VCS history of the open source system is available to us, we can do the same for the open source system). 

At this point we have a set of features, decomposed into code fragments across two systems, and a set of related VCS commits that touch these code fragments.  *Establishing artifact linkage and ground truth* is the next problem we need to address.  When the open source project leader mentioned three high level features she thought had been copied, we performed the mapping of the features to source code on both systems.  Did we get it right?  On the other hand, if we trust our decomposition then the commit history gleaned from the VCS should be accurate, unless someone has rebased our git repository [Kalliamvakou-EMSE].

Now we probably want to compare code fragments of the two systems on a feature-by-feature basis using a comparison tool, such as `diff` which compares raw text, or a code clone detector like CCFinder [CCFinder] or ConQAT [ConQAT] which has some understanding of the programming language. Because we've narrowed down our field of interest to a manageable set of code fragments, this step will probably be doable quickly.

But let's suppose that our company's lawyer now steps in with a bigger challenge: he wants us to make sure that nothing in our codebase closely matches any code in any of the five open source systems that are in our problem domain.  Lucky for us, code clone detectors tools are usually designed to be able to process large systems.  In provenance analysis in general, we often have to compare complex structures such as source code against large datasets; *scalable matching algorithms* are required to make this feasible.  This can often be achieved via a two stage process:
<ol>
<li> Preprocessing of the artifacts reduces the dimensionality of the data, say by hashing each line of code; the preprocessed data can then be compared relatively quickly as sets or sequences of hash values.
<li> When a quick comparison suggests a "hit", more complicated approaches can then be used on the original artifacts to prune away false positives.
</ol>

Of course, in reducing the dimensionality of the data, we are losing information; for example, if I copy a method and then make a few changes, any line that is even slightly different from the original will result in a different hash value.  But if we move to the granularity of tokens or characters, then the comparisons become much more time consuming.  So we are always trading off accuracy against performance.

Finally, if we decide that some of the code in the two systems appears to be unusually similar, we can *perform a historical analysis* on the commit trails, to see when and how any "borrowed" code fragments might have made it into our codebase, and which developers might have been responsible.  We may also wish to look for other historic trends, such as unusually large commits by inexperienced developers, since that might also indicate the incorporation of third-party code into the system.

## Another example

Let's return to the second problem scenario now, since it's one we've explored in real life [Davies-EMSE-18-6].  A company approached us with the problem of how to authoritatively ascertain the version identifier of a third-party Java library binary that has been packaged within a commercial application. This sounds like a simple problem, but it's surprisingly tricky to solve.  Sometimes, the version identifier forms part of the name of the included jar file; however, this is merely developer convention, it is not always observed and isn't enforceable technically.  Worse, in our investigations we found instances of where the version identifier had been edited to remove the "release candidate" designation, falsely implying that the included library was the final version.

Our first step was to decide on our entities of interest: versions of Java libraries that are in common use.  Next, we needed to establish ground truth; that is, we decided to build a master database that effectively represented all recent versions of these libraries.  We decided to use the Maven2 [Maven] repository as our data source, since it is very large and we found it to contain instances of almost all recent versions of almost all common Java libraries.  

Our next problem was how to achieve scalable matching of our candidate library against the master repository.  We couldn't just compare source code against source code because our candidate library might not contain any; similarly, we couldn't compare byte code against byte code because the binaries of two identical Java programs might differ if one used a different compiler or command line options.  Instead, we extracted the signatures of the methods that the library contained; these would be extractable from both source code and byte code, and would not be affected by compiler choice.  We then took the SHA1 hash of the library's API (declaration plus method signatures), and let that one hash value represent the library version in our database.  So we downloaded all of Maven &mdash; no mean feat! &mdash; extracted the API information from every version of every library in it, and created the hashes using the provided version identifier as ground truth.   This took some time and effort.  However, once the master repository had been built, analyzing an application was very fast: we extracted the API from the candidate libraries, found the corresponding SHA1 hash value, and looked it up in the database to see if there was an authoritative version identifier.

Of course, there are a couple of problems with our approach: the library or the particular version we're looking for might not be in Maven at all.  Worse, if the API of a library remains stable across several versions, we may match multiple versions, requiring manual intervention to disambiguate.  In practice, however, we found that these were rarely serious problems. New library histories could be added as needed to the master repository for next time, and manual intervention rarely required manually examining more than a small handful of possible matches.

## Looking ahead

As a profession, we are getting better at instrumenting our processes and tracking our steps.  As a profession, we are also increasingly concerned with questions of ownership, origin, evolution, and transparency of the various development artifacts we interact with on a daily basis.  As more and more of our artifacts and processes are managed by tools, automatically logged, and annotated with meta-data, so will the job of provenance analysis become simpler.  And, of course, while we have examined the space of software development artifacts here, the issues and techniques of provenance are no less important for the broader field of data science [Guo-PhD-blog].

###References

[CCFinder] http://www.ccfinder.net

[ConQAT] http://www.conqat.org/

[Davies-EMSE-18-6] "Software Bertillonage Determining the Provenance of Software Development Artifacts", Julius Davies, Daniel M. German, Michael W. Godfrey, and Abram Hindle, *Empirical Software Engineering*, 18(6), December 2013.

[Godfrey-SCP-97-1] "Understanding Software Artifact Provenance", Michael W. Godfrey, *Science of Computer Programming*, 97(1), 1 January 2015.

[Guo-PhD-blog] http://cacm.acm.org/blogs/blog-cacm/169199-data-science-workflow-overview-and-challenges/fulltext

[Kalliamvakou-EMSE] "An in-depth study of the promises and perils of mining GitHub", Eirini Kalliamvakou, Georgios Gousios, Kelly Blincoe, Leif Singer, Daniel German, and Daniela Damian, *Empirical Software Engineering*, accepted June 2015.
	
[Maven] http://maven.apache.org/
