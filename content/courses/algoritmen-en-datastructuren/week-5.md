+++
title= "Week 5"
weight= 3
+++

## Table of contents

1. [Exercises on Chapters 10, 11 and 12](#exercises-on-chapters-10-11-and-12)
2. [Initial Exercises on Chapters 13 and 14](#initial-exercises-on-chapters-13-and-14)

## Exercises on Chapters 10, 11 and 12

{{% task %}}

Write a very simple recursive function `power(x, n)` that calculates x<sup>n</sup>. Next, write a second version of that function, using these rules:

![Math](/img/ALG/week-5/math.png)

For example, x<sup>6</sup> = (x<sup>3</sup>)<sup>2</sup> and x<sup>11</sup> = x ∗ (x<sup>5</sup>)<sup>2</sup>. Is the second version of the function more efficient? What is the time complexity of both versions?

{{% /task %}}

*Answer:*

{{% task %}}

In exercise 1.2.3, you presumably implemented binary search in an iterative manner, in exercise 2.1.4, an iterative function was used to determine whether a string is a palindrome, and in exercise 2.3.1, you implemented an iterative bubble, selection and insertion sort. Is it possible to implement them recursively? Which implementation do you think is more efficient?

{{% /task %}}

*Answer:*

{{% task %}}

The Tower of Hanoi is a famous mathematical puzzle. Look up the problem and analyze how the recursive solution works.

{{% /task %}}

*Answer:*

{{% task %}}

Write two recursive functions that return the *n*th number in the Fibonacci sequence: one without and one with memoization. Add a `static` counter to the functions: increase and print its value each time the function is called.

Test both functions for a variety of values for *n*. What issues do you encounter when passing a large *n*? Can you improve your code in that respect? Can you find solutions for arithmetic overflow in the C++ Boost libraries?

{{% /task %}}

*Answer:*

{{% task %}}

What are tail recursion and tail call optimization? How can you write a function to calculate the factorial using tail recursion? Explain how it works by comparing a solution with and without tail recursion. What are the advantages and disadvantages?

{{% /task %}}

*Answer:*

{{% task %}}

Given two strings, find the length of the longest subsequence found in both of them. A subsequence is a sequence that appears in the same relative order, but not necessarily contiguous: ‘abc’, ‘adg’, ‘bdf’ and ‘aceg’ are all subsequences of ‘abcdefg’. Write two recursive functions that return the length of the longest common subsequence: one without and one with memoization.

{{% /task %}}

*Answer:*

{{% task %}}

Write a program that solves a Sudoku through backtracking. Find a blank cell in the grid, try to insert each value from 1 to 9, test if it is valid, and call the solver recursively. If the recursive call fails to find a solution, try other values in a previously blank cell. Can you intuitively deduce its time complexity based on the high-level steps?

{{% /task %}}

*Answer:*

## Initial Exercises on Chapters 13 and 14

{{% task %}}

With quicksort, you need to select a certain element as your pivot. In the book, they use the last element. What other options are there, and what are their advantages or disadvantages?

{{% /task %}}

*Answer:*

{{% task %}}

Consult the documentation of the C++ Standard Library: are there implementations of a single and doubly linked list available? What about in the Boost C++ Libraries (look under ‘intrusive containers’)? What are their advantages and disadvantages compared to the `std::vector` class?

{{% /task %}}

*Answer:*
