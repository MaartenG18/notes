+++
title= "1. week 1"
weight= 3
+++

## Table of contents

1. [Initial Exercises](#initial-exercises)
2. [Chapter 1: Why Data Structures Matter](#why-data-structures-matter)
3. [Chapter 2: Why Algorithms Matter](#why-algorithms-matter)
4. [Chapter 3: Big Oh Notation](#big-oh-notation)

## Initial Exercises

{{% task %}}

You retrieve a list of all items that have been sold during the last trimester from a web shop’s database. Unfortunately, you end up with a simple array: if an item was sold three times, it occurs three times in that array. You want to count how many times one particular item has been sold. How many steps does it take to find this when the array is unordered? And when ordered? Answer in terms of N, both for the best-case and worst-case scenario.

<br>

Answer unordered:

- Best-case: N
- Worst-case: N

Answer ordered:

- Best-case: 1
- Worst-case: N

{{% /task %}}

{{% task %}}

Given the following array: [2, 4, 6, 8, 10, 12, 13]?

1. How many steps would a linear search for a number take?
2. How many steps would a binary search for a number take?

Answer in therms of N, both for the best-case and worst-case scenario.

<br>

How would you define an average-case scenario? How many steps would both take in such a scenario? According to you, which scenario is most valuable to analyze: the best-case, worst-case or average-case scenario?

<br>

Answer 1:

- Best-case: 1
- Worst-case: N

Answer 2:

- Best-case: 1
- Worst-case: 3

I would define the average-case scenario as the average between the best-case and worst-case scenario. So question one would have an average-case-scenario of (1+N)/2 = 4.5 and question two would have an averge-case-scenario of (1+3)/2 = 2. The best scenario to analyze would be the worst case scenario because this is the only way to be sure the algorithm is fully optimized.

{{% /task %}}

{{% task %}}

Implement the algorithms from exercise 1.2.2: write two functions that search a certain number in a given array of numbers and return the index of that number when found (-1 if not found). One function uses linear search, the other function uses binary search.
Extend or adapt your code to verify your answers from exercise 1.2.2. Add a counter to each algorithm that starts at 0 and increments each time you execute a step. Think about what qualifies as a ‘step’.
Finally, compare the execution time of both algorithms. To this end, you can use the C++ std::chrono library (or similar approaches in Java, Python . . . ). Try measuring the execution time at the point where you call your functions, and also inside your functions. Experiment with various sizes of arrays, from small to very big. Can you explain the results?
Note: in the next chapter, we will retake this exercise and you will be asked to extend your solution, so make sure that you have a working implementation.

<br>

Answer linear search:

```C++
#include < iostream >
using namespace std;

void linearSearch(int array[], int number) {
    int temp = -1;

    for (int i = 0; i < 5; i++) {
        if (array[i] == number) {
            cout << "Element found at index: " << i << endl;
            temp = 0;
            break;
        }
    }

    if (temp == -1) {
        cout << "No Element Found" << endl;
    }
}

int main() {
    int arr[5];
    cout << "Please enter 5 elements of the Array" << endl;
    for (int i = 0; i < 5; i++) {
        cin >> arr[i];
    }
    cout << "Please enter an element to search" << endl;
    int num;
    cin >> num;

    linearSearch(arr, num);

    return 0;
}
```

Answer binary search:

```C++
#include <iostream>
using namespace std;

int binarySearch(int arr[], int l, int r, int x)
{
    if (r >= l) {
        int mid = l + (r - l) / 2;

        if (arr[mid] == x)
            return mid;

        if (arr[mid] > x)
            return binarySearch(arr, l, mid - 1, x);

        return binarySearch(arr, mid + 1, r, x);
    }

    return -1;
}

int main(void)
{
    int arr[] = { 2, 3, 4, 10, 40 };
    int x = 10;
    int n = sizeof(arr) / sizeof(arr[0]);
    int result = binarySearch(arr, 0, n - 1, x);
    (result == -1)
        ? cout << "Element is not present in array"
        : cout << "Element is present at index " << result;
    return 0;
}
```

{{% /task %}}

{{% task %}}

A binary tree is a tree in which each node has zero, one or two children (see figure). How many steps would a search for a number take in such a tree? Answer in terms of N.

![](/img/ALG/week-1/tree.png)

<br>

Answer:

<br>

In this three the worst-case would be 3 steps.

{{% /task %}}

## Why Data Structures Matter

### Exercises

{{% task %}}

For an array containing 100 elements, provide the number of steps the following operations would take:


1. Reading
2. Searching for a value not contained within the array
3. Insertion at the beginning of the array
4. Insertion at the end of the array
5. Deletion at the beginning of the array
6. Deletion at the end of the array

Answers:

1. 1 step
2. 100 steps
3. 101 steps
4. 1 step
5. 100 steps
6. 1 step

{{% /task %}}

{{% task %}}

For an array-based set containing 100 elements, provide the number of steps the following operations would take:


1. Reading
2. Searching for a value not contained within the set
3. Insertion of a new value at the beginning of the set
4. Insertion of a new value at the end of the set
5. Deletion at the beginning of the set
6. Deletion at the end of the set

Answers:

1. 1 step
2. 100 steps
3. 201 steps
4. 101 step
5. 100 steps
6. 1 step

{{% /task %}}

{{% task %}}

Normally the search operation in an array looks for the first instance of a given value. But sometimes we may want to look for every instance of a given value. For example, say we want to count how many times the value "apple" is found inside an array. How many steps would it take to find all the "apples"? Give your anwer in terms of N.

<br>

Answer:

<br>

N steps

{{% /task %}}

## Why Algorithms Matter

### Exercises

{{% task %}}

How many steps would it take to perform a linear search for the number 8 in the ordered array, [2, 4, 6, 8, 10, 12, 13]?

<br>

Answer:

<br>

4 steps

{{% /task %}}

{{% task %}}

How many steps would it take to perform a binary search for the number 8 in the ordered array, [2, 4, 6, 8, 10, 12, 13]?

<br>

Answer:

<br>

1 step

{{% /task %}}

{{% task %}}

What is the maximum number of steps it would take to perform a binary search on an array of size 100,000?

<br>

Answer:

<br>

16 steps

{{% /task %}}


## Big Oh Notation

### Exercises

{{% task %}}

Use Big O Notation to describe the time complexity of the following function that determines whether a given year is a leap year:

```javascript
function isLeapYear(year) {
	return (year % 100 === 0) ? (year % 400 === 0) : (year % 4 === 0);
}
```

Answer:

<br>

O(1)

{{% /task %}}

{{% task %}}

Use Big O Notation to describe the time complexity of the following function that sums up all the numbers from a given array:

```javascript
function arraySum(array) {
	let sum = 0;

	for(let i = 0; i < array.length; i++){
		sum += array[i];
	}
	return sum;
}
```

Answer:

<br>

O(N)

{{% /task %}}

{{% task %}}

The following function is based on the age-old analogy used to describe the power of compounding interest:

<br>

Imagine you have a chessboard and put a single grain of rice on one square. On the second square, you put 2 grains of rice, since that is double the amount of rice on the previous square. On the third square, you put 4 grains. On the fourth square, you put 8 grains, and on the fifth square, you put 16 grains, and so on.

The following function calculates which square you'll need to place a certain number of rice grains. For example, for 16 grains, the function will return 5 since you will place the 16 grains on the fifth square.

```javascript
function chessboardSpace(numberOfGrains) {
	let chessboardSpaces = 1;
	let placedGrains = 1;

	while (placedGrains < numberOfGrains) {
		placedGrains *= 2;
		chessboardSpaces += 1;
	}

	return chessboardSpaces
}
```

Answer:

<br>

O(log N)

{{% /task %}}

{{% task %}}

The following function accepts an array of strings and returns a new array that only contains the string that start with the character "a". Use Big O Notation to describe the time complexity of the function:

```javascript
function selectAString(array) {
	let newArray = [];

	for(let i = 0; i < array.length; i++){
		if (array[i].startsWith("a")) {
			newArray.push(array[i]);
		}
	}

	return newArray;
}
```

Answer:

<br>

O(N)

{{% /task %}}

{{% task %}}

The following function calculates the median from an ordered array. Describe its time complexity in therms of Big O Notation:

```javascript
function media(array) {
	const middle = Math.floor(array.length / 2);

	// If array has even amount of numbers:
	if (array.length % 2 === 0) {
		return (array[middle - 1] + array[middle]) / 2;
	} else { // If array has odd amount of numbers:
		return array[middle];
	}	
}
```

Answer:

<br>

O(1)

{{% /task %}}