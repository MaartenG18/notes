+++
title= "Week 6"
weight= 3
+++

## Table of contents

1. [Exercises on Chapter 13](#exercises-on-chapter-13)
2. [Exercises on Chapter 14](#exercises-on-chapter-14)
3. [Initial Exercises on Chapter 15](#initial-exercises-on-chapter-15)

## Exercises on Chapter 13

{{% task %}}

Given an unsorted array of integers, for example {1, 5, 2, 2, 2, 5, 5, 4}. Print all the pairs of integers with a given difference d. With d == 3, the example array would give the following output: (2, 5) and (1, 4).

A naive solution considers every possible pair in the array, with a time complexity of O(N²). Try to find a more efficient solution (there are multiple approaches, using algorithms and data structures from previous chapters).

To avoid duplicates in the output, you can first sort the array and skip adjacent duplicates in the array. Implementing a sorting algorithm is unnecessary: the C++ Standard Library, for instance, provides sorting functions.

What is the time complexity of your solution?

{{% /task %}}

*Answer:*

{{% task %}}

Like quicksort, merge sort uses a divide-and-conquer strategy (this pseudocode is still missing important steps that you need to determine yourself):

```pseudocode
mergeSort(array, l, r)
    find middle point m to divide array into two halves
    call mergeSort for first half: mergeSort(array, l, m)
    call mergeSort for second half: mergeSort(array, m + 1, r)
    merge two halves sorted in step 2 and 3 with helper function
```

Implement merge sort for a given array of numbers. Use the random array generator from exercise 2.3.1 to produce data to test your implementation.

What is the time complexity of your solution?

{{% /task %}}

*Answer:*

{{% task %}}

Write a second version of your merge sort, where you use multiple threads to sort parts of the array. Is a quicksort with multiple threads also possible?

{{% /task %}}

*Answer:*

{{% task %}}

In the Java documentation, you find that various algorithms are used to sort arrays. Explore two algorithms in particular: dual-pivot quicksort and timsort. How does a multi-pivot quicksort work and what are the advantages? Why is timsort called a hybrid sorting algorithm, how does it work, and why is it considered to be efficient?

{{% /task %}}

*Answer:*

## Exercises on Chapter 14

{{% task %}}

An application of node-based data structures is the implementation of treebased structures, in which nodes are linked hierarchically. A binary tree is a tree in which each node has zero, one, or two children (see figure).

![Tree](/img/ALG/week-6/tree.png)

Implement a binary tree, preferably in C++, with recursive functions that:

- calculate the amount of nodes in a tree;
- calculate the amount of levels in a tree;
- print each node's value in reverse level order.

With *reverse level order traversal*, you first visit the last level of a tree, then
the second-to-last level, and so on. For each level, you visit the nodes from
left to right. (Questions like this are common during job interviews.)

If you find such trees too difficult, first read the next chapter of the book.

{{% /task %}}

*Answer:*

## Initial Exercises on Chapter 15

{{% task %}}

In the book, they state that the time complexity of deleting from a binary search tree is typically *O(logN)*, because deletion requires a search plus a few extra steps. Analyze the code of the `delete()` function to verify this.

{{% /task %}}

*Answer:*

{{% task %}}

Extend exercise 6.2.1 with a recursive function that, given a binary tree and a number, returns whether the tree has a root-to-leaf path (a sequence of nodes starting with the root, going down to a leaf) for which the sum of all values on that path equals the given number.

{{% /task %}}

*Answer:*
