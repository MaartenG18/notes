+++
title= "week 2"
weight= 3
+++

## Table of contents

1. [Exercises on Chapters 1, 2 and 3](#exercises-on-chapters-1-2-and-3)
2. [Initial Exercises on Chapters 4, 5 and 6](#initial-exercises-on-chapters-4-5-and-6)

## Exercises on Chapters 1, 2 and 3

{{% task %}}

According to the documentation, which kind of functions do the C++ Standard Library and Java provide to search a value in an array? What kind of algorithms ara available in the Boost C++ Libraries? Use these libraries (unless instructed otherwise) to make your work easier.

{{% /task %}}

*Answer:*

{{% task %}}

You want to use a dynamically allocated array to store items: you decide to start with an array of size one and each time the array is full, you resize the array so it doubles in size. This function returns the number of times you have to resize the array before it is able to hold a certain number of items: for `x == 16`, it returns 4, since resizing 4 times leads to an array of size 16.

```C++
int numberOfResizes(int x)
{
    int n{0}, size {1};

    while (size < x) {
        size *= 2;
        n++;
    }

    return n;
}
```

Use the Big O notation to describe its time complexity. Can you improve the efficiency of this algorithm? If yes, how?

{{% /task %}}

*Answer:*

{{% task %}}

This simple function calculates the median from an ordered array. Describe its time complexity in terms of the Big O notation. What is the pitfall here, compared to similar exercises on arrays?

```C++
float median(float array[], int size)
{
    const int middle{ (int) floor(size / 2) };
    if (size % 2 == 0) // array has even amount of numbers
        return (array[middle - 1] + array[middle]) / 2;
    else // array has odd amount of numbers
        return array[middle];
}
```

{{% /task %}}

*Answer:*

{{% task %}}

Write a short function that, given an array of N strings, returns how many of those strings are a palindrome. Use this isPalindrome() as a helper function.

```C++
bool isPalindrome(string s)
{
    bool result{true};
    for (int i{0}; i < s.length(); ++i){
        if (s[i] != s[s.length() - i - 1]) {
            result = false;
        }
    }

    return result;
}
```

Describe the time complexity of the helper function, as well as the time complexity of your complete solution in terms of the Big O notation. What are the possible pitfalls here?

Can you improve (the time complexity of) the helper function? Another approach to check if a string is a palindrome: first reverse the string, then compare the reversed string to the original string. Is this approach as efficient as the previous algorithm? Are there other factors to consider here?

{{% /task %}}

*Answer:*

{{% task %}}

We often search within strings. Have a look at a few examples of algorithms in this context. First, explore how the Knuth–Morris–Pratt algorithm searches for occurrences of a word within a string and how it improves the time complexity compared to a naive approach of matching characters.

Next, explore how you can find the longest repeated substring in a given string. For example, the longest repeated substring in “bananas” is “ana”. What is a suffix array and how can you use it in this context?

{{% /task %}}

*Answer:*

{{% task %}}

Explore the Boyer–Moore and Boyer–Moore–Horspool string-searching algorithms, their time complexity and how they compare to Knuth–Morris–Pratt.

{{% /task %}}

*Answer:*

{{% notice note %}}

While you have to be able to reproduce algorithms such as binary search, we do not expect you to memorize these string-searching algorithms. It is important, however, that you are able to comprehend, analyze, compare, adapt . . . such algorithms. Always read the *“What You Should Know After this Lesson”* section carefully to find out what we expect (if we expected you to be able to reproduce the Knuth–Morris–Pratt algorithm, it would have been mentioned by name) and when in doubt, ask about it in class

{{% /notice %}}

{{% notice todolist %}}

Extra oefeningen achteraan boek

{{% /notice %}}

## Initial Exercises on Chapters 4, 5 and 6

{{% task %}}

Write three functions that sort an array of numbers: a bubble sort function, selection sort function and insertion sort function. Similar to exercise 1.2.3, add a counter to each algorithm that starts at 0 and increments each time you execute a step. Think about what qualifies as a ‘step’ and be consistent across functions, so you can compare the algorithms against each other.

Add a testing function that runs your algorithms for randomly generated arrays of size 100, 200, 300 . . . Each array should have random values between 0 and 99. In C++, you can use [`std::uniform_int_distribution`](https://en.cppreference.com/w/cpp/numeric/random/uniform_int_distribution) to generate random numbers (or use a similar approach in Java, Python . . . ).

For each array size, generate 2000 arrays (one at a time) and run the three algorithms with each array. Average the number of steps executed for each algorithm separately and output your results in a tabular format, as shown below (XXXX indicates where your results need to be).

Afterwards, copy the data into a spreadsheet (e.g. Google Sheets) and plot one curve for each algorithm, comparing the number of values in the array along the x-axis against the number of steps along the y-axis. Do the curves match the time complexity of each algorithm?

<br>

| SIZE | ALG 1 | ALG 2 | ALG 3 |
|------|-------|-------|-------|
| 100  | XXXX  | XXXX  | XXXX  |
| 200  | XXXX  | XXXX  | XXXX  |
| 300  | XXXX  | XXXX  | XXXX  |
| 400  | XXXX  | XXXX  | XXXX  |
| 500  | XXXX  | XXXX  | XXXX  |
| 600  | XXXX  | XXXX  | XXXX  |
| 700  | XXXX  | XXXX  | XXXX  |
| 800  | XXXX  | XXXX  | XXXX  |
| 900  | XXXX  | XXXX  | XXXX  |
| ...  | XXXX  | XXXX  | XXXX  |

{{% /task %}}

*Answer:*

{{% task %}}

Add a few very simple sorting algorithms to exercise 2.3.1: cocktail shaker
sort and Gnome sort. There are many more simple sorting algorithms you
can explore (and we will look into more complex ones in later chapters)!

{{% /task %}}

*Answer:*
