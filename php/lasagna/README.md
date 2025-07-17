# Lucian's Luscious Lasagna

Welcome to Lucian's Luscious Lasagna on Exercism's PHP Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Basics

For more detailed information about these topics visit the [concept page][exercism-concept].

### General syntax

The PHP opening tag `<?php` marks the start of PHP code.
All statements must end with a `;` for instruction separation.

```php
<?php

$message = "Success!"; // Statement correctly ends with `;`
$message = "I fail." // PHP Parse error: syntax error, [...]
```

For easier reading, all code examples omit the PHP opening tag `<?php`.

### Comments

Single line comments start with `//`.

```php
// Single line comment
```

### Values and Variables

Using the assignment `=` operator, a value may be assigned to a variable.
Variable names must start with a dollar `$` sign and follow the [naming conventions][exercism-concept-naming-conventions].

```php
$count = 1; // Assign value of 1

// Strings can be created by enclosing the characters
// within single `'` quotes or double `"` quotes.
$message = "Success!";
```

### Functions and Methods

Values and variables can be passed to functions.
Function arguments become new variables to hold values passed in.
Functions may return any value using the keyword `return`.

```php
function window_height($height)
{
    return $height + 10;
}

window_height(100);
// => 110
```

Functions inside classes and their instances are called methods.
To call a method, the name is preceded by the instance and `->`.
Methods have access to the special variable `$this`, which refers to the current instance.

```php
<?php

class Calculator {
    public function sub($x, $y)
    {
        return $this->add($x, -$y); // Calls the method add() of the current instance
    }

    public function add($x, $y)
    {
        return $x + $y;
    }
}

$calculator = new Calculator(); // Creates a new instance of Calculator class
$calculator->sub(3, 1); // Calls the method sub() of the instance stored in $calculator
// => 2
```

[exercism-concept]: /tracks/php/concepts/basic-syntax
[exercism-concept-naming-conventions]: /tracks/php/concepts/basic-syntax#h-naming-conventions

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have five tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Implement the `expectedCookTime` function in class `Lasagna` that does not take any arguments and returns how many minutes the lasagna should be in the oven.
According to the cooking book, the expected oven time in minutes is 40:

```php
<?php
$timer = new Lasagna();
$timer->expectedCookTime()
// => 40
```

## 2. Calculate the remaining oven time in minutes

Implement the `remainingCookTime` function in class `Lasagna` that takes the actual minutes the lasagna has been in the oven as an argument and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```php
<?php
$timer = new Lasagna();
$timer->remainingCookTime(30)
// => 10
```

## 3. Calculate the preparation time in minutes

Implement the `totalPreparationTime` function in class `Lasagna` that takes the number of layers you added to the lasagna as an argument and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```php
<?php
$timer = new Lasagna();
$timer->totalPreparationTime(3)
// => 6
```

## 4. Calculate the total working time in minutes

Implement the `totalElapsedTime` function in class `Lasagna` that takes two arguments: the first argument is the number of layers you added to the lasagna, and the second argument is the number of minutes the lasagna has been in the oven.
The function should return how many minutes in total you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```php
<?php
$timer = new Lasagna();
$timer->totalElapsedTime(3, 20)
// => 26
```

## 5. Create a notification that the lasagna is ready

Implement the `alarm` function in class `Lasagna` that does not take any arguments and returns a message indicating that the lasagna is ready to eat.

```php
<?php
$timer = new Lasagna();
$timer->alarm()
// => "Ding!"
```

## Source

### Created by

- @neenjaw