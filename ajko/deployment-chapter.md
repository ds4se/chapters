# The World is your Test Suite

The first application I ever wrote was a complete and utter failure.

I was an eager eighth grader, full of wonder and excitement about the infinite possibilities in code, with an insatiable desire to build, build, build. I'd made plenty of little games and widgets for myself, but now was my chance to create something for someone else: my friend and I were making a game and he needed a tool to create pixel art for it. We had no money for fancy Adobe licenses, and so I decided to make a tool.

In designing the app, I made every imaginable mistake. I didn't talk to him about requirements. I didn't test on his computer before sending the finished app. I certainly didn't conduct any usability tests, performance tests, or acceptance tests. The app I ended up shipping was a pure expression of what _I_ wanted to _build_, not what _he_ needed to be creative or productive. As a result, it was buggy, slow, confusing, and useless, and blinded by my joy of coding, I had no clue.

Now, ideally my "customer" would have reported any of these problems to me right away, and I would have learned some tough lessons about software engineering. But this customer was my best friend, and also a very nice guy. He wasn't about to trash all of my hard work. Instead, he suffered in silence. He struggled to install, struggled to use, and worst of all struggled to create. He produced some amazing art a few weeks after I gave him the app, but it was only after a few months of progress on our game that I learned he hadn't used my app for _a single asset_, preferring instead to suffer through Microsoft Paint. My app was too buggy, too slow, and too confusing to be useful. I was devasted.

## Watch the World and Learn 

Why didn't I know it was such a complete failure? Because I wasn't looking. I'd ignored the ultimate test suite: my customer. I'd learned that the only way to really know whether software requirements are right is by watching how it executes in the world.

Of course, this is easier said than done. That's because the (ideally) massive numbers of people executing your software is not easily observable. Moreover, each software quality you might want to monitor (performance, functional correctness, usability) requires entirely different methods of observation and analysis. Let's talk about some of the most important qualities to monitor and how to monitor them.

## Crashes, Hangs and Bluescreens

These are some of the easiest failures to detect because they are overt and unambiguous. Microsoft was one of the first organizations to do this comprehensively, building what eventually became known as _Windows Error Reporting_ (Glerum et al. 2009). It turns out that actually capturing these errors at scale and mining them for repeating, reproducible failures is quite complex, requiring classification, progressive data collection, and many statistical techniques to extract signal from noise. In fact, Microsoft has a dedicated team of data scientists and engineers whose sole job is to manage the error reporting infrastructure, monitor and triage incoming errors, and use trends in errors to make decisions about improvements to future releases and release processes. This is now standard practice in most companies and organizations, including other big software companies (Google, Apple, IBM, etc.), as well as open source projects (e.g., Mozilla). In fact, many application development platforms now include this as a standard operating system feature.

## The Need for Speed

Performance, like crashes, kernal panics, and hangs, is easily observable in software, but a bit trickier to characterize as good or bad. How slow is too slow? How bad is it if something is slow occasionally? You'll have to define acceptable thresholds for different use cases to be able to identify problems automatically.

It's also hard to monitor performance without actually harming performance. Many tools and services (for example, [New Relic](http://newrelic.com)) are getting better at reducing this overhead and offering real time data about performance problems through sampling. These technologies are increasingly based on a software engineering research of performance monitoring out of universities (e.g., Elbaum and Diep 2005; Bergel et al. 2012).

## Protecting Data and Identity

Monitoring for data breaches, identity theft, and other security and privacy concerns are incredibly important parts of running a service, but also very challenging. This is partly because the tools for doing this monitoring are not yet well integrated, requiring each team to develop its own practices and monitoring infrastructure. But it's also because protecting data and identity is more than just detecting and blocking malicious payloads, but also about recovering from ones that get through, developing reliable data streams about application network activity, monitoring for anomolies and trends in those streams, and developing practices for tracking and responding to warnings that your monitoring system might generate. Researchers are still actively inventing more scalable, usable, and deployable techniques for all of these activities, but it may be a while before they're viable for production systems (Patcha & Park 2007).

## Discovering Confusion and Missing Requirements

Usability problems and missing features, unlike some of the problems above, are even harder to detect or observe, because the only true indicator that something is hard to use is in a user's mind. That said, there are a couple of approaches to detecting the _possibility_ of usability problems.

One is by monitoring application usage. Assuming your users will tolerate being watched, there are many techniques for automatically instrumenting applications for user interaction events, for mining these events for problematic patterns, and for browsing and analyzing these patterns for more subjective issues (Ivory and Hearst 2001). Modern tools and services like [Intercom](http://intercom.io) and [Customer.io](http://customer.io) make it easier to capture, store, and analyze this usage data, although they still require you to have some upfront intuition about what to monitor. There are some techniques from research that automatically analyze undo events as reliable indicators of usability problems (Akers et al. 2009).

The other approach to finding usability problems is to make it easier for your users to report problems directly to you. Services like [AnswerDash](http://answerdash.com) impose a little widget on every page in a web application, making it easy for users to submit questions and find answers to previously asked questions. This generates invaluable data about the features and use cases that are leading to the most confusion, which types of users are having this confusion, and where in an application the confusion is happening most frequently. You can get similar data from feedback forms, support tickets, support forums, and even product reviews, but these data sources can often be messy to analyze and heavily biased toward only the most vocal users. (Full disclosure, I co-founded AnswerDash, but that's only one of the many reasons I think it's awesome).

## Monitoring is Mandatory

Now, I doubt I would have used any of these monitoring techniques in middle school. I would have made the same mistakes, and struggled to get the same insight. In fact, many professional software companies back in the early 90's followed few of the best practices above, and customers suffered for it. If it compiled and passed a few test cases, it was correct.

Today, however, in our interconnected automatic update app marketplace world, the only way to _truly_ know if your software meets its goals is to test it against the _real_ world, not just the one coarsely modeled by tests. Set up your data streams, find the right tools to analyze them, and start testing against the world!

## References

David Akers, Matthew Simpson, Robin Jeffries, and Terry Winograd (2009). Undo and erase events as indicators of usability problems. ACM SIGCHI Conference on Human Factors in Computing Systems.
http://doi.acm.org/10.1145/1518701.1518804

Bergel, A., Bañados, F., Robbes, R., & Binder, W. (2012). Execution profiling blueprints. Software: Practice and Experience, 42(9), 1165-1192.

Sebastian Elbaum and Madeline Diep (2005). Profiling deployed software: assessing strategies and testing opportunities. IEEE Transactions on Software Engineering, 31(4).
http://dx.doi.org/10.1109/TSE.2005.50

Kirk Glerum, Kinshuman Kinshumann, Steve Greenberg, Gabriel Aul, Vince Orgovan, Greg Nichols, David Grant, Gretchen Loihle, and Galen Hunt. 2009. Debugging in the (very) large: ten years of implementation and experience (2009). ACM SIGOPS Symposium on Operating Systems Principles.
http://doi.acm.org/10.1145/1629575.1629586

Melody Y. Ivory and Marti A. Hearst (2001). The state of the art in automating usability evaluation of user interfaces. ACM Computing Surveys, 33(4).
http://doi.acm.org/10.1145/503112.503114

Animesh Patcha and Jung-Min Park (2007). An overview of anomaly detection techniques: Existing solutions and latest technological trends. Computer Networks, 51(12)
http://dx.doi.org/10.1016/j.comnet.2007.02.001.

