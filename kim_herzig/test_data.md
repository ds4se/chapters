#Gotcha: Testing less without sacrificing code quality?
 
Today, we are living in a fast living, complex, highly connected society and world. And the very same observation is true for software development. The number of devices and configurations modern software systems are supposed to handle is massive, and the number is still rising every year. Additionally, modern software is supposed to be omnipresent, leading to systems that can be used as on premise products, for example: traditional Office installation on a PC, and as services: Office 365 in your browser. As consequence, today's software systems are complex as ever before. 
 
At the very same time, we want to ship as fast as possible, without compromising established and desired product quality. Releasing once a week is not the exception anymore, at least not in the consumer market. However, achieving both, high complexity and short release cycles is a challenge, especially for test and verification processes. Emulating millions of configurations requires complex test infrastructures and procedures that are expensive to run in terms of cost and time. 
 
##The impact of short release cycles

Due to its weight especially for large products, anything we can do to increase the effectiveness and efficiency of test execution has immediate effect on product development. The time spend on verification is a lower bound on how fast we can ship software. Shorter release cycles have many benefits but also force the verification process to be substantially different. The less time spent in verification shouldn't mean lower confidence in the system working as intended. To achieve this, we often can't afford executing the full complement of tests. We need to think of testing as a risk management tool: select the right tests for the right changes and we need to ensure that the test we are executing are highly effective and highly reliable. The basic assumption behind most test optimization and test selection approaches is that for given scenarios, not all tests are equally well suited. Some tests might be more effective than others might. However, deciding the effectiveness and reliability of tests and when to execute them is not trivial.
Testing more than functional correctness 
 
Often, testing is associated with checking for functional correctness. However, for large complex software systems, it is also important to verify system constraints such as backward compatibility, performance, security, usability and so on. Complex systems are often developed by thousands of engineers that simultaneously apply code changes, which may interfere with each other. In such environments, testing may be seen as an insurance process verifying that the software product complies with all necessary system constraints at all times (or at least at the time of release). By nature, system and compliance tests are complex and typically time-consuming even though they relatively rarely find a bug.
Optimizing unit tests can be very helpful, but usually it is the system and integration testing part of verification processes than consumes most of the precious development time. 
 
##Which tests to run?
 
Traditionally, we use information such as code coverage to assess the quality of our tests. However, coverage is of very limited use in this case. First, coverage does not imply verification (especially not for system and integration tests). Second, it does not allow to assess the effectiveness and reliability of single test cases. Last but not least, collecting coverage significantly slows down test runtime requiring us to remove even more tests.
 
Instead, we want to execute only those tests that for a given code change and a given execution context, e.g. branch, architecture, language, device type, has high reliability and high effectiveness. Independent from the definition of reliability and effectiveness, all tests that are not high reliable and effective should be executed less frequent or not at all. 
 
##Test effectiveness
 
Simplistically, a test is effective if it finds defects. This does not imply that tests that find no defects should be removed completely, but we should consider them of secondary importance (see minimizing risk below). Defining test effectiveness this way, we can use historic test execution data to measure a tests effectiveness: for the given execution context, how often did the test fail due to a code defect? For example, a test T that has been executed 100 times on a given execution context C and that failed due to code defects 20 times has an historic code defect probability of 0.2. To compute such historic code defect probabilities, it usually suffices to query an existing test execution database and to link test failures to issue reports and code changes, a procedure that is also commonly used to assess the quality of source code. 
Please note that coverage information is partially included in this measurement. Not covering code means not being able to fail on a code change implying an historic failure probability of 0.
 
##Test reliability / Not every test failure points to a defect 
 
Tests are usually designed to either pass or fail and each failure should point to a code defect. In practice however, many tests tend to report so called false test alarms. These are test failures that do not point towards code defects but are due to test failures, e.g. incorrect assertions, or test infrastructure issues, e.g. a remote server hosting a file required to complete the test scenario. 
 
Test that report false test alarms regularly must be considered a serious threat to the verification and development processes. As any other test failure, false alarms trigger manual investigations that must be regarded wasted engineering time as the result of the investigation will not increase product quality but rather slowed down code velocity of the current code change under test.
 
Similar to test effectiveness, we can measure test reliability as a historic probability. Simplistically, we can count any test failure that did not lead to a code change (code defect) as false test alarm. Thus, a test  T that has been executed 100 times on a given execution context C and that failed 10 times but did not trigger a product code change has a historic test unreliability probability of 0.1.
 
##The art of testing less
 
Combining both measurements for effectiveness and reliability (independent from their definition) allows a development team to assess the quality of individual tests and to act on it: either by statically fixing unreliable tests or by dynamically skipping tests that seem to not fit the current execution context. Test that show low effectiveness and/or low reliability should be executed only where necessary and as less as possible. For more details in how to use these probabilities to design a system that dynamically determines which test to execute and which not, we refer to Herzig et al. [1].
 
##Without sacrificing code quality
 
However, the problem is that some test might be disabled completely, either because they are too unreliable or because never found a code defect (in the last periods). To minimize the risk of elapsing severe bugs into the final product and in order to boost the confidence of development teams into the product under development, it is essential to prevent tests from being disabled completely. One possible solution is to force test executions of all or selected test based on time, e.g. once a week, or based on branches, e.g. trunk executes all tests. 
 
##Tests evolve over time
 
Any complex test infrastructure evolves over time. New test are added, older tests might get less important or even deprecated. Maintaining tests and preventing test infrastructures from decay can grow to be a significant effort. For products with some history, some of the older tests may not be "owned" by anybody anymore or show strongly distributed ownership across multiple product teams. Such ownership can impact test effectiveness and reliability slowing down development speed.
Determining and monitoring new test cases being added or changes to existing tests can be very useful in assessing the healthiness of the verification process. For example, adding lots of new features to a product without experiencing an increase in new test being written might indicate a drop in quality assurance: the amount of newly introduced code and newly written or at least modified test code should be well balanced. 
 
##In Summary
 
Software testing is expensive, in terms of time and money. Emulating millions of configurations and devices requires complex test infrastructures and scenarios. This contradicts todays trend to release complex software systems in ever shorter periods of time. As a result, software testing became bottlenecks in development processes: time spend in verification defines a lower bound on how fast they can ship software. Resolving test bottlenecks requires us to rethink development and testing processes to allow new room for newer and better tests and to regain confidence in testing. We need to accept that testing is an important part of our daily development process. The ultimate goal is to change the perception of failing tests. Instead of considering a failing tests as "a sign of more work ahead" engineers should shout: "Gotcha! Running this test saved our release."

[1] K. Herzig, M. Greiler, J. Czerwonka, and B. Murphy, “The Art of Testing Less without Sacrificing Quality,” in Proceedings of the 2015 International Conference on Software Engineering, 2015. 
