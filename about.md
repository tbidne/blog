---
title: About
---

I am a software engineer based in Washington D.C.

## Programming

My programming interests are varied, though most recently I have become focused on program-correctness, which naturally led to Haskell. Why Haskell?

On the practical side, I deeply appreciate Haskell's purity and all the tools it provides for encoding program logic into its type system. Haskell is not the only pure functional language, but the other ones I am aware of either lack useful features (e.g. Elm and Higher Kinded Types, Typeclasses) or are relatively new and lack libraries (e.g. Agda, Idris). PureScript is perhaps the best example of a Haskell-inspired language that arguably exceeds its predecessor in its domain (web programming), though it does lack some advanced features like `GADTs` and `Type Families`.

Less practically, what keeps me coming back to Haskell is its commitment to pushing the boundaries and "Doing the Right Thing". Haskell feels like an endless well of knowledge, a gateway drug of sorts. Prior to Haskell, I had never heard of concepts like "Monads", "Dependent Types", or "Codata". These concepts are both extremely cool _and_ useful! It is disappointing that these concepts are alien to most of the programming world, but functional programming has become more in vogue, so perhaps there will be a day when some of these more exotic ideas are mainstream. Until then, I will happily explore them on my own.

Of course, Haskell is not without its warts (e.g. records, strings), and type level programming has its limitations; `singletons` is a bit kludgy (save us `-XDependentHaskell`, you're our only hope!). Overall, though, Haskell represents the best vehicle for providing strong software guarantees, in my experience. It is an absolute joy writing a program that "just works" once it compiles, and Haskell comes closer to that platonic ideal than any other language, outside of those with full dependent types.

## Math

To my great regret, I did not realize how fun math could be until my final semester of university. Fortunately there is an abundance of material both online and in books, so learning at least the basics is very doable.

### Cryptography

I found cryptography _fascinating_ in university, and the [first Haskell project](https://github.com/tbidne/crypto) I created was a simple (and rough!) implementation of AES and RSA. I used [Katz and Lindell](https://www.amazon.com/Introduction-Modern-Cryptography-Principles-Protocols/dp/1584885513) as an introduction.

### Abstract Algebra

A university cryptography course was responsible for introducing me to abstract algebra, and it caused an epiphany, "Hang on, this actually seems interesting in its own right." Up until then I had a very immature view of mathematics ("math is combinatorics or calculus on $\mathbb{R}$", essentially), so I have abstract algebra to thank for opening my eyes to the beautiful world of math.

The first math book I purchased "fun fun" was [Pinter's A Book of Abstract Algebra](https://www.amazon.com/Book-Abstract-Algebra-Second-Mathematics/dp/0486474178). This book is an excellent introduction to the subject, culminating in what is the coolest proof that I am aware of, i.e., the insolvability of the quintic equation. The quintic equation is actually what prompted me to purchase Pinter. Wikipedia has a [proof sketch](https://en.wikipedia.org/wiki/Abel%E2%80%93Ruffini_theorem), and I found the ideas

1. We have a formula for quartic equations but something "goes wrong" with degree $\ge 5$.
1. Somehow this problem can be encoded via "symmetries".

so intriguing that I decided to learn enough abstract algebra to understand the proof.

### Category Theory

Abstract Algebra and Haskell naturally led me to Category Theory. It took a long time to break out of the "need" for concrete objects to reason about, and commutative diagrams are still largely unintuitive, outside of the "obvious" ones that encode properties like associativity. Nevertheless, I find the subject enjoyable, and its usage in functional programming only increases my interest. I like [Awodey](https://www.amazon.com/Category-Theory-Oxford-Logic-Guides/dp/0199237182) as an introduction and reference, though I have yet to go through the entire book.

### Number Theory

Along with Abstract Algebra, Number Theory was the first area of math that caught my interest. Gauss' observation that Euler's totient function satisfies

$$ \sum_{d | n} \varphi (d) = n $$

immediately made the impression _wait how could that possibly be true_. I like [Ireland and Rosen](https://www.amazon.com/Classical-Introduction-Modern-Graduate-Mathematics/dp/038797329X) for its mix of number theory and algebra, though I have only read the first half.

[Cox](https://www.amazon.com/Primes-Form-x2-ny2-Multiplication/dp/1118390180) is also a good book on the subject, and it's part of my dream to one day understand Artin's reciprocity law, though that is probably far-off.

## Exercise

I enjoyed strength training and sports (mainly soccer) for years, but my girlfriend is responsible for motivating me to take running more seriously back in 2018. Since then I have completed several half-marathons, and I signed up for my first marathon for Fall 2020. That is probably out due to the pandemic, but I am still hoping to complete an unofficial marathon around then.

I have come to appreciate running as a way to mentally relax and clarify my thoughts. One of my favorite things to think about while running is how I would explain some topic I'm interested in to someone else. This has been enormously helpful in organizing what I know and more importantly highlighting what I don't know. I have lost count of the number of times I thought I understood something only to realize while giving a "mental lecture" that in fact, no, actually there are still details I do not understand!

## Traveling

I am fortunate enough that I have been able to travel. So far I have visited Alaska, Iceland, Spain, Germany, and New Zealand.
