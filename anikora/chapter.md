P<span id="_Ref304222561" class="anchor"></span>ractical Data Mining for
More Effective Assurance

Allen Nikora, Jet Propulsion Laboratory, California Institute of
Technology

Introduction
============

In recent years, increasing effort has been devoted to using data mining
techniques to improve our understanding of why systems misbehave and
what can be done to reduce the number of underlying defects and mitigate
the effects of the ones remaining. The combination of increasingly
capable processing hardware, substantial advances in data mining
techniques, and tools implementing these techniques have made it
feasible to use include data mining as an assurance support capability
in real software and system development efforts.

Goal
====

We have been investigating how data mining can be most effectively added
to the set of tools and skills used by software assurance engineers
(SAEs) to perform their everyday tasks. From our perspective, the
primary responsibility of an assurance organization is to provide
independent, relevant, and timely analyses based on credentialed
information that system developers can use to increase the confidence of
the quality-related decisions they make over the development life cycle.
As the volume of artifacts that SAEs analyzes increases and as the
systems under development become larger and more complex, there is more
of a need to provide automated analysis support. Data mining techniques
are among those being considered to help SAEs perform their tasks more
effectively.

Data
====

SAEs analyze a large variety of artifacts in performing their tasks,
such as requirements specifications, architectural designs, and
management plans. SAEs also devote significant effort to analyzing
anomaly reports during system development and fielded deployment. We
have focused on applying data mining to the analysis of anomaly reports
for the following reasons:

-   Anomaly reports report unexpected events and the actions taken, if
    any, to repair the system and prevent future occurrences. They have
    the potential to form the basis of a knowledge repository that
    current and future development efforts as well as organizational
    management may query to learn how to better manage systems’ fault
    content and mitigate the effects of failures they may cause. By
    comparison, other types of artifacts do not provide this immediacy
    to system failures or other unanticipated events.

-   Development organizations maintain large volumes of anomaly reports
    from fielded systems, systems currently in development, and systems
    retired from operation. The volume of anomaly reports is large
    enough (e.g., tens to hundreds of thousands in the organizations
    we’ve worked with) that data mining techniques can be applied with
    minimal concern of having sample sizes that are too small for
    meaningful results.

For our purposes, the most useful information recorded on anomaly
reports are the natural-language descriptions of 1) the anomalous
behavior that occurred, 2) the investigative activity to determine the
nature of the anomaly, and 3) any corrective action that was taken
(e.g., repair the system, modify the operational procedures, train the
operators). Analysis of this information can help identify potentially
problematic areas to which future development efforts and the
development organization in general should pay attention. For example,
more event timing failures may be observed for command handling systems
than for other systems (e.g., attitude control). Additional analysis can
identify development or management practices that will help reduce the
number of these types of defects (e.g., different architectural choices,
application of additional/different defect identification techniques
earlier in system development). Although anomaly reports record other
information, such as multiple-choice codes indicating the type of defect
repaired, we have found that 1) the natural-language information
provides a more detailed description of the anomalous event, and 2) the
other information may not be as accurate as the natural-language
descriptions: it is often set to a default value when a new anomaly
report is created and is not consistently set to reflect the most
appropriate value as the report moves through the disposition cycle.

Experience
==========

We are investigating effective ways of combining machine learning, topic
modeling \[1,2\], and search engines such as Lucene \[3\] into a
capability that can support SAEs in performing their tasks and infusing
that capability into the SAEs’ work environment. We are currently
interested in assisting SAEs in reviewing the analysis and dispositions
of anomaly reports created during system testing and fielded operations.
As anomaly reports are generated, SAEs often start their analysis by
categorizing them – for example, SAEs and SA organizations are often
interested in the lifecycle phase during which underlying defect(s) was
inserted, whether the anomaly involves defective software, whether the
anomaly was caused by a test or operator error, or whether the
underlying defect(s) is complex or simple \[4\]. SA organizations are
interested in trends in the number and types of anomalies that occur
within a system development effort, or over a number of efforts. Changes
in these quantities will make it easier to identify inadequate technical
approaches or management practices and recommend corrective actions.
Because of the large volume of anomaly reports generated for many
development efforts, it is nearly always impractical for SAEs to
completely review all anomaly reports in detail, and they resort to
sampling only a subset of the anomaly reports. We are working to make it
possible for SAEs to review a larger subset, or even the complete set,
of anomaly reports for the missions they support in greater detail than
what they can accomplish now.

