# The White-Shirt Effect, or: Learning from Expectations that Failed

Lutz Prechelt


## A Story


### Revelation

Shortly after waking up unusually peacefully on this
mild, friendly, sunny, simply wonderful August morning,
you have a revelation:
Programmers will make _much_ fewer mistakes if they are
wearing a white shirt!

You are a software manager and oversee the work of more than
700 software engineers, so you straighten up, excited.
This is it! This is what will turn your good software development
organization into a top-class software organization!
Higher productivity! Improved quality!
Happier engineers _and_ customers!
(I should point out that this is a deliberately silly example
to make it easier to focus on the principles in the story
rather than getting distracted by certain details.)

Yet, having a PhD in empirical software engineering, you also
know that sound management practices will require you to prove 
your insight at least correlationally.
You get to work immediately (and will end up having invested
half of your capacity for the next five weeks to prepare your coup).


### Work, work, work

You convince half of the key people in your organization
of what will come to be known as the White Shirt Effect (WSE)
and convince most of the other half that WSE is at least worth
checking out, so your organization backs you up fully in what needs
to be done next.

Having followed the literature on the latest techniques for 
defect-correction-to-defect-insertion mapping (DCDIM) you know
how to find out (once it has been corrected) who has produced a bug 
with good reliability.
The data needed to do this is available in your bug trackers 
and version archives. Easy.

You decide you will find the daily white-shirt bit for each software
engineer from photos. Much tougher.
You enlist one of your best toolmakers and a few days later,
a prototype software works that can determine who is wearning a white shirt
and who is not, based on reusable face recognition technology
and a custom white-shirt-bit plugin.

You manage to calm down the privacy concerns by demonstrating that
the single-purpose, in-house software solution will indeed only capture
the white-shirt bit and nothing else. It takes a full two weeks, but
then your organization allows you to install the 25 cameras required
to capture nearly everybody often enough.

You have an assistant fill the face recognition database with clean
photos of each of your software engineers.

You let the solution run for a week meanwhile two student helpers capture
manually as much of the white-shirt bits as they can to validate
the reliability of the camera-based solution, which proves to work very well.

Knowing that the more interesting defects will take
some time to surface,
you announce the beginning of a six-month trial period:
You explain the WSE to all of your software engineers 
and tell them to wear a white shirt at least 2 days and at 
most 4 days every week and randomize the weekdays.

You find that, in your initial enthusiasm, you had overlooked 
what comes now:
A majority of your software engineer opposes the shirt rule
(some nearly revolt against it), because they are not used to be
told what to wear and many of them do not like shirts ("With a collar?
Are you serious??"), let alone white ones.

It takes a stressful and dramatic plenary meeting, in which you
remind them of the data-driven management principles of your
organization and praise the wonderful consequences of the WSE,
to get those people to agree, grumblingly.
You estimate the white-shirt complicance rate will now be around 85%, 
which ought to be enough.

After this nice reminder that data science is by far not as 
straightforward (nor cheap) as its proponents claim,
you turn back to your other duties, which have meanwhile piled
up a bit, and let your infrastructure accumulate data
in the WSE proof database.


### Disappointment

After six months, you evaluate your data.
You find that the white-shirt compliance went down from 87% in the
first month to 71% in the sixth. Hmm.
Comparing the white-shirt days to the non-white-shirt days,
you find that the defect insertion rates per line-of-code added
or modified is lower for only 6% of your engineers,
is higher(!) for 9% of them (Ouch! Maybe those programmers who claimed
"I _cannot_ work in a shirt" were at least partially right?
You swear because you recognize you have not recorded who they were.),
and is not significantly different for the rest.

The WSE does not appear to exist.


## The Right Reaction

There are two possible reactions at this point:

1. Sigh, admit defeat, give away the cameras to the engineers,
   and hope everybody quickly forgets your silly WSE project.
2. Think "Hey, what's going on here?" and follow up to understand
   _why_ the WSE is not working as you expected.

It should be obivious that only option 2 respects the spirit
of data science.
Besides, with option 1 you would have wasted a lot of effort
and money.

How would the follow up work?
Well, hopefully you did not pursue a WSE revelation without
having any idea of how and why such an effect would arise.
(If you did, option 1 is preferable, really.)
Rather, you will have some mental model of the causation
mechanisms underlying the effect and can now go to check
on intermediate steps, stages, or effects to understand
why the end result is different from your expectation.

In the WSE case, the model might say
1. white shirts radiate an air of purity
2. therefore, engineers will be less likely to interrupt
   a colleage wearing a white shirt,
3. therefore, that colleague can work more undisturbedly,
4. which is known to reduce the frequency of mistakes.
5. Furthermore, the wearer of the shirt will also feel purer,
6. therefore, s/he will be less inclined to write unclean,
   disorderly code, 
7. which again is known to at least tend
   to reduce the frequency of mistakes.

You could now go and check each of these items for instance
1, 2, 4, 5 by means of surveys and
4, 6 by re-reading the literature.
Thinking about the problem more closely, you might come up
with interesting follow-up studies to be performed in your
organization specifically.
For instance, you might be able to use the "local history"
functionality of your engineers' IDEs to detect interruptions
and then check whether they correlate with wearning
white shirts (via the white-shirt bit or a lower-cost small-scale manual
data collection) or correlate with
the insertion of defects (via DCDIM).

Following up in this manner has several positive effects:
- your understanding of your organization will increase,
  so that future improvement ideas are more likely to be helpful;
- your self confidence and hence curiosity (an important resource!)
  will be restored;
- you will learn to find cheaper ways for validating
  new ideas incrementally;
- you may stumble over other problems worth addressing.

In the WSE case, learning to think more incrementally would
probably be the most valuable outcome of following up:
Invalidating the connection from wearing white shirts to
fewer interruptions would invalidate the WSE expectation
much more cheaply and consequently less embarrassingly.


## Practical Advice

Trying to generalize this, we come up with the following data science 
rules for the testing of expectations for which not all data is
yet available.


### Always think of a causational model

Without one, there is no chance to follow up.
If your expectation turns out to be wrong, it will be depressing only.


### Think of a causational model, _before_ you check the expectation

The causational model usually provides opportunities for _partial_ checks 
of your expectation that are so much cheaper 
that you will often want to do them first.


### Be ready to accept inferior types of evidence

Of course having objective data showing exactly what your expectation
predicts is a lot more convincing than weaker forms of evidence,
let alone (shudder!) subjective ones.
However, if your expectation turns out to be wrong, it may be
wise to save the effort for getting that data and instead be content
with weak evidence, such as negative survey data in the WSE case.