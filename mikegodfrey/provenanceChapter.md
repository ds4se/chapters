# Why Provenance Matters

###Michael W. Godfrey, University of Waterloo, migod@uwaterloo.ca

Here's a problem:  You're a lead dev for a company that produces a web content management system, and you get email from an open source project leader who claims that your closed source project probably contains some of their open source code, in violation of their license.  She lists three features of your product that she suspects are built around code taken from her system, and she asks you to investigate and respond.  Can you determine if her claim has merit?  How do you investigate it?

Here's another problem:  Your company uses a commercial Java application that ships with embedded third-party libraries.  One of these libraries is known to have had a major security flaw in version 2.1 that was fixed in version 2.1.1.  Are you vulnerable?  How can you tell?

Here's one more:  You've recently agreed to take on the role of bug triage for a large open source project; that is, you are to examine each incoming bug report, decide if the report is legitimate and worth proceeding with, and, if so, assign a developer to investigate.  However, often a single bug will manifest itself in different ways; obviously you don't want to assign multiple developers to fix the same underlying defect.  So how can you tell if a given bug report is truly new, and not just a manifestation of something you've seen before?  That is, how can you effectively "de-dup" a voluminous set of bug reports?

## What's provenance?

What these scenarios have in common is that they depend on the *provenance* of software entities [Godfrey-SCP-97-1]; that is, we need to be able to analyze various kinds of evidence that pertain to the origin, history, and ownership of software entities to answer questions such as: 

- What is the history of this entity? How did it come to be where it is currently?  

- What other entities is it related to, and how?

- What is the evidence? How reliable is it?

## What are the key tasks?

To do so, we need to able to identify which entities we are interested in, and how they relate to each other.  There are several kinds of entities that we might want to consider:

1. software artifacts that are managed by some tool as first-class entities, such as source code files, commits in a version control system (VCS), or bug reports in an issue tracking system;

2. attributes of these artifacts, such as bugfix comment histories and timestamps;

3. synthetic entities such as software features and maintenance tasks, which have strong meaning to developers but may not have crisp definitions or even independent existence; and

4. relationships between any of the above, which may be explicit, implicit, inferred, or even probabilistic.

Depending on the task at hand, *defining and scoping the entities of interest* may be straightforward, or it may require tool support and/or manual intervention.  For example, in the first scenario, we need to decide how to define and scope a feature.  Then, we need to be able to map these features to sets of code fragments for both our system and the open source system.  Finally, we need to examine the VCS commit history of the code that is related to these features within our system (and if the VCS history of the open source system is available to us, we can do the same for the open source system).  

At this point we have a set of features, decomposed into code fragments across two systems, and a set of related VCS commits that touch these code fragments.  *Establishing artifact linkage and ground truth* is the next problem we need to address.  When the open source project leader mentioned three high level features she thought had been copied, we performed the mapping of the features to source code on both systems.  Did we get it right?  On the other hand, if we trust our decomposition then the commit history gleaned from the VCS should be accurate, unless someone has rebased our git repository.

Now we probably want to compare code fragments of the two systems on a feature-by-feature basis using a comparison tool, such as `diff` which compares raw text, or a code clone detector like CCFinder [CCFinder] or ConQAT [ConQAT] which has some understanding of the programming language. Because we've narrowed down our field of interest to a manageable set of code fragments, this step will probably be doable quickly.

But let's suppose that our company's lawyer now steps in with a bigger challenge: he wants us to make sure that nothing in our codebase closely matches any code in any of the five open source systems that are in our problem domain.  Lucky for us, code clone detectors tools are usually designed to be able to process large systems.  In provenance analysis in general, we often have to compare complex structures such as source code against large datasets; *scalable matching algorithms* are required to make this feasible.  This can often be achieved via a two stage process:

1. Preprocessing of the artifacts reduces the dimensionality of the data, say by hashing each line of code; the preprocessed data can then be compared relatively quickly as sets or sequences of hash values.
2. When a quick comparison suggests a "hit", more complicated approaches can then be used on the original artifacts to prune away false positives.

Of course, in reducing the dimensionality of the data, we are losing information; for example, if I copy a method and then make a few changes, any line that is even slightly different from the original will result in a different hash value.  But if we move to the granularity of tokens or characters, then the comparisons become much more time consuming.  So we are always trading off accuracy against performance.

Finally, if we decide that some of the code in the two systems appears to be unusually similar, we can *perform a historical analysis* on the commit trails, to see when and how any "borrowed" code fragments might have made it into our codebase, and which developers might have been responsible.

## Another example

Let's return to the second scenario now, since it's one we've explored in real life [Davies-EMSE-18-6].  A company approached us with the problem of how to authoritatively identify the version identifier of a third-party Java library binary that has been packaged within a commercial application. Sometimes, the version identifier forms part of the name of the included jar file; however, this is merely developer convention, it is not always observed and isn't enforceable technically.  Worse, we found instances of where the version identifier had been edited to remove the "release candidate" designation, implying that the library was the final version.

The first step was to decide on our entities of interest: versions of Java libraries that are in common use.  Next, we needed to establish ground truth; that is, we decided to build a master database that effectively represented all recent versions of these libraries.  We decided to use the Maven2 [Maven] repository as our data source, since it is very large and we found it to contain instances of almost all recent versions of almost all common Java libraries.  

Our next problem was how to achieve scalable matching of our candidate library against the master repository.  We couldn't just compare source code against source code because our candidate library might not contain any; similarly, we couldn't compare byte code against byte code because the binaries of two identical Java programs might differ if one used a different compiler or command line options.  Instead, we extracted the signatures of the methods that the library contained; these would be extractable from both source code and byte code, and would not be affected by compiler choice.  We then took the SHA1 hash of the library's API (declaration plus method signatures), and let that one hash value represent the library version in our database.  So we downloaded all of Maven -- no mean feat! -- extracted the API information from every version of every library in it, and created the hashes using the provided version identifier as ground truth.   

Once the master repository had been built, analyzing an application was very fast: we extracted the API from the candidate libraries, found the corresponding SHA1 hash value, and looked it up in the database to see if there was an authoritative version identifier.

Of course, there are a couple of problems with this approach: the library or the particular version might not be in Maven at all.  Worse, if the API of a library remains stable across several versions, we may match multiple version identifiers, requiring manual intervention to disambiguate.  In practice, however, that these were rarely serious problems. New library histories could be added as needed to the master repository for next time, and manual intervention rarely required manually examining more than a small handful of possible matches.

## Looking ahead

As a profession, we are getting better at instrumenting our processes and tracking our steps.  As a profession, we are also increasingly concerned with questions of ownership, origin, evolution, and transparency of our various artifacts.  As more and more of the artifacts that concern software development are managed by tools and annotated with meta-data, so will the job of provenance analysis become simpler.

###References

[CCFinder] http://www.ccfinder.net

[ConQAT] http://www.conqat.org/

[Davies-EMSE-18-6]  "Software Bertillonage Determining the Provenance of Software Development Artifacts", Julius Davies, Daniel M. German, Michael W. Godfrey, and Abram Hindle, *Empirical Software Engineering*, 18(6), December 2013.

[Godfrey-SCP-97-1] "Understanding Software Artifact Provenance", Michael W. Godfrey, *Science of Computer Programming*, 97(1), 1 January 2015.

[Maven] http://maven.apache.org/
