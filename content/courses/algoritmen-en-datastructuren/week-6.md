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

```C++
#include <unordered_map>
#include <iostream>
#include <algorithm>

// The function assumes that the array is sorted
bool findPair(int arr[], int size, int n)
{
    std::unordered_map<int, int> mpp;
    for (int i = 0; i < size; i++) {
        mpp[arr[i]]++;

        // Check if any element whose frequency
        // is greater than 1 exist or not for n == 0
        if (n == 0 && mpp[arr[i]] > 1)
            return true;
    }

    // Check if difference is zero and
    // we are unable to find any duplicate or
    // element whose frequency is greater than 1
    // then no such pair found.
    if (n == 0)
        return false;

    for (int i = 0; i < size; i++) {
        if (mpp.find(n + arr[i]) != mpp.end()) {
            std::cout << "Pair Found: (" << arr[i] << ", "
                << n + arr[i] << ")";
            return true;
        }
    }

    std::cout << "No Pair found";
    return false;
}

// Driver program to test above function
int main()
{
    int arr[] = { 8, 1, 9, 2, 100 };
    int size = sizeof(arr) / sizeof(arr[0]);
    int n = 7;
    std::sort(arr, arr + size);
    findPair(arr, size, n);
    return 0;
}
```

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

```C++
// C++ program for Merge Sort
#include <iostream>
using namespace std;

// Merges two subarrays of array[].
// First subarray is arr[begin..mid]
// Second subarray is arr[mid+1..end]
void merge(int array[], int const left, int const mid, int const right)
{
    auto const subArrayOne = mid - left + 1;
    auto const subArrayTwo = right - mid;

    // Create temp arrays
    auto* leftArray = new int[subArrayOne],
        * rightArray = new int[subArrayTwo];

    // Copy data to temp arrays leftArray[] and rightArray[]
    for (auto i = 0; i < subArrayOne; i++)
        leftArray[i] = array[left + i];
    for (auto j = 0; j < subArrayTwo; j++)
        rightArray[j] = array[mid + 1 + j];

    auto indexOfSubArrayOne
        = 0, // Initial index of first sub-array
        indexOfSubArrayTwo
        = 0; // Initial index of second sub-array
    int indexOfMergedArray
        = left; // Initial index of merged array

    // Merge the temp arrays back into array[left..right]
    while (indexOfSubArrayOne < subArrayOne
        && indexOfSubArrayTwo < subArrayTwo) {
        if (leftArray[indexOfSubArrayOne]
            <= rightArray[indexOfSubArrayTwo]) {
            array[indexOfMergedArray]
                = leftArray[indexOfSubArrayOne];
            indexOfSubArrayOne++;
        }
        else {
            array[indexOfMergedArray]
                = rightArray[indexOfSubArrayTwo];
            indexOfSubArrayTwo++;
        }
        indexOfMergedArray++;
    }
    // Copy the remaining elements of
    // left[], if there are any
    while (indexOfSubArrayOne < subArrayOne) {
        array[indexOfMergedArray]
            = leftArray[indexOfSubArrayOne];
        indexOfSubArrayOne++;
        indexOfMergedArray++;
    }
    // Copy the remaining elements of
    // right[], if there are any
    while (indexOfSubArrayTwo < subArrayTwo) {
        array[indexOfMergedArray]
            = rightArray[indexOfSubArrayTwo];
        indexOfSubArrayTwo++;
        indexOfMergedArray++;
    }
    delete[] leftArray;
    delete[] rightArray;
}

// begin is for left index and end is
// right index of the sub-array
// of arr to be sorted */
void mergeSort(int array[], int const begin, int const end)
{
    if (begin >= end)
        return; // Returns recursively

    auto mid = begin + (end - begin) / 2;
    mergeSort(array, begin, mid);
    mergeSort(array, mid + 1, end);
    merge(array, begin, mid, end);
}

// UTILITY FUNCTIONS
// Function to print an array
void printArray(int A[], int size)
{
    for (auto i = 0; i < size; i++)
        cout << A[i] << " ";
}

// Driver code
int main()
{
    int arr[] = { 12, 11, 13, 5, 6, 7 };
    auto arr_size = sizeof(arr) / sizeof(arr[0]);

    cout << "Given array is \n";
    printArray(arr, arr_size);

    mergeSort(arr, 0, arr_size - 1);

    cout << "\nSorted array is \n";
    printArray(arr, arr_size);
    return 0;
}
```

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
