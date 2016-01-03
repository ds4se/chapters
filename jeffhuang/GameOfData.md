# Gameplay Data Plays Nicer When Divided Into Cohorts

## Cohort Analysis as a Tool for Gameplay Data

Gameplay data is the captured logs that the video games generate, and is often used to help with matchmaking or provide players a way to replay their matches. As a software analytics tool, gameplay data provides a broad naturalistic dataset which can be useful for learning about players. However, game histories and replays while precise and correct have a lot of inherent noise. This noise comes from players switching accounts, disconnection issues and environmental changes, players not playing to win, and so forth. It is difficult to draw any conclusions from looking at the mix of vastly different players. Additionally, the sheer amount of data collected makes simple descriptive analytics not terribly useful, and because factors are not manipulated as experiments during the game, findings show correlations rather than explain causal effects.

Cohort analysis turns raw player data logs into groups of players, "cohorts". By having groups include enough players, the variation that occurs during a single player's progression with a game will average out among other players. The assumption is that when players are intentionally divided by a specific game condition, other unrelated conditions will be equally represented in each cohort so they will not affect the analyses.

## Play to Lose

During an internship at Microsoft Research, I worked with a dataset comprising the history of all matches from the first-person shooter game Halo Reach. The team I belonged to was particularly interested in learning what types of players were likely to stick around to play for longer, also known as retention. So one of the things I investigated was what happened to a player in their first 100 matches, but each player's history was completely different from another's. Looking at any individual player revealed no clues about retention because the players were so diverse in what they did. Lumping all the players together didn't do much either besides producing smooth-looking graphs and uninteresting averages.

But when I grouped the players by skill level at different points in time, I noticed an interesting pattern of how their skill levels changed in the first 100 matches. In every group where players were declining in skill (unbeknownst to themselves), the average player in each group was playing about 15% more matches than the players who were improving. This was the opposite of what our team expected, which was that players would enjoy improving and play more if they got better. It appeared that for many players, improvement was not a relevant condition for them to stick with the game, and this discovery opened up new directions to pursue.

## Forming Cohorts

Cohorts can be formed from any condition, but a few conditions especially make sense for grouping players. A common one used by many games is grouping players who started playing during the same week. So rather than examining all data within a particular calendar date range, a start-based cohort would separate players by when they began playing the game. This approach removes confounding factors due to changes in the game itself (e.g. patches or server problems), changes in the game's culture and overall player base (e.g. strategies published online or casual players joining later), or even world events like holidays or popular sporting events that can temporarily change the game's demographic. For example, if players in a cohort that started later stick with the game for longer, this may be a signal that the game has become more compelling to play.

Another condition for grouping cohorts can be skill level, putting together players who are similar in skill. For competitive games, this is often based on an Elo rating system (Elo, 1987) -- a method for calculating the relative skill level among players. These skill levels can be determined after a period of play; when forming these cohorts, players within a skill cohort are comparable no matter how they started the game. Comparing players between skill levels provides clues about what differentiates more skilled players from weaker players.

Note that it is useful but not crucial to build cohorts of similar size. As long as each cohort has enough players in it to be statistically relevant, it will be fine in the analysis.

## Case Studies of Gameplay Data

From the same Halo Reach dataset, we later sought to find out for the players who gained skill the fastest how frequently they played (or essentially, practiced). We formed cohorts of players based on the average number of matches they played per week. From these groupings, we were able to determine that players who played 4--8 matches per week on average were the most efficient in gaining skill, more so than players who played more frequently. But we could learn more from forming yet another set of cohorts -- groups of players who took breaks; this analysis revealed that week-long breaks from playing Halo Reach required a period of recovery time when the player returned. So consistent and sustained play seemed to be the optimal way to get the most skill out of every match. However, by simply dividing into yet another cohort grouping of total number of matches played, players who simply played a sheer greater number of matches (while starting at a lower skill level and gaining skill slowly), still overcame the less frequent players by playing vastly more matches in the same amount of time (Huang et al, 2013). So three ways of forming cohorts each taught us something new.

What about a cohort of the very top players? We formed a cohort of players who ended up with the highest skill ratings after 7 months of play to examine if there was anything particular that led them to become the best at Halo Reach. The highest skilled players consistently improved since the beginning of their play, and showed relatively few dips in skill as they progressed. Since dips are often signals of experimentation and transition to a new strategy, this suggests that the best players already had the habits and tools to succeed from the very beginning.

Unsatisfied with this conclusion, I worked with colleagues to use replays from the real-time strategy game StarCraft 2 to examine the in-game behavioral differences between players of different skill cohorts (Yan et al., 2015). Using cohort analysis again, we found that better players are more adept at manipulating many units simultaneously, especially during time pressure situations. The behavioral data also suggested that these habits are gained from a series of seemingly meaningless warm up actions of rotating through units that actually develop muscle memory. These were actionable findings that gave us better insight into understanding a pathway to acquire skill in competitive games.

## Challenges of Using Cohorts

There are a few instances where it is easy to end up with wrong conclusions in cohort analysis.

1. When looking at a particular difference between cohorts, also compare these differences within players of a cohort. If there is a greater difference in that variable within players of a cohort than between cohorts, then that variable might actually not be different between cohorts.

2. Cohorts may be biased in ways you do not expect. For example, a cohort of players that started together after the game's release date may be enthusiasts who jump to new games quickly, so they may tend to play a game for a short period of time. They may also be more experienced with games of this genre, and gain skill faster than a later cohort. As another example, a more skilled cohort may comprise players of a younger demographic because of their better motor control reaction which is useful in the game; as a side-effect, these players may have more time to play the game compared to older less-skilled players.

3. Mining data from games, whether with cohort analysis, or other methods still requires care when attempting to make causal claims. It may be overreaching to say that performing more actions per second leads to more wins when these two variables are correlated, because it is possible that there is something that causes both of these conditions.

## Summary

Gameplay data is inherently noisy due to many potential environmental factors, but cohort analysis can help extract the signal. Form cohorts to control for different conditions, then compare these cohorts to find differences that may help provide insight about the players. Cohorts based on the install date of the game makes it possible to find out whether changes in the software has a long-term effect. Forming cohorts based on some condition of the players such as skill level can reveal how these groups are different and why they are different.

## References

Elo, Arpad E. The rating of chessplayers, past and present. Arco Pub., 1978.

Huang, Jeff, Thomas Zimmermann, Nachiappan Nagappan, Charles Harrison, and Bruce C. Phillips. "Mastering the art of war: how patterns of gameplay influence skill in Halo." In Proceedings of the SIGCHI Conference on Human Factors in Computing Systems, pp. 695-704. ACM, 2013.

Yan, Eddie Q., Jeff Huang, and Gifford K. Cheung. "Masters of Control: Behavioral Patterns of Simultaneous Unit Group Manipulation in StarCraft 2." In Proceedings of the 33rd Annual ACM Conference on Human Factors in Computing Systems, pp. 3711-3720. ACM, 2015.
