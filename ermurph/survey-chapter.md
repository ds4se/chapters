# Avoiding Survey Design Traps: A Successful Process for Sailing Past the Temptations of Persephone's Sirens

![The Sirens: AP Press Image: $210](AP110929152491.jpg)

Authors: Titus Barik and Emerson Murphy-Hill

In the legendary tale of Homer's Odyssey, the honored Odysseus and his crew must confront Persephone's [Sirens](http://www.greekmythology.com/Myths/Creatures/Sirens/sirens.html) --- dangerous yet alluring sea nymphs. As the story goes, these creatures possessed irresistible charm and fatal, lyrical voices which enchanted all who heard it. Spellbound, nearby crews would be lured to their gruesome deaths as they plunged themselves into the sea. Still, adventurers risked the journey for the promise of knowledge, for through the Sirens' song, "[o]ver all the generous earth [the adventurers] know everything that happens."

Where all others had failed, Odysseus became the first mortal to live to gain this knowledge. How did he do it? Through guidance from Circe, the goddess of magic, Odysseus instructed his crew to plug their ears with molded wax to deafen them from the song. He then had his crew tie him to the mast and commanded them not to release him under any circumstances. And so Odysseus and fellow crew navigated past the Sirens. Odysseus, having heard the Sirens' songs, sailed away a wiser man.

Surveys, as with Persephone's Sirens, are an attractive instrument for empirical research and offer a similar lure of knowledge. Like Circe, we offer guidance, grounded in our own experiences, on a successful process for conducting survey research in software engineering.

## The Lure of the Sirens: The Attraction of Surveys

Surveys are an attractive option for several reasons. The first reason is easy scalability. After an initial sunk cost to develop the survey, our perception is that can we simply scale up by sending the survey to more participants. The second reason is that surveys are easy to deploy. Today, the preferred format is predominately electronic survey distribution, not print, and many user-friendly, online services exist to help researchers design and deploy surveys. A final reason is that surveys give us a certain sense of quantitative comfort because the survey responses can be downloaded into a spreadsheet or other statistical analysis software. A popular form of question-style, _Likert_ statements (Strongly Disagree to Strongly Agree), can then be quantitatively analyzed through various descriptive and statistical techniques that are already familiar to us.

But as with Odysseus, these lures are only surface benefits. Our experiences have taught us the harsh lesson that, without caution, lurking beneath the waters are several traps that lead to shipwreck. Let's figure out how to avoid that fate.

## Navigating the Open Seas: A Successful Survey Process in Software Engineering Research

Homer's cautionary story warns us of the perils of early exploration without sufficient preparation. Odysseus succeeded where others before him had failed because of his careful planning.

In contrast with other disciplines that use surveys for _psychometric evaluation_, such as education, our observation is that surveys in software engineering are most frequently used as a way to obtain multiple viewpoints, or to _triangulate_. Surveys are also used to draw inferences about a larger population, or to _generalize_.

This six-stage process we present here is tailored for software engineering researchers and addresses many of the concerns for a community that is predominantly quantitative. In developing this process, we have learned from our own mistakes, from the feedback of reviewers, and from interviews with other researchers who use surveys as an empirical method.  

### Stage 1: Initial Recruitment

It's tempting to jump right in and begin writing survey questions, and today's software packages almost entice you to do so. But as we learned with the Sirens, adventurers who dashed off on their journey without appropriate preparation ultimately met a bitter end. To avoid this fate, it's essential to first consider the questions you want to ask and how you intend to use the answers to the questions. This is not simply a matter of taking your research questions and translating them into survey question form. We've found, for example, that the phrasing of the question itself is highly contextually sensitive and that practitioners often do not have the same interpretation of a topic as the researcher.

One way to mitigate this risk is to create a very short survey and cast a wide net to recruit participants with familiarity on the topic. For example, one survey on data science practices randomly sampled employees and asked them three simple questions: "Do you perform data science activities?"; b) "What's your biggest frustration when performing data science?; and c) "May we follow-up with you?"

Next, follow-up with several of these participants and conduct interviews with them.

### Stage 2: Interviews

The interview is one process through which the researcher gains information about their topic. We've found a successful approach is to ask participants to share specific stories that relate to a particular topic. Often, participants will tell these in the form of "war stories," which describe challenging situations and how they overcame them.

Think of these interviews as incredible sources of knowledge. Like the songs of the Sirens, these 30-45 minute interview sessions provide us with rich stories, told directly through the voices of those who experienced them. 

Nonetheless, these isolated anecdotes are difficult to generalize because they are highly contextualized. Also, because interviews are expensive and time-consuming to conduct, only a limited number of stories are practical to obtain. But by translating these stories into survey response questions, we can both generalize and scale these stories.

### Stage 3: Survey Design

It's now time to design the survey. Just as Odysseus realized early on that he would not be able obtain the Sirens' knowledge through force, a similar principle holds for survey design. Since online surveys are self-administered, be careful about wording. Instead of inventing terms, prefer to use language that you encountered in the interviews conducted earlier. Otherwise, your questions might not connect with the survey participants.

There are two broad categories of questions you can ask: closed and open response. Closed response, such as multiple choice or Likert scales, are easy to statistically analyze, but fix the set of possible responses. Open response, such as short answer text fields, can provide new and unexpected insights. However, it's laborious to analyze these unstructured, free-text responses. Our preference is to use open responses sparsely and instead rely on the interview content for these types of questions.

The key to successful survey design, then, is to ensure that the majority of your questions are grounded in and derived from the experiences of the interviews. As an example, in our survey about game development and traditional software development, we asked a set of Likert statements on coding, process, and team. The statements were of the form "My software has high technical debt." (Coding), "My team uses a waterfall process, rather than an agile process." (Process), and "Creativity is highly valued on the team" (Team).

