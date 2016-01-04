# Visualize often and double check

Stephan Diehl, University of Trier, diehl@uni-trier.de

Visualization is a powerful tool.  It can play a crucial role when it comes to generating hypotheses or presenting results. Visualization should become an integral part of your analysis process. You can use it to clean the data before the actual analysis. During the analysis it can help you to see the unexpected and to generate hypotheses for further analysis. Finally, you can combine different kinds of visualizations to tell a story about your data and present your findings to others.

## Leveraging Visualizations: An Example with Software Repository Histories

Software repositories, or in more technical terms source control management (SCM) systems, such as CVS, SVN, Git, or TFS, contain historical information in terms of different versions,or revisions, of a software system. Data extracted from software repositories may be problematic for various reasons, e.g. there may be developers who regularly accessess most of the code or there may be overly large transactions. These developers may turn out as bots and the large transactions results of merging branches. These problems show up as outliers in simple visualizations like histograms or matrix visualizations of the raw data, here the transactions. Depending on what your goals are, the corresponding transactions could be removed or handled separately.

Once, you have the data cleaned you can proceed with more advanced analyses. For example, you could apply sequence rule mining. Unfortunately, you might get thousands of rules and might ask yourself, if there are common patterns or outliers among these rules. To detect these you can exploit that rules often have common prefixes and visualize the rules as a decision tree. Very likely, you will detect that the tree is extremely flat and, depending on how you draw it, that it will not fit on the screen. So you try another standard visualization technique: Parallel Coordinates. Now the data fits on the screen and based on my experience, chances are good that you might actually detect patterns and outliers. Assume, that you found the pattern that files in directory A are typically changed before files in directory B. As I said before, Parallel Coordinates can fit all or at least many rules on the screen. Figure 1 shows a Parallel Coordinates visualization of sequence rules mined for the _/base_ directory of Mozilla Firefox. In this figure the file  _browser.dtd_ is highlighted as an interesting case. Typically, after a change to _browser.js_ or _browser.css_ the file _browser.dtd_ is changed and then the file _brother.xul_.

![Parallel Coordinates Visualization of Mozilla Firefox with highlighted outlier](https://cloud.githubusercontent.com/assets/6698605/12087651/fde4ec8a-b2d4-11e5-925e-095598da1a40.png)
_Figure 1: Parallel Coordinates Visualization of Mozilla Firefox._



## How to jump the pitfalls
Seeing should not be believing. Your eyes easily trick your mind. For example, in graph visualizations aliasing effects may suggest relations where there are none. Here, aliasing means that different visual elements become indistinguishable because of lack of resolution. 

When we try to make sense of data, we have to combine various techniques. Visualization is just one of them. If we try to understand what we see, we have to understand how the visualization was produced, i.e. the extraction, analysis, statistics and visualization of the data. Without this knowledge, it is hard to trace visual phenomena back to the underlying phenomena in the data. Even worse, the extraction or analysis steps may pollute the data, e.g. discretization of continuous data or aggregation of data with different scales. To minimize the risk to draw wrong conclusions, you should check the data after each step. Simple visualizations may help here as well. Returning to our example above. In the Parallel Coordinates view, we should not only look at each rule which contributes to a pattern, but also for each rule look at least at some transactions which are instances of these rules.

In the past, I have often heard practitioners complaining about visualizing all kinds of graphs related to software. What often happens is that they use an off-the shelf graph drawing tool and are disappointed by its results or use it to show off how complex their data. Thus, choosing the right visualization technique and preparing the data in advance is important. To select the right technique you have to characterize your data. Is it categorial, numerical, relational, or multivariate? Do you have small, large or big data? Is it densely or sparsely distributed? Cognitive factors, computational, or sociological factors may be important as well. If you are not sure, ask a visualization expert. If no expert is available, you can find many resources in the [InfoVis-Wiki](http://www.infovis-wiki.net/).

Scalability is often an issue. Graphs are typically drawn as node-link diagrams. While many graph drawing approaches yield just hairballs for large graphs, some approaches (e.g. parallel edge splatting) may produce meaningful patterns. In any case, if the visualization does not scale, you can try to reduce the amount of data produced in the previous steps, e.g. by aggregation or filtering.  

Donald Knuth once wrote "Beware of bugs in the above code; I have only proved it correct, not tried it." I think that many papers in software engineering have similar caveats: "Beware of wrong claims in the above analysis; I have only mined the data, but not visualized it." or vice versa "Beware of misinterpretations of the above visualization; I have only explored the data, but not done a proper analysis." 


