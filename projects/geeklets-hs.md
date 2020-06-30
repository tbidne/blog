---
title: Geeklets-hs
---

<span class="fa fa-github"></span> <a href="https://github.com/tbidne/geeklets-hs">Repo</a>

This a Haskell reimplementation of a project I originally wrote in Ruby. It is extremely simple, just backing scripts for [GeekTool](https://www.tynsoe.org/v2/geektool/) that I use on my desktop.

There are really only two notable elements of this project.

One, it was my first experience with the Freer monad. I have been interested in so-called "effect systems" and wanted to try something like [polysemy](https://hackage.haskell.org/package/polysemy) or [freer-simple](https://hackage.haskell.org/package/freer-simple). However, I figured it would be prudent to understand _what_ the freer monad is first, so I decided to write a dead-simple implementation of the concept from the [original paper](http://okmij.org/ftp/Haskell/extensible/more.pdf) by Kiselyov and Ishii. I would not use it in a large project today as I'm too inexperienced with it to know its pain points, best practices, etc., but it is definitely interesting.

Second, I tried out the [Hedgehog](https://hackage.haskell.org/package/hedgehog) property testing library. Like QuickCheck, Hedgehog is really cool. However, there are some areas where I think Hedeghog has the upper hand:

- Automatic shrinking. This is a huge win, in my opinion, even if it means the shrinking is sub-optimal.
- No orphan instances! This is probably not that big of a deal, but I found it annoying that everything in QuickCheck has to be an instance of `Arbitrary`, leading either to orphan instances or `newtype`s everywhere.

On the other hand, QuickCheck does have some advantages:

- The converse of my first bullet point above, you have to supply the shrinking functions yourself, but they can therefore be much faster.
- Don't have to write manual generators everywhere. Say you need a generator for a type `Foo`. For QuickCheck you write the `Arbitrary` instance, and once you do that you can use it anywhere in the signature of a property you want to test. E.g., you can write `Foo -> Bool`, `Int -> Foo -> Bool` without any extra work. I'm not aware of how to do this in Hedgehog. To the best of my knowledge, you still have to write `genFoo :: Gen Foo` and `genIntFoo :: Gen (Int, Foo)` because `forAll` only takes a single `Gen`. It is very possible this is a gap in my Hedgehog knowledge, but as of now it's annoying.

I also tried out the testing framework [tasty](https://hackage.haskell.org/package/tasty). Tasty is awesome, and I imagine I'll use it to organize the tests in most of my future projects.