How did we know which statements to ask? Our statements came directly from the stories told by participants during our semi-structured interviews. By doing so, we can triangulate stories we heard in the interviews and generalize those experiences quantitatively.

### Stage 4: Survey Piloting

Don't count on your initial survey design to be perfect. In an extreme case, a collaborator spent nearly a year in preparation while his team argued about question wording. By the time they "finished," the survey had become obsolete and ultimately proved to be useless.  

Instead, consider a more agile approach by _piloting_ the survey: ask a few friends to take the survey  and then analyze the results the way you normally would. With as few as five participants, you can often catch the most egregious mistakes.

During piloting, a useful perspective is to test your survey like you’d test software. Survey bugs can appear in the most unlikely of places. For example, one "bug" we found through this process was in our consent form. A participant could choose "I don’t consent to participate," but still fill out the survey! This would have been disastrous, because we wouldn't know who consented and who didn’t. We'd have to throw out all the data.

Here are some observations during piloting:

* Length matters, and you should pay attention to how long it takes to complete the survey. We recommend that the survey not take more than 15 minutes.
* Cut, cut, cut! This is a good opportunity to identify questions that are redundant, confusingly-worded, or overly difficult. 
* Identify drop points where participants may give up on the survey.
* Pay attention to open response questions and don’t expect rich answers. In general, people don’t like typing stuff --- that’s what interviews are for.

Finally, providing a strong _initial recruitment letter_ is perhaps just as important as the survey, but it is often overlooked or done as an afterthought. Be sure to motivate how the participant benefits from the survey. Why should they take it? What do they get out of it? They always wants to know, “Why’d you pick me?” 

Though Odysseus had only one chance to face the Sirens, piloting offers you multiple opportunities to quickly practice your survey before embarking on the real journey. 

### Stage 5: Survey Deployment

It's time to send out the survey! If you've done everything right so far, this is where you, like Odysseus, will sail past the Sirens and obtain insight and knowledge from the journey. During deployment, there are still a few items to keep in mind:

* Have a finite close date. We usually give our participants two weeks to complete the survey.
* Responses come in a bathtub model. You get a lot of responses early, then nothing or a trickle, followed by a final burst. Send a remainder to those that didn't respond the first time around, but you should consider preliminary analysis after the first set of responses so that you're not blocked on survey completion.
* Be respectful and avoid oversampling the same participants or communities. Aim for diversity. Certain open source communities, such as Eclipse, Mozilla, and Apache, tend to be swamped with surveys from researchers all over the world.

There's no hard and fast rule for the number of survey responses to target, but for quantitative data, _power analysis_ is a useful technique for estimating the number of responses you'll need.

### Stage 6: Survey Analysis and Write-up

You've made it past the Sirens, but there's still some work to do. Expect to do a certain amount of data cleaning, since you've generated the survey in a way that benefits the survey taker, not you. For example, Likert responses are easier to analyze when converted to an ordinal 1-5 scale. Other questions, such as "number of hours worked on a task", are easier to ask in terms of hour and minutes, but simpler to analyze as fractions of hours (1 hour 30 minutes to 1.5 hours).

Even short surveys tend to generate large amounts of data for potential analysis, but not all of this information will be useful in your eventual write-up. That's okay, but consider it a learning experience -- was it worth participants' time in asking a question (or asking it in a particular way) if you're not going to analyze the results?

During this process, try to triangulate and form a coherent narrative about the work using the interviews and the survey responses. Do the survey responses match the experiences of the interviews? Are there cases where they don't? Connecting your survey results back to the interviews enables you to generalize your interview results. This approach, for example, allowed us to say with some statistical certainty that "Creativity is valued more in game development teams," a statement that we heard in our interviews on games development and software engineering. 
 
## In Summary

Our take away is that the survey itself is only a small part of the picture. In large part, the upfront work you invest before the survey will go a long way towards deciding if you succeed or if you shipwreck. In short:

* Pay special attention to ensure that the participants' time and effort is respected. 
* Piloting is a good way to identify breakages early in the design process.
* What seems reasonable for a designer is not reasonable for the participant. Use language familiar to the participants.
* Surveys shouldn't be a standalone instrument; use them as a triangulation method and combine them with other techniques, such as interviews. This gives you both the breadth and depth to report your research in a compelling way.

## Acknowledgements

This material is based in part upon work supported by the National Science Foundation under grant
number 1217700.

## References

* Barik, T., Everett, M., Cardona-Rivera, R. E., Roberts, D. L., & Gehringer, E. F. (2013, October). A community college blended learning classroom experience through Artificial Intelligence in Games. In Frontiers in Education Conference, 2013 IEEE (pp. 1525-1531). IEEE.
* Litwin, Mark S. How to assess and interpret survey psychometrics. Vol. 8. Sage, 2003.
* Murphy-Hill, Emerson, Thomas Zimmermann, and Nachiappan Nagappan. "Cowboys, ankle sprains, and keepers of quality: how is video game development different from software development?." Proceedings of the 36th International Conference on Software Engineering. ACM, 2014.
* Lutters, W. G., & Seaman, C. B. (2007). Revealing actual documentation usage in software maintenance through war stories. Information and Software Technology, 49(6), 576–587.
* Witschey, J., Zielinska, O., Welk, A., Murphy-Hill, E., Mayhorn, C., & Zimmermann, T. (2015, August). Quantifying Developers’ Adoption of Security Tools. In ESEC/FSE (Vol. 15).
