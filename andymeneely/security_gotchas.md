# Security Cannot Be Measured

Which of the following is more secure: Windows, Mac OS X, or the White House?

All of them have been broken into. They all have security features. A lot of money has been spent on making them secure (some of that money better spent than others). They also serve different purposes and have different designs. So which is it? Which is more secure? Or is that a fair comparison at all?

In software security assessment, we cannot make empirically-sound statements about the overall security of a product. We can understand various properties of the system that can influence security, but we cannot make absolute claims. In particular, when analyzing security data, we need to be aware of a lot of practical and conceptual concerns. Consider the following "Gotchas".

# Gotcha #1: Security is Negatively Defined

The security of a software system is typically defined as the combination of three properties: Confidentiality, Integrity, and Availability. Confidentiality is the ability for system to keep sensitive information from leaking out. Integrity is the ability of the system to prevent unauthorized tampering of data or functionality. Availability is the ability of the system to continually be accessible to the user.

Each of those properties, however, are defined according to what people should *not* be able to do. An attacker should *not* be able to steal passwords. An attacker should *not* be able execute arbitrary code.

From a requirements engineering point of view, security is considered to be a **constraint** on the entire system that does not trace to any one feature. Instead, security applies to all features.

Security is not alone in being negatively-defined, however. Other negatively-defined non-functional requirements include safety and resilience as they are properties that the system must demonstrate in extreme circumstances.

Furthermore, security is an **emergent** property of software. An emergent property is one that builds upon many properties of the system and can be brought down by a single flaw. Consider pitching a tent in the rain. The "staying dry" property is not a single feature of the tent, it's a combination of many different factors: the tent must be leak-free, deployed properly, the flap closed, and not be placed in a lake. Security must be achieved through a wide variety of means and can be compromised by one problem.

For all negatively-defined properties, developers cannot simply execute a checklist to maintain those properties. Improving security does not mean “do A, B, and C”, instead it means “nowhere should X, Y, Z or anything like them be allowed”.

# Gotcha #2: Having Vulnerabilities Is Actually Normal

You might be tempted to assume that admitting your precious software product has vulnerabilities is a liability to your everyday business. The company brand is at stake! Why let a few wrong lines of code make such a big deal?

However, companies have matured beyond the non-admitting approach to practice Responsible Disclosure, that is, disclosing the details about a vulnerability after it is has been fixed. Responsible Disclosure has led to a variety of benefits, such as the current cultural shift to the assumption that having vulnerabilities is normal. In fact, the practice of Responsible Disclosure has been a significant driver in modern vulnerability research as developers can learn from each other's mistakes.

Thus, many products may have only a recent track record of having vulnerabilities. Does that mean they were secure before? No. Nobody was keeping track, and the fact that vulnerabilities are now being cataloged is actually a sign of maturity.

# Gotcha #3: "More Vulnerabilities" Does Not Always Mean "Less Secure"

In the age of Responsible Disclosure, vulnerabilities have become a common occurrence. The National Vulnerability Database has recorded thousands

Given that, one may be tempted to claim that one product is more secure when it had fewer vulnerabilities reported. Even year-over-year, researchers and practitioners alike have reported that "this year we had fewer vulnerabilities".

At the very least, severity must be taken into account (although that measurement is also fraught with problems). Suppose we decided to catalog all security vulnerabilities on your house, and do a big security audit: we change to pick-resistant locks and add locks to two of the windows, totaling to three "vulnerabilities" fixed. This month, we left the door open for a week. Which month was less secure?

As a case study, the US National Vulnerability Database has increased in size dramatically over the past several years. If one were to strictly adhere to the assumption of metrics such as "defect density", one might assume that this influx of vulnerabilities was due to a widespread security problem. On the contrary, many developers are becoming more aware of their security problems and are tracking the fixes.

Furthermore, vulnerability records are interesting data sets today for the following reasons:
  *	Record-keeping practices have improved with the evolution of distributed version control systems, code review systems, and collaboration tools that maintain artifact traceability
  * Discovery of a single vulnerability often leads to the discovery of other, similar vulnerabilities since developers are learning security principles as they fix vulnerabilities.
  * Software projects are improving their responsible disclosure practices, leading to an increase in interest from the security enthusiast community
  * Due to the severe nature of vulnerabilities, prominent companies such as Google and Microsoft offer bounties in the thousands of US dollars for information leading to a vulnerability. Google currently pays out those bounties on a nearly monthly basis.
  * The availability and quality of comprehensive vulnerability taxonomies, such as the Common Weakness Enumeration have improved recently.
  * Improved security awareness among developers has led to developers retroactively labeling traditional defects as vulnerabilities.

# Gotcha #4: Design Flaws Are Not Usually Tracked

Vulnerabilities come in all sizes. A small, code-level mistake such as a format string vulnerability can be easily remedied in a single, one-line fix, for example. Lacking the ability to provide audit logs to mitigate repudiation threats, however, is a much bigger problem. Historically, most vulnerabilities reported today tend to be code-level vulnerabilities. Design flaws, security-related or not, are rarely tracked in any consistent way. These design flaws are often disguised as "new releases", "new features", or "refactoring" and are never really factored into vulnerability assessment.

# Gotcha #5: Hackers Are Innovative Too

We could also state this as "there are always more gotchas". Hackers are very innovative, have tons of time of their hands, and only need to be lucky once. Every day, new types of attacks are being formed, new vulnerabilities are being discovered, and new information is being bought and sold on the dark web.

Thus, any measurement or analysis of security that relies on a "bag of tricks" approach is doomed to fail. "Tried SQL injection? Tried cross-site scripting? Then you must be secure." This is a reactive approach that does not take into account future innovation. Hackers start with the well-known vulnerabilities, yes, but security is defined by its lack of failures - including those that have not even been conceived of.

Too often, security assessment (even security research) focuses on preventing attacks that have already happened and focus less on preventing all attacks in the future. Most security measurement tools will fail when placed under microscope of security's most unforgiving question: "how will this protect us from attacks we don't even know of yet?"

# An Unfair Question

How secure is Android? Sadly, questions like that are empirically unanswerable. The measurement of security is fraught with problems, ranging from the practical to the fundamental.

Instead of phrasing that question as an absolute, we should be discussing trust and economics. Consider these more specific questions facing software engineers and digital citizens alike:

  * Should we adopt this third-party library given its track record of security?
  * Should we add this feature knowing the potential security ramifications?
  * Should I entrust my personal data to this device?

Each of those questions have a positive outcome and a negative outcome that can be better estimated on an individual basis. Benefits and drawbacks can be weighed, and more informed decisions can be made.
