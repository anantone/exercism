# Lasagna

Welcome to Lasagna on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Variables and assignment

R is a dynamically typed language, so in general it is not necessary to specify the type of a variable. The preferred assignment operator is `<-` 

```R
x <- 42
avogadro <- 6.02e23
mystr <- "Hello, World!"
```

Using `=` instead of `<-` will often but not always work, and is discouraged as poor style.
If working in RStudio, it can be entered with the keyboard shortcut `Alt-minus`.

Operators are mostly conventional, but note `%/%` and `%%`:

```R
2 + 3   # 5
2 - 3   # -1
2 * 3   # 6
2 / 3   # 0.6666667
8 %/% 3 # 2 (integer division)
8 %% 3  # 2 (remainder)
2 ^ 3   # 8 (exponential)
```

In R, `#` starts a single-line comment.
There is no separate syntax for multi-line comments.

## Functions

To define a function:

```R
squareit <- function(x) {
    x * x
}
```

Functions can have zero or more arguments, separated by commas.
Parentheses `()` are needed with `function()`, even if there are no parameters.

Default values can be specified for function arguments, though these must come after any arguments without defaults, and use `=` not `<-` to assign the default value.
As a rather pointless example:

```R
squareit <- function(x = 42) {
    x * x
}

squareit()
#> [1] 1764
```

The braces `{ }` are not strictly required for single-line function bodies, but including them is considered good style.

R will automatically return the final value of a function, as in the examples above.

`return()` can be used anywhere within the function body to make a return value explicit.

Calling a function is the same as in many other languages:

```R
squareit(3)
#> [1] 9
```

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `expected_minutes_in_oven()` function that does not take any parameters and returns how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 60.

```r
> expected_minutes_in_oven()
[1] 60
```

## 2. Calculate the remaining oven time in minutes

Define the `remaining_time_in_minutes` function that takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```r
> remaining_time_in_minutes(50)
[1] 10
```

## 3. Calculate the preparation time in minutes

Define the `prep_time_in_minutes()` function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```r
> prep_time_in_minutes(2)
[1] 4
```

## 4. Calculate the elapsed time in minutes

Define the `elapsed_time_in_minutes` function that takes two arguments: the first argument is the number of layers you added to the lasagna, and the second parameter is the number of minutes the lasagna has been in the oven. The function should return how many minutes in total you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```r
> elapsed_time_in_minutes(3, 20)
[1] 26
```

## Source

### Created by

- @jonmcalder