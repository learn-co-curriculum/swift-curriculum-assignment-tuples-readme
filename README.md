# Tuples

## Objectives

1. Describe the *tuple* data type
1. Create tuples, name and access their values
1. Use tuples to return multiple values from a function
1. Iterate over the elements of a dictionary using tuples

## Understanding Tuples

You are already familiar with arrays, which allow storing an ordered list of values of the same type. Those can be iterated over using a for-loop, like in this example with the list of seasons:

```swift
let seasons = ["Winter", "Spring", "Summer", "Fall"]

for season in seasons {
  print(season) // e.g. Winter
}
```

In this exercise, we will learn about another type which allows grouping multiple, related values, the *tuple*. A tuple can contain values of any type where each value can be of a different type. However, a tuple is not considered a collection, therefore it is not possible to iterate over its values with a loop.

For example, you may want to store name and age of a person in a single compound value:

```swift
let person = ("Frank", 32)
```

There are multiple ways of accessing the individual values of a tuple. Using index numbers starting with zero:

```swift
print(person.0) // Frank
print(person.1) // 32
```

By assigning the individual values to new variables:

```swift
let (name, age) = person

print(name) // Frank
print(age) // 32
```

**Note** The purpose of tuples is storing related values together temporarily. If you want more complex structures or longer term storage, classes or structs are more suitable. You will learn about them later.

Tuples can also be used to return multiple values from a function, for example:

```swift
func fetchPerson(name: String) -> (age: Int, job: String) {
  let age = 32
  let job = "Janitor"

  return (age, job)
}

let name = "Frank"
let person = fetchPerson(name)
print("\(name) is a \(person.job) and \(person.age) years old.") // Frank is a Janitor and 32 years old.
```

In this case, we are using a *named tuple*. This makes it obvious what each value means without having to read the whole function. However, named tuples are not limited to functions, you can create them anywhere in your program:

```swift
let person = (name: "Frank", age: 32)

print("\(person.name) is \(person.age) years old.") // Frank is 32 years old.
```

Naming tuple values is generally advisable, unless their meaning is clear from the immediate context of their use.

Tuples also offer a convenient way for iterating over the elements of a dictionary. As an example, take a dictionary of favorite colors by season:

```swift
let seasonFavColors = ["Winter": "White", "Spring": "Green", "Summer": "Blue", "Fall": "Orange"]

for (season, color) in seasonFavColors {
  print("In the \(season), my favorite color is \(color)") // e.g. In the Spring, my favorite color is Green
}
```

For each element of the dictionary, the key will be assigned to the first and the value to the second variable of the tuple.
