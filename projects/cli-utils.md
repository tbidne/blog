---
title: CLI Utils
---

<span class="fa fa-github"></span> <a href="https://github.com/tbidne/cli-utils">Repo</a>

This is my first project that I actually use regularly! The concept is very simple, it just implements several different CLI actions that I personally use somewhat frequently.

This is the first time I used [MTL](https://hackage.haskell.org/package/mtl), and I can see why it is popular. It took me considerable time to understand the motivation for monad transformers, but after that the jump to typeclass constraints is pretty reasonable. It is nice having a pure implementation that can be tested, without having to navigate the annoyances of testing real `IO`.

I also used [QuickCheck](https://hackage.haskell.org/package/QuickCheck) for the first time! Frankly, QuickCheck is amazing. I can't believe property testing isn't more popular. There are some rough edges (orphan instances, writing shrinks by hand), but they are well worth the trade-off (at least when the alternative is no property tests). QuickCheck definitely helped me find some bugs in my implementation.

Below is a description of the three implemented actions.

### Runs cli commands asynchronously

Motivation: At the start of my day I typically run several cli commands. Typing these by hand is tedious and error prone, so I could write an alias in my `.zshenv`, e.g. `alias start=cmd1 && cmd2 && ...`, but this has the following drawbacks:

- If any `cmd_i` fails then no commands are run afterwards.
- All commands are executed synchronously, so the total time is $\sum \text{time}(\text{cmd}_i)$.
- No feedback on how long each command has been running, or total time.
- There is no timeout (e.g., if it's been executing for 30min then die).
- If I ever want to run a variant e.g. swap `cmd1` for `cmd1'` then I need to create an entirely new alias. Obviously this does not scale.

Thus CLI Utils includes a command called `run-shell` or `rs` that

- Runs all commands asynchronously. A single failure does not cause others to fail
- Prints the current running time and displays the time each command took to finish.
- Includes a timeout option `--timeout=<seconds>`.
- Takes a parameter filepath to a legend. The legend includes lines like `cmd1=echo hi`, thus we can call our program like `cli-utils rs --legend=path/to/file cmd1`, greatly decreasing the amount we have to type and increasing the versatility. Legend keys can be recursive and include multiple commands delimited by commas, e.g.,

```text
cmd1=...
cmd2=...
cmd_all=cmd1,cmd2
```

### Fast-forwards local Git branches

Another thing I typically due on startup is fast-forward my local branches on `master`. I take a conservative approach and only want branches forwarded that are direct ancestors (no "extra" work has been comitted). Thus I forward branches with `--ff-only`, ensuring that only branches that "should" be merged with master, are.

There is also functionality to push branches automatically to remote. The command

```shell
cli-utils ff origin/master --push="origin my-dev, origin other"
```

will fastforward all local branches with `origin/master` and push `my-dev` and `other` to remote. This is not something I do often, but it is nice when I need it (e.g. I want to update remote targets before a merge, and checking out, merging, pushing, is tedious).

### Find local stale branches

This is the functionality I least use, but it's nice to have. It will find all remote branches that are "stale" when compared to some branch. E.g.

```shell
cli-utils fs --master=origin/master --limit=30
```

will find all branches that do not have commits more recently than 30 days ago. Output is given by merged vs. un-merged (i.e. branches even with `--master` argument), organized by the last committer to each branch.

Again, this is not something I use often, but I was frustrated by how long this took when I wrote a naive version in Ruby, so I rewrote this parallel version in Haskell.