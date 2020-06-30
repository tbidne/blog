---
title: Crypto
---

<span class="fa fa-github"></span> <a href="https://github.com/tbidne/crypto">Repo</a>

This is the first Haskell project I attempted, and it shows! Included are very simple implementations of AES and RSA. Of course there are bugs, little thought was given to performance, and Haskellers would likely be aghast at how non-idiomatic it is. Nevertheless, they _do_ work for simple instances, which I was certainly proud of at the time.

## RSA

RSA was definitely the easier of the two. Not only is the algorithm itself [simple](https://en.wikipedia.org/wiki/RSA_(cryptosystem)#Operation), implementation is also not very difficult. The hardest part was probably generating large primes reasonably efficiently, but [Miller-Rabin](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test) provides a useful algorithm that I implemented.

Looking at the code, probably the biggest flaws are

- No custom types! Functions use raw `ByteString`, `String`, `Word8`, etc.
- Unnecessary polymorphism that made the type signatures more complex than needed.

At least most of the logic is pure.

## AES

In contrast to RSA, AES was much harder to get right, though I anticipated that as I have always found the underlying Rijndael algorithm unintuitive. Like my RSA implementation, there are no custom types here! This is a pretty big flaw, and undoubtedly made my life harder.

The most glaring issue here is that the state and key matrices are represented as _lists_. Not only are linked lists bad for performance here (e.g. indexing is $O(n)$ vs $O(1)$), it makes it really easy to create bugs as there is no fixed length! At the very least I should be using fixed-size vectors, depending on the key size. The state is possibly a good candidate for the `State` monad, maybe even `ST` if I really need the performance of true mutability.

For the variable key size / state size, I could even imagine something like

```haskell
{-# LANGUAGE DataKinds, KindSignatures, InstanceSigs #-}

public static void

data KeySize
  = K128
  | K192
  | K256

class CanEncrypt (s :: KeySize) where
  addRoundKey :: Int -> Key s -> State s
  subBytes :: State s -> State s
  shiftRows :: State s -> State s
  mixColumns :: State s -> State s

instance CanEncrypt K128 where
  addRoundKey :: Int -> Key K128 -> State K128
  ...
```

to ensure that using the wrong key / state sizes is a compile-time error. Obviously there is the possibility this ends up too messy, or there are better ways to achieve the same thing, but it is an idea worth exploring.

Another flaw is that `fieldMult` is basically a partial function, only made total by returning 0 when it encounters an unexpected parameter. One can verify that it's "safe" since it is used correctly by the only functions that call it (`affineTransform` and `invAffineTransform`), but this is hardly ideal and subject to refactoring failures. We can definitely do better here.

Were I to redo this (and it is a future project of mine), I would definitely make custom types for all of this, and move as many invariants into the types as possible.