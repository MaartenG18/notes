+++
title= "Week 4"
weight= 3
+++

## Table of contents

1. [Exercises on Chapter 7](#exercises-on-chapter-7)
2. [Exercises on Chapter 8](#exercises-on-chapter-8)
3. [Exercises on Chapter 9](#exercises-on-chapter-9)

## Exercises on Chapter 7

{{% notice todolist %}}

Extra oefeningen achteraan boek

{{% /notice %}}

## Exercises on Chapter 8

{{% task %}}

Given an array with votes, which are represented by a number, for example {2, 4, 1, 2, 2, 5, 2, 3, 1, 2, 2}. Write a function that returns the majority vote (a vote that appears more than N/2 times; 2 is a majority vote in the example), if present. Create a solution with a hash table that stores the number of times that each vote occurs (e.g. `std::unordered_map<int, int>`).

What is the time complexity of your solution? Next, compare this to the Boyer–Moore majority vote algorithm.

{{% /task %}}

*Answer:*

{{% task %}}

In exercise 2.1.4, you had to look for palindromes. Now, write a function that, given a string, returns the longest palindrome that you can create with (a subset of) the characters of that string. For example, given the string “ABBDABCC”, the longest palindrome is “BACBCAB” (or “BACDCAB”, or . . . ; it suffices to return just one solution).

{{% /task %}}

{{% notice tip %}}

Hint: start by creating a hash table that stores the number of times that each character occurs in the given string and use this information to create the palindrome. Use a class such as `std::string` to easily append, reverse . . .

{{% /notice %}}

*Answer:*

{{% task %}}

Determine whether two given strings are isomorphic: `s1` and `s2` are isomorphic if all occurrences of each character in `s1` can be replaced with another character to get `s2` and the other way around. For example, “ADAG” and “XDXY” are isomorphic, as we can map ‘A’ - ‘X’, ‘G’ - ’Y’ and ‘D’ - ‘D’.

A common mistake is to overlook certain cases, so make sure to test your code with various examples: “AADG” and “XDXY” are not isomorphic, but neither are “ADAD” and “XDXY” or “ADAG” and “XDXX”.

{{% /task %}}

*Answer:*

{{% task %}}

Another method of collision resolution in hash tables is open addressing. Examine *linear probing*, *quadratic probing* and *double hashing* in detail, as well as their effect on search and insertion.

Given as input the numbers 42, 39, 57, 3, 18, 5, 67, 13, 83, 26, a hash table with a fixed size of 13, and the hash function *H(x) = x* mod 13. Write down the resulting hash table (similar to the drawings in the book, e.g. on pages 119-120) for separate chaining, linear probing, and quadratic probing. As an extra, you can also do it for double hashing.

{{% /task %}}

*Answer:*

{{% task %}}

Implement a hash table that uses linear probing. Support search and insertion. As an extra, you can implement deletion (e.g. with a lazy deletion strategy) and resizing (e.g. if the load factor exceeds a certain threshold, double the size of the data structure).

{{% /task %}}

*Answer:*

## Exercises on Chapter 9

{{% task %}}

Consult the documentation: in the C++ Standard Library, how do the data structures `std::queue` and `std::deque` differ? What about equivalents in Java?

{{% /task %}}

*Answer:*

{{% task %}}

The book describes an approach to check whether code contains brace-related syntax errors. Write a program that implements this approach, using `std::unordered_map` to relate opening to closing braces (e.g. ‘(’ as key, ‘)’ as value) and `std::stack` to store characters

{{% /task %}}

*Answer:*
