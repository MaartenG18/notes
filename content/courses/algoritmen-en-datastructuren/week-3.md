+++
title= "Week 3"
weight= 3
+++

## Table of contents

1. [Exercises on Chapters 4, 5 and 6](#exercises-on-chapters-4-5-and-6)
2. [Initial Exercises on Chapters 7, 8 and 9](#initial-exercises-on-chapters-7-8-and-9)

## Exercises on Chapters 4, 5 and 6

{{% task %}}

Your friend is solving a programming exercise: he has to write a simple program that looks for the largest and smallest number in an array. He already wrote the following helper function, but its time complexity is O(N2), so he clearly needs your help! Start by explaining why the time complexity of his algorithm is O(N2).

Next, write a more efficient solution to find both the largest and smallest number, and explain why your solution is more efficient. What is the overall time complexity of your solution? What are the best-, average-, and worst-case scenarios?

```C++
int max(int array[], int size)
{
    for (int i{0}; i < size; ++i) {
        bool isMax{true};
        
        for (int j{0}; j < size; ++j) {
            if (array[j] > array[i]) {
                isMax = false;
            }
        }

        if (isMax) {
            return array[i];
        }
    }
}

```

Solve this without using the corresponding algorithms of the C++ Standard Library, but look them up afterwards. What is their time complexity?

{{% /task %}}

*Answer:*

{{% task %}}

Are bubble, selection and insertion sort *stable* or *unstable* sorting algorithms? Are they *in-place* or *out-of-place*? Are they *online*? Are they *adaptive*?

If you modify your insertion sort from exercise 2.3.1 to sort an array of strings in alphabetical order, is its time complexity affected? Why (not)? Could you
improve insertion sort by combining it with binary search?

{{% /task %}}

*Answer:*

{{% task %}}

How does this sorting algorithm work? Hint: the numbers in the array range between 0 and range. Analyze the time complexity of the algorithm and make sure to explain your analysis step by step.

```C++
void sort(int array[], int size, int range)
{
    int sorted[size], count[range];

    for (int i{0}; i < range; ++i)
        count[i] = 0;

    for (int i{0}; i < size; ++i)
        ++count[array[i]];

    for (int i{1}; i < range; ++i)
        count[i] = count[i] + count[i - 1];

    for (int i{0}; i < size; ++i)
        sorted[--count[array[i]]] = array[i];

    for (int i{0}; i < size; ++i)
       array[i] = sorted[i];
}

```

What are its benefits and limitations? Can you modify the algorithm so it also works with negative numbers?

{{% /task %}}

*Answer:*

{{% task %}}

How does radix sort work? Add your own implementation of this algorithm to exercise 2.3.1 (note that there are various ways to implement radix sort).

How does radix sort compare to insertion sort? What is its time complexity? Why is it called  *non-comparative* sorting algorithm? Is it stable or unstable? In-place or out-of-place?

When would you use radix sort? Can you use it to sort an array of strings in alphabetical order? How?

{{% /task %}}

*Answer:*

{{% task %}}

Can you deduce from the C++ documentation if std::sort uses one of the algorithms from this lesson? Is it a comparative sorting algorithm? Stable? What about sorting arrays in Java or Boost?

{{% /task %}}

*Answer:*

{{% task %}}

In exercise 2.3.2, you analyzed the time complexity of a few additional sorting algorithms by testing them on randomly generated arrays. Now, describe their time complexity by analyzing the algorithms step by step.

{{% /task %}}

*Answer:*

## Initial Exercises on Chapters 7, 8 and 9

{{% task %}}

1 Consult the documentation of the C++ Standard Library: how do the data structures `std::unordered_map` and `std::unordered_set` differ? What about the time complexity of their operations?

What can you learn from the Java documentation about the load factor and capacity of a `Hashtable`, and their effects on efficiency? What is the purpose of the `HashMap` and `HashSet` classes in Java? For which purposes can you use multi-index containers, such as bimap in the Boost C++ Libraries?

{{% /task %}}

*Answer:*

{{% task %}}

What is the time complexity of finding the ‘smallest’ and ‘largest’ value in a hash table? Why? What would you do when you have inserted so many keys into your hash table that collisions occur every time?

Try to come up with a hash function for strings by yourself. Afterwards, look up solutions that are used in practice and why these are effective at hashing strings. Would a cryptographic hash function like SHA-3 be suitable?

{{% /task %}}

*Answer:*