Of course, it is unrealistic to expect that all, or even a large
minority, of an SA organization’s SAEs will become proficient in the
relevant data-mining techniques. Experience with infusing other
techniques, such as software reliability modeling, indicates that a more
effective approach is to train or acquire a small set of individuals who
will be responsible for performing the specialized computations for the
entire SA organization, and make the computational results available to
the SAEs in a form that they and the development efforts they support
will understand and find useful.

Acquiring or training a small number of individuals in the relevant
techniques is by far the easier part of an infusion effort. Once the
analysts have acquired the required knowledge, it is a comparatively
straightforward matter for them to develop models of the type that SAEs
tell them will provide useful support for their tasks. The task of
identifying the analyses that SAEs and the efforts they support will
find useful is the more challenging aspect of an infusion effort. The
analysts who will perform the specialized modeling computations must be
sufficiently familiar with the goals and responsibilities of the SAEs in
order to have meaningful discussions with the SAEs about the ways in
which the analysts’ models relate to what the SAEs need to produce. The
SAEs must also have a sufficiently clear idea of the goals of their work
and the value of that work to the development efforts they support to
communicate them clearly to the data-mining analysts so that the
analysts can develop appropriate models. Although a detailed discussion
of this last point is beyond the scope of this article, readers are
referred to \[5\] for one perspective on this important topic.

This is another reason we believe that focusing on analyzing anomalies
is a good starting point for a data-mining infusion effort. In addition
to the points made in paragraph 3, the goals and value of analyzing
anomalies are more readily apparent than some of the other activities
undertaken by SAEs (e.g., process compliance assessments). In our
discussions with SA organizations to date, we have established two
higher-level goals shared by the SAEs:

-   Identify technical or managerial difficulties specific to an
    individual development effort. Better understanding the types of
    defects introduced into a system during its development, when they
    are introduced, and how many are introduced can help us achieve
    this goal.

-   Identify organizational deficiencies in technical expertise and
    managerial practice. Identifying trends in the numbers and types of
    introduced defects are changing during a development effort and over
    multiple efforts, and the direction and rate of change for those
    trends supports achieving this goal.

Analysis of organizational anomaly reporting capabilities and discussion
of those capabilities with the SAEs revealed more detailed descriptions
of functionality that the SAEs felt would help them be more effective in
analyzing anomaly reports. One of the most important of these was the
ability to perform more complex and detailed queries than is possible
with the web interfaces to existing anomaly report systems. This guides
our infusion path, as we describe below.

Previous experience with infusing new techniques into a work environment
strongly suggests that introducing all of the new capabilities at once
does not work well. There is a greater chance that the recipients of the
new techniques will be overwhelmed by feeling the need to learn all of
the new techniques at once, leading to frustration with the new
technology and abandoning it before they have had a chance to benefit
from its use. We are conducting our infusion in a phased manner to
improve the chances of successful adoption. A phased approach 1) allows
the SAEs to gain expertise with the techniques as they are introduced
into the SAEs’ work environment, and 2) gives the SAEs more opportunity
to provide feedback on the value of the capabilities infused and
identify additional capabilities that would be useful. The phasing is
described below.

-   Phase 1: The first capability we are infusing is an advanced
    querying capability. As mentioned above, our discussions with the
    SAEs indicated that they would like to be able to perform more
    complex and detailed queries than is currently possible with the
    existing interfaces to the anomaly reporting systems. This addresses
    an immediate need of the SAEs, introduces technology with which they
    are already familiar from other domains (e.g., conducting searches
    on web sites such as Google) and prepares them for capabilities that
    will be introduced in later phases.

