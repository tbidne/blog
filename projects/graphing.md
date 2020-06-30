---
title: Graphing
---

<span class="fa fa-github"></span> <a href="https://github.com/tbidne/graphing">Repo</a>

This is the first project that I actually wanted to use was more than just a learning exercise. Essentially I have a text file with timestamped events like

```text
# 17-04-19
Run 17-04-2019 14.35 01:14:30

# 18-04-19
Deadlift 18-04-2019 0 [102x3, 125x3, 134x3, 143x1, 134x2, 125x3, 102x7]

# 20-04-19
Run 20-04-2019 14.41 01:16:11

# 23-04-19
BenchPress 23-04-2019 0 [27x12, 27x10, 27x8, 27x5]

# 24-04-19
Run 24-04-2019 10.77 00:55:12
```

The application will parse this data and graph it over time via some metric. For instance, I wanted to graph my run progress via both total time, distance, and pace, so I produce 3 different line graphs for each event. I use different metrics for different activities.

It gives a nice, simple graph for measuring progress of some physical activities I care about.

This is the first time I used a Haskell parser, and I chose [megaparsec](https://hackage.haskell.org/package/megaparsec). I can definitely see how such parsers would be useful for writing compilers/interpreters.