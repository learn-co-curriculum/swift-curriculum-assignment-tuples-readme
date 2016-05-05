# Tuples 


## Learning Objectives
- Describe a tuple as being a type that groups multiple values into a single compound value.
- Explain that values within a tuple can be of any type and do not have to be of the same type as each other.
- Iterate over the key-value pairs in a dictionary where each item is returned as a (key, value) tuple.
- Create a tuple and name the individual elements

## What the Student Already Knows
A student should already understand the concept of variables, constants, Int, String, Bool, Array, Dictionary and functions but not Tuples.

## Using Tuples

Swift provides a number of ways to group related values together. One basic way that you've already learned about is arrays. Imagine you have a list of things to buy at the grocery store. This is a list of strings: milk, eggs, bread, and so on. This list of items could be stored in an array of strings. Iterating over each element of that array is easy. If you wanted to print out each item in your shopping list, you could use a `for` loop:

```
let shoppingList = ["milk", "eggs", "bread"]
for item in shoppingList {
    print(item)
}
```

Swift provides other ways to group related values together. You have also learned about dictionaries, which associate a _key_ with a _value_. Imagine you want to associate a season with a color. You could declare this association using a dictionary:

```
let seasonColors = [
    "autumn": "red",
    "winter": "grey",
    "spring": "green",
    "summer": "yellow"
]
```

Let's say you wanted to print out the sentence "{Season} reminds me of {color}" for each element in your dictionary. How would you do that?

Like arrays, you can iterate over the elements of a dictionary using a `for` loop. Unlike an array, however, each dictionary entry consists of two pieces of data: a key and a value. Consider a `for` loop similar to the one you used to print the contents of an array:

```
for item in seasonColors {
    print(item)
}
```

You will notice that a list of two strings per line is printed:

```
("winter", "grey")
("spring", "green")
("summer", "yellow")
("autumn", "red")
```

Why are the contents of your dictionary printed to the console that way? Each iteration of the dictionary returns not just a string, as it did with an array, but a _tuple_ containing both the key and value for that pair. A tuple is a group of zero or more items that are treated in Swift as a single value. (Tuples usually contain more than one value, but empty tuples or tuples of one value are possible, just not very interesting.)

You've probably encountered tuples outside of programming. For example, think of coordinates on a graph. Coordinates on a graph are often expressed as an _x_, _y_ pair: (4,2), for example, would represent a point at _x = 4_ and _y = 2_ on a graph. That pair of integers is treated as a single value: a point.

Like points on a graph, Swift uses tuples to group related values together so you can work with them as a single value.

Let's get back to dictionaries. You already know that entries in a dictionary consist of a key and a value—a pair of values. It's often useful to work with key-value pairs as though they are a single entity, such as when iterating over them in a `for` loop. That is why you get a tuple back every time you iterate over an element of a dictionary in a `for` loop.

While it's often convenient to work with that key-value pair as though it is a single value, there are times when you want to work with individual parts of that tuple. Luckily, Swift provides an easy way to break that tuple into its separate parts, so you can work with them individually.

When looping over a dictionary in a `for` loop, you can declare constants for each element of the key-value tuple that is returned to decompose the tuple into separate parts. You can modify the `for` loop for your dictionary to get both the key and the value and print them out:

```
for (season, color) in seasonColors {
    print(season)
    print(color)
    print()
}
```

In the first line of the `for` loop, you declared the constants `season` and `color`. A tuple is declared by putting its elements in parentheses. Within the for loop, `season` and `color` will hold values for the key and value, respectively, of each element of the dictionary.

Now that you know how to work with tuples in `for` loops, you can easily print out the sentence "{Season} reminds me of {color}" for each element of your dictionary:

```
for (season, color) in seasonColors {
    print("\(season) reminds me of \(color)")
}
```

## Tuples vs. Arrays

At first glance, tuples appear to be a lot like arrays. Both are data structures that can hold multiple items and are treated like a single value. What, then, differentiates a tuple from an array?

Tuples differ from arrays in two key ways. The first is that an array must contain objects of the same type: string, integers, floating point numbers, and so on. A tuple can contain elements of different types. A tuple could
contain two strings, or a string and an integer, or three floating point numbers and a dictionary—whatever you want it to contain.

The second way in which tuples differ from arrays is that they are _immutable_. Immutable means that the tuple's elements cannot be changed after the tuple is created. You can't change the first element from one string to another, or add new elements to a tuple. If a tuple is created with two strings, it will always have two strings—period.

## Creating Tuples

Tuples are commonly used when you want to return multiple values from a function. Sometimes it is useful to return more than one value from a function, but in Swift, a function can only return one value. This is where tuples come in handy: A tuple is a _single value_ that contains multiple items.

Imagine you want to create a function that returns both the quotient and remainder of an integer division operation. You can easily return both values using a tuple, as shown here:

```
func divmod(n: Int, _ d: Int) -> (Int, Int) {
    let q = n / d
    let r = n % d
    return (q, r)
}
```

As the example above shows, the syntax for creating a tuple is surrounding a set of values (however many you want) in parentheses. The values can be literals or other constants or variables, as shown in the case above.

You can also create tuples the same way you create other constants or variables:

```
let t = (10, "foo")
```

You can also decompose a tuple into is individual parts:

```
let x = (10, "foo", 100.1)
let (a, b, c) = x
```

You can also access parts of a tuple by index:

```
let y = (10, "foo")
let fooStr = y.0
```

Like arrays, tuple indices start numbering at 0.

You can also name the elements of a tuple, which allows you to access each individual element by name, rather than having to know and remember a specific index. It can be especially helpful to name the elements of a tuple when returning them from a function.

```
let p = (xcoord: 10, ycoord: 6)
print(p.xcoord)
print(p.ycoord)
```

## Examples

The examples for this lesson can be found in the `Tuples.playground` in this repo. Open it up in Xcode and play around with the examples to get a better feel for how tuples work.