-   Phase 2: The next capability to add is the ability for SAEs to
    identify themes and topics for a set of anomaly reports in addition
    to those that are already explicitly recorded on an anomaly report.
    This allows SAEs and SA organizations to enhance their ability to
    identify trends in selected types of anomalies, thereby improving
    their ability to identify technical and management deficiencies at
    the project and institutional levels. We are doing this by creating
    topic models from the set of anomaly reports at the level of an
    individual project as well as at the institutional level. We analyze
    the most frequently occurring topics created by the topic models to
    develop meaningful topic labels, and add those labels to the fields
    that the SAEs can query using the previously introduced advanced
    search capability. This phase of infusion can require significant
    amount of computation time, but this is not visible to the SAEs.
    Some effort will be incurred by the infusers to interpret the topic
    models and produce meaningful topic labels – a small amount of
    effort on the part of the SAEs may be required to help the infusers
    understand topic areas for which they have questions.

-   Phase 3: Machine learning is the last capability to be added to the
    SAEs’ work environment. During this infusion phase, the infusers
    work with the SAEs and SA organizations to identify those categories
    into which they wish to group anomalies but are unable to do so
    at present. The anomalies then develop learning models that will
    perform these categorizations. During this phase, more effort is
    required by the infusers to manually read anomaly reports to develop
    training and test data from which learning models can be built
    and validated. SAE involvement will be required to answer questions
    about reports the analysts do not understand or are uncertain about.
    Once well-performing learning models have been developed, the
    learning models are applied to the larger set of anomalies that the
    SAEs want to categorize. The classifications developed by those
    models are added to the fields that the SAEs can query using the
    previously introduced advanced search capability.

Our experience indicates that performing the infusion in this manner
increases the likelihood that the SAEs will gain a greater understanding
and acceptance of the new capabilities. The techniques are introduced as
a tool and data they understand (i.e., a query mechanism for data having
multiple-valued and free-form fields). The additional effort required by
the SAEs is intended to be minimal, and is limited to helping the
infusers understand the types of results they require rather than
playing a leading role in developing the learning and topic models
creating the additional data.

Acknowledgements
================

The work described in this paper was carried out at the Jet Propulsion
Laboratory, California Institute of Technology. Portions of the work
were sponsored by the National Aeronautics and Space Administration’s
Office of Safety and Mission Assurance Software Assurance Research
Program, and was managed locally by JPL’s Assurance Technology Program
Office. The remainder of the work was supported by JPL’s Office of the
Management System.

References
==========

1.  <span id="_Ref304222208" class="anchor"><span id="_Ref304121956" class="anchor"></span></span>Hornik, Kurt, and Bettina Grün. "topicmodels: An R package for fitting topic models." *Journal of Statistical Software* 40.13 (2011): 1-30.
    =========================================================================================================================================================================================================================================

2.  Feinerer, Ingo. "Introduction to the tm Package Text Mining in R." \[Feinerer - 2013-12-01\]*.* [*http://www.dainf.ct.utfpr.edu.br/\~kaestner/Mineracao/RDataMining/tm.pdf*](http://www.dainf.ct.utfpr.edu.br/~kaestner/Mineracao/RDataMining/tm.pdf) (2014). Accessed 09-18-2015.
    ==================================================================================================================================================================================================================================================================================

3.  “Welcome to Apache Lucene,”, https://lucene.apache.org, accessed 09-17-2015.
    ============================================================================

4.  Grottke, M., Nikora, A. P., & Trivedi, K. S. (2010, June). An empirical investigation of fault types in space mission system software. In *Dependable Systems and Networks (DSN), 2010 IEEE/IFIP International Conference on* (pp. 447-456). IEEE.
    ==================================================================================================================================================================================================================================================

5.  Port, D., & Wilf, J. (2011, January). A Study on the Perceived Value of Software Quality Assurance at JPL. In *System Sciences (HICSS), 2011 44th Hawaii International Conference on* (pp. 1-10). IEEE.
    =======================================================================================================================================================================================================


