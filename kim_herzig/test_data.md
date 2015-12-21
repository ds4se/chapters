# There's never enough time to do all the testing you want.
 
Software is present in nearly every aspect of our daily lives and also dominates large parts of the high-tech consumer market. Consumers love new features and new features is what makes them buy software products, while features like reliability, security, and privacy are assumed. To respond to the consumer market demand, many software producers are following a trend to shorten software release cycles. As a consequence, software developers have to produce more features in less time while maintaining or even increasing product quality.
 
## The impact of short release cycles (There's not enough time)

To enable faster and more "agile" software development, software development processes have to change. We need to cut down time required to develop, verify, and ship new features or code changes in general. In other words, we need to increase _code velocity_ by increasing the effectiveness, efficiency, and reliability of our development processes. 

Focusing on testing processes, it is important to realize that verification time is a lower bound on how fast we can ship software. However, nowadays this lower bound frequently conflicts the goal of faster release cycles. As a matter of fact, we simply cannot afford to execute all tests on all code changes anymore. Simply removing tests is easy, the challenge is to cut tests without negatively impacting product quality. 

#### Testing is more than functional correctness (all the testing you want)
 
Often, testing is associated with checking for functional correctness and unit testing. While these tests are often fast, passing or failing in seconds, large complex software systems require tests to verify system constraints such as backward compatibility, performance, security, usability and so on. These _system and integration tests_ are complex and typically time-consuming even though they relatively rarely find a bug. Nevertheless, these tests must be seen as an insurance process verifying that the software product complies with all necessary system constraints at all times (or at least at the time of release). Optimizing unit tests can be very helpful, but usually it is the system and integration testing part of verification processes than consumes most of the precious development time. 
 
## Learn from your test execution history
 
Knowing that we cannot afford to run all tests on all code changes anymore, we face a difficult task: find the best combination of tests to verify the current code change spending as little test execution time as possible. To achieve this goal, we need to think of testing as a risk management tool to minimize the risk of elapsing code defects to later stages of the development process or to even to customers. 

The basic assumption behind most test optimization and test selection approaches is that for given scenarios or context _C_, not all tests are equally well suited. Some tests are more effective than others. For example, running a test for _Internet Explorer_ on the _Windows kernel_ code base is unlikely to find new code defects. 

However, determining the effectiveness and reliability of tests and when to execute which subset is not trivial. One of the most popular metrics to determine test quality is _code coverage_. However, coverage is of very limited use in this case. First, coverage does not imply verification (especially not for system and integration tests). Second, it does not allow to assess the effectiveness and reliability of single test cases. Last but not least, collecting coverage significantly slows down test runtime which would require us to remove even more tests.
 
Instead, we want to execute only those tests that for a given code change and a given execution context _C_, e.g. branch, architecture, language, device type, has high reliability and high effectiveness. Independent from the definition of reliability and effectiveness, all tests that are not high reliable and effective should be executed less frequent or not at all. 
 
#### Test effectiveness
 
Simplistically, a test is effective if it finds defects. This does not imply that tests that find no defects should be removed completely, but we should consider them of secondary importance (see below). The beauty of this simplistic definition of test effectiveness is that we can use _historic test execution data_ to measure test effectiveness. For a given execution context _C_, we determine how often the test fail due to a code defect. For example, a test _T_ that has been executed 100 times on a given execution context _C_ and that failed 20 times due to code defects has an historic code defect probability of 0.2. To compute such historic code defect probabilities, it usually suffices to query an existing test execution database and to link test failures to issue reports and code changes, a procedure that is also commonly used to assess the quality of source code. 
Please note that coverage information is partially included in this measurement. Not covering code means not being able to fail on a code change implying an historic failure probability of 0.
 
#### Test reliability / Not every test failure points to a defect 
 
Tests are usually designed to either pass or fail and each failure should point to a code defect. In practice however, many tests tend to report so called false test alarms. These are test failures that are not due to code defects but due to test issues or infrastructure issues. Common examples are: wrong test assertions, non-deterministic (flaky)  tests, test depending on network resources that fail when network unavailable.

Test that report false test alarms regularly must be considered a serious threat to the verification and development processes. As any other test failure, false alarms trigger manual investigations that must be regarded wasted engineering time. The result of the investigation will not increase product quality but rather slowed down code velocity of the current code change under test.
 
Similar to test effectiveness, we can measure test reliability as a historic probability. Simplistically, we can count any test failure that did not lead to a code change (code defect) as false test alarm. Thus, a test _T_ that has been executed 100 times on a given execution context _C_ and that failed 10 times but did not trigger a product code change has a historic test unreliability probability of 0.1.
 
## The art of testing less
 
Combining both measurements for effectiveness and reliability (independent from their definition) allows a development team to assess the quality of individual tests and to act on it. Teams may decide to statically fix unreliable tests or to dynamically skip tests. Test that show low effectiveness and/or low reliability should be executed only where necessary and as less as possible. For more details in how to use these probabilities to design a system that dynamically determines which test to execute and which not, we refer to Herzig et al. [1].
 
#### Without sacrificing code quality
 
However, the problem is that some test might get disabled completely, either because they are too unreliable or because never found a code defect (in the last periods). To minimize the risk of elapsing severe bugs into the final product and in order to boost the confidence of development teams into the product under development, it is essential to prevent tests from being disabled completely. One possible solution is to force test executions of all or selected test based on time, e.g. once a week, or based on branches, e.g. executing all tests on the main or release branch. 
 
## Tests evolve over time
 
Any complex test infrastructure evolves over time. New tests are added while older tests might get less important or even deprecated. Maintaining tests and preventing test infrastructures from decay can grow to be a significant effort. For products with some history, some of the older tests may not be "owned" by anybody anymore or show strongly distributed ownership across multiple product teams. Such ownership can impact test effectiveness and reliability slowing down development speed [2].
Determining and monitoring new test cases being added or changes to existing tests can be very useful in assessing the healthiness of the verification process. For example, adding lots of new features to a product without experiencing an increase in new test being written might indicate a drop in quality assurance. The amount of newly introduced code and newly written or at least modified test code should be well balanced. 
 
## In Summary
 
Software testing is expensive, in terms of time and money. Emulating millions of configurations and devices requires complex test infrastructures and scenarios. This contradicts todays trend to release complex software systems in ever shorter periods of time. As a result, software testing became a bottleneck in development processes. The time spent in verification defines a lower bound on how fast they can ship software. Resolving test bottlenecks requires us to rethink development and testing processes to allow new room for newer and better tests and to regain confidence in testing. We need to accept that testing is an important part of our daily development process, but that "There's never enough time to do all the testing we want". 

[1] K. Herzig, M. Greiler, J. Czerwonka, and B. Murphy, “The Art of Testing Less without Sacrificing Quality,” in Proceedings of the 2015 International Conference on Software Engineering, 2015. 

[2] K. Herzig and N. Nagappan, “Empirically Detecting False Test Alarms Using Association Rules,” in Companion Proceedings of the 37th International Conference on Software Engineering, 2015. 
