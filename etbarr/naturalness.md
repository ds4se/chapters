# The Naturalness of Software[\^1]
[\^1]:This text is adapted from an earlier version that appeared in ICSE NIER 2015.

Earl T. Barr
Department of Computer Science
University College London, WC1E 6BT, UK 
<ebarr@ucl.ac.uk>

Premkumar Devanbu
Department of Computer Science
UC Davis, Davis, CA, 95616 
<ptdevanbu@ucdavis.edu>

## Introduction

Of all that we humans do, it is our use of language that most sets us apart.
Honed by millions of years of cultural and biological evolution, language is
a natural, ordinary, even instinctive part of everyday life
(Pinker, 1994).  However much we authors may labour to
fashion lucid prose for this learned tome, we speak and write spontaneously
and freely in daily life: most of what we say is simple, repetitive, and
effortless.  This quotidian aspect of natural, human linguistic behavior,
together with large on-line corpora of utterances, modern computing
resources, and statistical innovations, has triggered a revolution in
natural-language processing, whose fruits we enjoy everyday in the form of
speech recognition and automated language translation.

But then, there is this funny thing about programming: it is primarily, (even if sometimes unintentionally) *an act of communication*, from one human to another. Knuth said as much, 30 years ago: 

> *Let us change our traditional attitude to the construction of programs: Instead of imagining that our main task is to instruct a computer what to do, let us concentrate rather on explaining to human beings what we want a computer to do.* (Knuth, 1984)

If one, then, were to view programming as a speech act, is it driven by the
"language instinct"?   Do we program as we speak? Is our code largely simple,
repetitive, and predictable?  Is code *natural*?
 
Surely, not all code is. Turn to any sample code in Knuth's own *Art of
Computer Programming*, and see just how simple and repetitive it is!  However,
*that* code is carefully wrought by an expert hand to stand forth as an
exemplar.  Assuredly, most workaday programmers do not have the time to craft
such masterpieces. 

So, then, how much software is *natural*, *viz.*, simple, repetitive and
effortlessly written?  If a lot of "quotidian" code is, indeed, simple and
repetitive, can we use  statistical methods from natural language processing to
assist programmers? Can statistical methods help understand and characterize
programmer behaviour? Can these methods be used to build models to help
beginners avoid and correct common mistakes? Can algorithms automatically
translate between Java and C\#, as we do from English to French? 

These questions are representative of an entirely new direction of research in
software engineering: the study and exploitation of the naturalness of
software, using large, on-line corpora of open-source and other code.  To
investigate this new area, we first used n-gram models.  These models assign a
probability to the next token based on the previous $n-1$ tokens.  These models
have a long history in natural language processing. Modern n-gram models have
sophisticated ways of dealing with issues like data sparsity: *i.e.* some
words never occur during model training, but are then encountered
in practice.  We gathered a large corpus of source code in C and Java, trained
a modern n-gram model over that corpus, and measured the predictive accuracy of
these models using 10-fold cross-validation.  A standard measure here is
*cross-entropy*, which evaluates the "surprisingness" of the code; it is
the average negative log of the probability assigned by the model to each token
in a test corpus. Intuitively, it measures the average *information
content* of each token in bits. 

Typically, English comes in between 7 and 8 bits using modern n-gram models
over words.  What about code?  Its syntax is simpler than natural
language, but contains more neologisms and sometimes defines terms quite far
from their uses.  To our surprise, we found that source code was not only
repetitive and predictable, but much *more so* than natural language,
coming in at around 3--4 bits. We remind the reader that this measure
log-scaled, and thus, code is roughly 8--16 times *more predictable* than
English! This encouraging finding led us to seek applications. 

The first application we tried was improving integrated development environments (IDEs) like Eclipse[\^2] and IntelliJ
Idea[\^3].  IDEs have long offered
*code suggestions and completions* (S\&C).  Completions complete a token
fragment; suggestions complete token sequences.  IDEs use sophisticated engines
that exploit nonlocal information, like token types and variable scope;  in
contrast, the n-gram models we used were purely local.  Our daring idea was
that we could, nonetheless, improve the Eclipse S\&C engine.  We succeeded,
using a fairly simple regimen of blending its suggestions from
higher-probability ones offered by the n-gram  model. In retrospect, it is
reasonable to expect that these two approaches complement each other:  Eclipse
suggests tokens that *are allowed to appear* in a given context; the
n-gram model, by comparison, suggests tokens *that have most frequently
appeared} in similar contexts.  This paper was published in ICSE
2012 (Hindle, 2012) and, to our knowledge, was the first to explicitly
observe the "naturalness of software" and lay out a research vision of work
that studied and exploited this phenomenon.  We followed up this success
by engineering a robust Eclipse plug-in that uses our locality-enhanced
cache-based language model (Tu, 2014) to provide more accurate
suggestions and completions to enhance developer productivity. 


