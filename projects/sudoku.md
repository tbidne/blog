---
title: Sudoku
---

<span class="fa fa-github"></span> <a href="https://github.com/tbidne/sudoku">Repo</a>

This is a web application that solves sudoku puzzles. A user can input the given numbers to a sudoku puzzle, ask the backend to solve it, then either reveal the entire puzzle or receive single square hints.

- The frontend is React/TypeScript.
- The backend is a Haskell web server.
- The puzzle state is persisted via a postgres db.

I used [servant](https://hackage.haskell.org/package/servant) for the web server, and I found the concept of type-safe routes really cool.

Like my crypto project, I used a list where I should have used a vector. Unlike Crypto, the performance here actually seems pretty good. I have little doubt someone could find puzzles that my application cannot solve efficiently, but when I tried a sampling of so-called "hard" sudokus puzzles my application was surprisingly good at solving them quickly, despite my limited understanding of Haskell performance.
