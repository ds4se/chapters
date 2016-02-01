#Evidence-Based Decision Making

##What’s Evidence?
We all make rational decisions that are based upon evidence don’t we? After all, the last time we ate a pepperoni pizza for supper we had bad dreams, so that’s clearly good evidence that in future we should avoid eating pepperoni after 6pm!  Except of course, that it obviously isn’t. What else did we eat that evening, and did the dreams occur because of something entirely different? Yet, in everyday lifemuch of our ‘evidence’ is rather like that, anecdotal in nature, far from objective, and likely to be rather selective. 

That doesn’t matter too much when deciding which pizza to order, since that sort ofdecision is not one that needs to be objective, and there will be many other factors that will influence it. However, if we are planning to run the local half-marathon in a month’s time, perhaps we need some sound nutritional information so that we can develop the necessary stamina and develop our training plan. 

So when the stakes get higher, for both personal and professional decisions, then wemay (should) seek out good quality evidence that can be used to help make achoice. The evidence may take many forms, but usually we will want to find the best and most reliable sources wherever possible, and prefer evidence that is based upon objective measurements rather than ‘gut feel’. 

##What does data from empirical studies look like?

When we need information about physical properties (weight, energy consumption, brightness of illumination, etc.) to help with a decision, then taking a singlemeasurement will usually be sufficient. However when our decisions relate to information about how humans behave and react, as occurs in clinical medicine, education, psychology, as well as software engineering, then we need rather more than individual measurements and have to turn to empirical studies. 

Why is this so? Well, experimental studies (trials) in these subjects make extensive use of human participants. And in such studies, we can expect to find quite a wide spread of values in the results obtained when measuring the effect of some ‘intervention’, even when a study is performed rigorously. This ‘spread’ largely stems from the natural variation that occurs between humans, whether it be physiological (affecting clinical studies) or differences of experience and ability (affecting computing studies). Because of this, it is necessary to collect measurements from many people. In contrast, for experiments in the natural sciences, if we repeat our measurements, any variation in the results is usually small, and can be attributed to measurement errors. 

This variation is often illustrated by the use of box plots for reporting the outcomes from a study that involves humans. A box plot ‘groups’ the results in quartiles, eachcontaining 25% of the values and then plots these to show how the data is distributed. The range covered by the middle 50% of values is shown as a ‘box’, and the outer ‘quartiles’ as long lines. Within the box, a line indicates the value of the  median (the middle value). Figure 1 shows a simple example, where the vertical axis measures the outcome variable (in this case time) and there are separate plots for the results obtained with and without the ‘intervention’ being studied. (The width of the boxes is arbitrary.) 

