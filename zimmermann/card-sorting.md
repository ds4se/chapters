#Card-sorting: From Text To Themes 
_Thomas Zimmermann, Microsoft Research_

Suppose you just ran a survey with hundreds of responses to an open text question. You now want to make sense of the data. How can you do this in a systematic way?

I've frequently used card sorting to derive themes from text. Card sorting is widely used to create mental models and derive taxonomies from data and to deduce a higher level of abstraction and identify common themes. The idea is simple: _print text on index cards and sort them into groups_ that correspond to themes. This has several advantages compared to say annotating text in Excel. With physical cards it's easy to split and merge groups or simply just read the cards of a group. You also build up spatial memory of the groups, which helps to remember the groups. 

Over the past years I used card sorting in dozens of projects for the analysis of survey data and software artifacts. Here are two examples: 

* Andrew Begel and I used card sorting to analyze the responses to a survey question "Please list up to five questions you would like [a team of data scientists who specialize in studying how software is developed] to answer". We received 679 questions which we sorted into 12 themes such as Bug Measurements, Development Practices, and Productivity. We then distilled the responses (raw questions) into descriptive questions, which led to a final catalog of 145 questions. 

* Silvia Breu, Rahul Premraj, Jonathan Sillito, and I used card sorting to identify frequently asked questions in bug reports. We extracted 947 questions from a random sample of 600 bug reports which we then sorted into 8 themes such as Missing Information, Triaging, and Status Inquiry. For each question we had additional statistics such as when the question was asked, whether it was answered, and how long the response took. This allowed us to combine the card sort with a quantitative analysis.

There are two types of card sorts. _Open_ card sorts have no predefined groups; the groups emerge and evolve during the sorting process. _Closed_ card sort have predefined groups; they are typically used when the themes are known in advance. In some cases, _hybrid_ card sorts can work well too, you start with a representative sample of cards to identify themes and then later sort the remaining cards into those themes. Most if times I've used open card sorts.

Cart sorting has three phases: in the _preparation phase_, we create cards for each response; in the _execution phase_, cards are sorted into meaningful groups with a descriptive title; finally, in the _analysis phase_, abstract hierarchies are formed in order to deduce general categories and themes.

##Preparation phase

To create the cards I use the Mail Merge feature of Microsoft Word. The input is simply an Excel spreadsheet with one row per card and all the relevant information separated into columns (with column headers). Word allows you to customize the layout of the cards by using the Mail Merge fields.

It is important to have one thought/comment per line. For _surveys_, the best approach is to design the survey in a way that different thoughts are entered separated. For example, instead of having one textbox for all five responses, Andrew Begel and I provided one text box for each response: "Please enter your first response." TEXTBOX. "Please enter your second response." TEXTBOX. And so on. Unfortunately, it is not always possible or practical to design surveys in such a way. In that case, you might have to split responses manually (sometimes with support from your survey tool), ideally before you print your cards. For _large documents_ like web-pages, interview transcripts, or PDF files, quantitative coding tools such as Atlas.TI or QDA Miner (which has a free Lite version) can be used to extract relevant pieces of text from large documents.

On each card, I print a demographics if available and always a card identifier. The _demographics_ provide you with a better context during sorting. The _identifier_ allows you to do additional analysis later on. For example, for the card sort of bug reports questions, we had the response time for each question. With the identifier we could tie back the response time to the different themes and check for differences. I keep identifiers all the same length because it helps to enter card numbers more easily later on. Always enter card numbers in pairs: one person reads out the numbers, the other types in the numbers. Both check for errors. To combine card sort categories with the original data, I use the VLOOKUP function in Excel.

I usually prints cards 4-up on a letter page. Print the text in large font (at least 20 point); the larger the better and easier to read. After the mail merge, you can manually reduce the font size for any cards that don't fit. A trick I recently discovered is to sort the Excel sheet by response length (put longer responses in the first rows to prevent Excel from cutting off text). That way you have to go only through some cards to reduce the font size or you could split the responses into two or more sets (e.g., one set for short responses in large font, one set for long responses in smaller font).

##Execution phase

Get a large room for your card sort. Besides the cards bring pens, sticky notes, markers, envelopes, and rubber bands. Use the pens and sticky notes to create descriptive titles once you have several cards in a group. Use the markers to highlight important text, for example when the text is very long. Plan about 2 hours for a card sorting session, not more than 3 hours. longer sessions give you brain freeze. If you have a large number of cards you will need multiple sessions. Don't forget to take breaks.

The first card is the easiest one to sort. It always starts its own group. For the second card, decide if it is the same similar to the first group. If it is similar, put it in the first group, if not start a new group. Repeat for each of the following cards: decide if it fits an existing group, and if not start a new group. Keep going until you run out of cards.

Don't overthink where to put a card. If it's difficult to decide where to put a card, put it at the end of the pile and come back to it later. The groups are not fixed and can change during the course of the card sort. It is fair game to split, merge, or even resort groups. For example, when a groups gets very big, you might want to revisit the cards and see if there are important subthemes. While sorting, you might discover some cards that make no sense or are off-topic; I put those in a special Discard group.

Card sorting in teams can help you derive better themes and sort a larger number of cards. Jointly sort the first few cards with the entire team (calibration phase), then divide up the cards but still communicate while sorting. Let others know, when you start a new group. When you have ambiguous card, read the card out loud and ask others for feedback. Avoid having more than four or five people for a card sort. Too many cooks spoil the broth. Always have one team member lead the card sort.

Don't forget to take photos of your card sort. That will help you to later reconstruct the spatial layout of the cards. Photos are also great to impress friends or to explain the process in a presentation.

TODO: Add Photo from a Card Sort.

After you are done with the card sort, use the envelopes and rubber bands to store the cards. I put the sticky note to the side of the top card and then pile up the groups. Have the sticky note stick out a little from the top card. That helps you later to separate the pile of cards into the individual groups.

##Analysis phase

After you are done with the card sort, it's a good idea to go through the cards one more time to check for consistency within the groups. It's still ok to move cards around, though at some point you want to freeze the groups.

As the last step, take a look at the groups and see if you can deduce more general categories and themes, especially if you have many groups. In the card sort of data science questions, Andrew Begel and I ended up with 60 groups… too many to make sense of the data! We then used affinity diagrams to find general themes. The result was a hierarchy of themes and categories. Each group from the card sort was a category. We then combined categories into themes. For example, the groups "Productivity Measures", "Measuring the Individual", "Impact on Productivity from Build and Process Tools", and "Tradeoffs between Vendors and Full Time Employees" all became part of the theme "Productivity".


That's all you need to get started with your first card sort. Good luck!

## References

1. Andrew Begel, Thomas Zimmermann: Analyze this! 145 questions for data scientists in software engineering. ICSE 2014: 12-23

2. Silvia Breu, Rahul Premraj, Jonathan Sillito, Thomas Zimmermann: Information needs in bug reports: improving cooperation between developers and users. CSCW 2010: 301-310

3. Mail Merge for Email: http://office.microsoft.com/en-us/word-help/use-word-mail-merge-for-email-HA102809788.aspx