[\^2]: [http://eclipse.org]( http://eclipse.org)<br>
[\^3]: [https://www.jetbrains.com/idea/]( https://www.jetbrains.com/idea/)

## Transforming Software Practice

Beyond its successful application to S\&C tasks, the naturalness of software
promises to transform software practice through its application to seminal 
problems like porting, effective community formation, program analysis, and
assistive technologies.

### Porting and Translation

Automated translation is a success story of statistical natural language
processing. These tools are based on models trained using *aligned
corpora* where parallel texts in two different languages are available. Here,
the question is whether we successfully train a translation engine to translate
between, say Java and C\#, using parallel implementations in the two languages?
Nguyen *et al.* (Nguyen, 2013, 2014a} built a lexical
translation engine that translated between Java and C\#. Its training corpora
contained projects with parallel Java and C\# implementations, with
method-level alignments. Using aligned code, this project also demonstrated the
efficacy of statistical methods in detecting API mappings across different
languages and platforms (Nguyen, 2014b).  More recent work has
moved beyond lexemes to learning phrase-based
translation (Karaivanov, 2014). 


### Studying the "Natural Linguistics" of Code

Linguistics has, *inter alia*, two notable aspects: 1) the study of
language itself and 2) the study of related subjects (*e.g.* psychology,
sociology, anthropology) as they are manifest in linguistic behavior.  If we
view programming as a form of human linguistic behavior, one could a) study how
large corpora of programs are written and evaluate the different language
features they use.  Allamanis *et al.* showed that language models can
distinguish project-specific linguistic phenomena and leveraged this finding to
develop a tool that learns and enforces coding
standards (Allamanis, 2014). This finding suggests that code
manifests "linguistic culture".  The National Science Foundation has recently
funded the pursuit of the second line of work, *viz.*, the social and
human aspects of code linguistics. This work aims to identify whether
project members have coding styles that "signal" to others that they are
in-group rather than out-group, similar to the way in which speech patterns
behavior can indicate whether a person belongs to a group.  Success here may,
for instance, provide ways to establish development processes that are more
welcoming to newcomers.


### Analysis and Tools

The predictability of code suggests semantic properties of code are also
predictable.  In the extended version of our ICSE 2012
paper (Hindle, 2012b), we hypothesized that:

> semantic properties (of code) are *usually* manifest in *superficial* ways that are computationally cheap to detect, particularly when compared to the cost (or even infeasibility) of determining these properties by sound (or complete) static analysis.

We described (Section VI.D) the possibility of estimating a statistical model
over a corpus of code, well-annotated with static analysis facts; and
then using this translation approach to provide maximum a-posteriori (MAP)
probability guesses as to  likely semantic properties, given easily detected
"surface" features.  A recent paper realized this approach,  using
Conditional Random Fields, for the task of guessing reasonable names and
likely type annotations in Javascript programs (Raychev, 2015).


### Assistive Technologies

Assistive technologies enable users with motion impairments to use computers.
They must extract useful signals from constrained movements (such as limited
hand movements with just one or two degrees of freedom) or from noisy signals
(*e.g.*, speech or jittery movements).  The user's observed input can be considered
a sample drawn from a distribution conditioned on the intended input, and the
task of the assistive device is to identify the intended input. In such
settings, a good predictive model is essential.

Dasher (Wills, 2006) replaces a keyboard, allowing the rapid input of
English text using motion limited to 2 dimensions.  The user chooses the next
letter from a streaming menu of letters that fly at him/her, based on the
previous five letters.  Dasher works remarkably well, since the hexagram-based
entropy of letters in English is quite low, on the order of a few bits.
Unfortunately, the token (*i.e.*, word) entropy of English is too high to
allow Dasher to stream words instead of letters.  In code, however, the token
entropy is low enough that it is possible to choose tokens.  We built a Dasher
for code prototype to demonstrate this approach, which you can view
online[\^4].

[\^4]: [http://naturalness.cs.ucdavis.edu]( http://naturalness.cs.ucdavis.edu)


## Conclusion

Software is a natural product of human effort, and shares many statistical
properties with natural language.  This phenomenon promises a wealth of
applications, leveraging on prior work on statistical methods in natural
language; it also offers the promise of using new scientific methodologies
to investigate the human and social aspects of software, drawn from
approaches in cognitive and social linguistics.  

+ M. Allamanis, E. T. Barr, and C. Sutton. Learning natural coding conventions. arXiv preprint arXiv:1402.4182, 2014.
+ A.Hindle, E.Barr, M.Gabel, Z.Su, and P.Devanbu. On the Naturalness of Software. In ICSE, pages 837–847. IEEE, 2012.
+ A. Hindle, E. Barr, M. Gabel, Z. Su, and P. Devanbu. On the Naturalness of Software. [http://macbeth.cs.ucdavis.edu/nature.pdf](http://macbeth.cs.ucdavis.edu/nature.pdf), 2012. [Extended Version, Online; accessed 08-Feb-2015].
+ S. Karaivanov, V. Raychev, and M. Vechev. Phrase-based statistical translation of programming languages. In Proceedings of the 2014 ACM International Symposium on New Ideas, New Paradigms, and Reflections on Programming & Software, pages 173–184. ACM, 2014.
+ D. E. Knuth. Literate programming. The Computer Journal, 27(2):97– 111, 1984.
+ A. T. Nguyen, H. A. Nguyen, T. T. Nguyen, and T. N. Nguyen. Statistical learning approach for mining api usage mappings for code migration. In Proceedings, ASE Conference, pages 457–468. ACM, 2014.
+ A. T. Nguyen, T. T. Nguyen, and T. N. Nguyen. Lexical statistical machine translation for language migration. In Proceedings, SIGSOFT FSE, pages 651–654. ACM, 2013.
+ A. T. Nguyen, T. T. Nguyen, and T. N. Nguyen. Migrating code with statistical machine translation. In Companion Proceedings of ICSE, pages 544–547. ACM, 2014.
+ S. Pinker. The Language Instinct: The New Science of Language and Mind, volume 7529. Penguin UK, 1994.
+ V. Raychev, M. Vechev, and A. Krause. Predicting Program Properties from ”Big Code”. In POPL, 2015.
+ Z. Tu, Z. Su, and P. Devanbu. On the localness of software. In Proceedings SIGSOFT FSE, pages 269–280. ACM, 2014.
+ S. A. Wills and D. J. MacKay. Dasher-an efficient writing system for brain-computer interfaces? Neural Systems and Rehabilitation Engineering, IEEE Transactions on, 14(2):244–246, 2006.