![Figure 1](https://github.com/ds4se/chapters/blob/master/budgen/Fig1-Boxplot.pdf)

As we can see, the participants allocated to the group who were using theintervention (a software tool) mostly took a shorter time to perform their task than those in the ‘control’ group, although a few did take longer. So the box plot showing  the time taken when using the tool has a wider spread of values, and is also rather skewed. 

Box plots provide a useful visualisation of how the results may vary across the different participants. However, it is still necessary to employ statistical tests todetermine whether or not any differences between the two datasets is meaningful, or could simply have occurred randomly. 

As well as this naturally-occurring variability, there may also be some possible experimental errors that might bias the results of a study. So we can see that relyingupon the results of a single trial of an intervention in order to make decisions may be somewhat risky. This however was how medicine was often practised in the past, with doctors making clinical decisions about a patient’s treatment that were based on the results of those trials that they were aware of, or that were recommended by experts as being most appropriate. Unfortunately though, expert judgement is itself an unreliable way of identifying relevant evidence, although it may be useful when interpreting it. Experts will have opinions, which can bias their selections. 

##The Evidence-Based Paradigm and Systematic Reviews
What is now considered to be the ‘model’ for evidence-based decision-making first became established in clinical medicine. Much of the stimulus for this came from the work of Archie Cochrane (1909-1988) who was a pioneer in seeking ways todetermine the best evidence about treatments. He was highly critical of the lack of sound evidence for many commonly used medical interventions and particularly 
encouraged the use of greater rigour in clinical trials (“randomize till it hurts”) to reduce bias. In honour of this, the not-for-profit organisation that now oversees the clinical review process was named after him (the Cochrane Collaboration, www.cochrane.org). 

A key step in developing an evidence-based approach was realising that aggregatingthe results from a set of studies could help reduce the effects of both naturalvariability and also of any bias that might occur in individual studies. But to be really effective, this process of aggregation needs to be performed in a rigorous andsystematic way. At this point, we need to shift from the medical past to the software engineering present and discuss what we do in computing. Before doing so though, we should note that should you have to consult your doctor, it is highly likely that he or she will consult knowledge derived through this process of aggregation. 

For computing, the evidence-based process used to derive sound and unbiased evidence from empirical studies consists of five steps (Kitchenham et al., 2004). 

1. Convert a need for information about some intervention (typically, a softwareengineering technique such as pair programming) into an answerablequestion. This helps determine which studies are going to be of use. 
2. Track down the best evidence relating to the question in a systematic, objective and unbiased way. This might be by using specialist search engines such as IEEExplore that search through publishers’ databases to search for papers reporting the outcomes of relevant studies. 
3. Critically appraise the evidence for validity, impact and applicability (how useful it is). This commonly involves developing a checklist of factors related to quality and to the question being addressed, using this to score each study found, and then aggregating the outcomes from the studies. 
4. Integrate the critical appraisal with domain expertise about the given topic and the needs of any stakeholders. Having aggregated the data, we then seek touse it to provide guidelines about when we should use the intervention within a particular organisational structure. 
5. Evaluate the outcomes and use to improve the preceding steps. This final step is really related to how we can improve the overall process.

The first three of these steps form what we term a systematic review, while the fourth involves a process usually termed knowledge translation (KT) that is concerned with interpreting the review outcomes. A systematic review is also termed a secondary study, since it does not involve any direct activity with participants, as occurs in a primary study. A secondary study is therefore one that aggregates the results from a set of primary studies. 

A really important aspect of a systematic review is that it should be planned in advance, as it is important to avoid the risk of ‘fishing’ for useful patterns in any results. Particularly important elements to specify in advance are the search terms used for identifying relevant primary studies, and the criteria used to determine which studies should be used as inputs to the review. Because the application of these criteria does require some expertise about both the topic of the review and also theconduct of systematic reviews, it is also common to make decisions about which primary studies to include by using two analysts, carefully resolving any differences in their decisions (Kitchenham et al., 2015). It is worth noting that the ‘reductionfactor’ is often quite high, it is quite normal to begin with several thousand candidate studies, and end up using around 20-50 of these. The example in the side box 
illustrates this more fully. 

The way that the outcomes of the eventual set of primary studies is synthesised is also important, since it helps influence the quality of the eventual data from thereview as well as any decisions made using this (Cruzes & Dybå, 2011). While statistical meta-analysis is the most powerful form, this can rarely be used in computing studies due to the widely different forms of the primary studies typically found, so less powerful and more qualitative procedures usually need to be employed. 

###How far can we use the outcomes from systematic review to make decisions?
So, if your doctor can make decisions about how best to treat you using theoutcomes of a systematic review, can we make our technical decisions in the same way? In principle, the answer is yes, although in practice it is rather less clear-cut for software engineering. This is largely because the form of a clinical study usually involves making comparisons between the effects of the treatment and some placebo, and with the participants being recipients of the treatment, making it possible to use statistical meta-analysis to synthesise the outcomes. In contrast, computing studies usually have a range of forms, and the participants are often asked to perform skilled tasks within organisational contexts which may introduce many other ‘confounding factors’, and so complicate eventual synthesis. 

In a recent study we examined 216 systematic reviews, published between 2004 when the use of systematic reviews began to be adopted in software engineering and the end of 2014, to see if they contained material that might be used to support teaching of core software engineering ideas as well as to provide advice about practice. From these, we identified 59 studies that were considered to provide useful experience about such topics as cost modelling, requirements elicitation, model-driven engineering, agile methods, the needs of start-up companies, etc. (See theAppendix in (Kitchenham, Budgen & Brereton., 2015).) 

In computing, it is unusual for the adoption of a new or different technical practice (e.g. pair programming) to make a large difference when compared with the effect of using another. So none of the studies had definitive results showing that onetechnique was always better than another, although a number embodied useful experiences about the situations in which it might be appropriate to employ a particular technique. 

We should not be too surprised at this. Back in 1987 Fred Brooks Jr. explained why the nature of software made it unlikely that the ‘silver bullet’ solutions desired by managers could ever be feasible for software development activities (Brooks, 1987). 
So, when it comes to making decisions in computing, consulting the outcomes of a systematic review is unlikely to make the decision for you, but it is likely to provideyou with some important insight into what does work, when it is most likely to work,and possibly why, depending on the degree of knowledge translation provided. And knowing what factors may be important can still usefully make it possible to come to an evidence-informed decision. (Given that every patient the doctor sees has their own set of personal factors, clinical decisions are usually evidence-informed too.) 

Will things change in the future? Well, this is still early days for secondary studies,with experience from only little more than a decade of performing systematic reviews in software engineering, much of which has been a learning process. With this 
growing experience, it is likely that more and better systematic reviews will be performed. We may also expect better primary studies, performed to meet needs identified by systematic reviews. 

So, evidence-informed decision making is now increasingly possible, and is likely to become used more more widely in the future. However (the inevitable caveat), toemploy it effectively, users of evidence also need to understand how to use it and adapt it to their context. Systematic reviews are no more of a silver bullet than any other software engineering practice, but their use forms an important step towards putting software engineering education and practice on to a much sounder basis, by providing more objective knowledge about our practices

#Sidebox
##Example of a Systematic Review: Visualising Software Architecture 

To illustrate what a systematic review in software engineering might involve, this  summarises a recently published review (Shahin et al., 2014). Systematic reviews are complex procedures, so we just provide a very simple outline of what is involved, to give some idea about the nature of the process. 

The study examined how software architecture visualisation techniques were employed, and the purposes for which they were used. Like many systematic reviews in software engineering, this is partly a mapping study (identifying the scope of the primary studies, with only limited synthesis), although it does provide some analysis of the outcomes. In the rest of this box, we simply describe the first steps of the study process as the outcomes are too detailed to be easily summarised. 


**Research Questions:** There were five main questions. A good example is RQ5: “Which are the architecture visualisation techniques mostly used in industry?”. This  is a typical ‘mapping study’ question, giving limited scope for synthesis. 
**Period Covered by searches:** February 1999—July 2011. 
**Searching:** Manual + Electronic (see below).
**Electronic Search String:** (architecture OR architectural OR architecting OR structure) AND (visual OR visualize OR visualization OR visualizing OR diagram OR picture OR graphic OR graphical).
**Number of studies used for analysis:** 53 

Manual searching involved looking through the index pages of over 30 journals and conferences, while the electronic search, using seven search engines, found a  further 2,887 publications. From the initial inclusion/exclusion step based on looking  at titles and keywords they retained 300 as ‘possibles’. Looking at the abstracts of  these reduced this number to 89, but checking the references used in this set (this is  termed ‘snowballing’) identified another 14 papers not found by the searches. After  reading the 103 papers in full, they selected the final set of 53 that were used for the  analysis. 

This study used a particularly thorough approach to searching, and we should note that many studies employ electronic searching alone, or use just a modest amount of manual searching to check the reliability of the search strings. 

##Reference 
Shahin, M., Liang, P. & Babar, M. A. (2014), ‘A systematic review of software 
architecture visualization techniques’, Journal of Systems & Software 94, 161–185. 




##References

Brooks Jr., F. P. (1987), ‘No silver bullet: essences and accidents of software 
engineering’, IEEE Computer 20(4), 10–19. 

Cruzes, D. S. & Dybå, T. (2011), ‘Research synthesis in software engineering: A 
tertiary study’, Information and Software Technology 53(5), pp. 440 – 455. 

Kitchenham, B., Dybå, T. & Jørgensen, M. (2004), Evidence-based softwareengineering, in ‘Proceedings of ICSE 2004’, IEEE Computer Society Press, pp. 273–  281. 

Kitchenham, B., Budgen D. & Brereton P. (2015) ‘Evidence-Based SoftwareEngineering and Systematic Reviews’, Chapman & Hall. 
 
