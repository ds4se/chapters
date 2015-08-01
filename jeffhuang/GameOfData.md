# The Game of Data: Cohort Analysis can Derive Signal from Noisy Data

## Story: Losers Play More

During an internship at Microsoft Research, I worked with a team that had access to the history of all the matches of the first-person shooter game Halo Reach. We were particularly interested in learning about what types of players were likely to stick around to play for longer, i.e. retention. So one of the things I looked at was how a player's skill changed within the first 100 matches they played, but the player base was so diverse that looking at any individual player reveal no answers about retention.

But when I grouped the players into 16 cohorts of progression using Symbolic Aggregate approXimation (SAX), by classifying them into 4 levels of skill at 4 different points in time, what I found was the opposite of what I expected. In every cohort where players were losing skill (unbeknowstd to themselves), these players were playing about 15% more matches than players who improved in skill. It appeared that for many players, getting better was not a relevant condition for them to stick with the game.

## Why Cohort Analysis is a Powerful Tool for Gameplay Data

Gameplay data is essentially captured logs that the game software generates, and is often used to help with matchmaking or provide players a way to replay their matches. As an analytics tool, gameplay data provides a larger naturalistic dataset which can be useful for learning about players. However, game histories and replays while precise and correct has a lot of inherent noise. This noise comes from players swtiching accounts, disconnection issues and environmental changes, players not playing to win, and so forth. Additionally, the vast amount of data collected makes simple descriptive analytics not terribly useful, and because factors are not manipulated as experiments during the game, findings show correlations rather than causality.

## Forming Cohorts

Cohorts can be formed from any variable, but two variables especially make sense for grouping players. A common one used by many games is grouping players who started playing at the same time. So rather than examining data within a particular calendar date range, a start date based cohort would naturally make the first day of play for each player comparable. This approach also removes a lot of confounding factors due to changes in the game itself, changes in the game's culture or overall player base, or even world events like holidays or popular sporting events that can change the gameplay demographic. For example, if players in a cohort that started later stick with the game for longer, this is a signal that the game as become more compelling to play for longer.

Another dimension of cohort grouping is based on skill level, putting together players who are similar in a skill based on an Elo-like rating system. These skill levels can be determined after a period of play; then players within a cohort are on equal footing skill-wise. Comparing players between skill levels provides clues about what differentiates more skilled players from weaker players.

# Case Studies 
In one analysis using the same Halo Reach dataset, we sought to find out how frequently the players should play to gain skill the fastest. We could determine that players who played 4--8 matches per week on average were the most efficient in gaining skill, moreso than players who played more frequently. Additionally, players who took week-long breaks from their play would need a period of time when they returned to recover their pre-break skill level. Therefore, consistent but and sustained play was the key to get the most skill out of every match. However, from another perspective, players who simply played a sheer greater number of matches, while starting at a lower skill level and gaining skill slowly, still overcame the less frequent players by playing vastly more matches in the same amount of time.

In Halo Reach, skill is derived from many factors. The highest skilled players consistently improved since the beginning of their play, and show relatively few dips in skill as they progress. Since dips are often signals of experimentation and transition to a new strategy, this suggests that the best players already had the habits and tools to suceed from the very beginning.

In an analysis of replays from the real-time strategy game StarCraft 2, we looked more at the in-game differences between players of different skill cohorts. Using cohort analysis here, we found that better players are more adapt at manipulating many units simultaneously, especially during time pressure situations. The in-game data also suggests that these habits are gained from a series of seemingly meaningless warm up actions of rotating through units that actually develop muscle memory.

## What not to do

Watch out for cohorts where within-cohort differences are much larger than between-cohort differences

Be careful about causal claims
(Note that correlation with a variable that occurs later in time is causal as long as there is not one factor that can affect both variables.)

Try to build cohorts that are similar in size

## In Summary:

Gameplay data is noisy, but cohorts can smooth it out.

Form cohorts, then look at differences between cohort groups.

Form cohorts based on time. This can also help with causal claims.

Form cohorts based on other factors.

## References

Halo paper
StarCraft paper
couple other papers about telemetry
Elo
