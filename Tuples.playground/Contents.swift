/*:
# Tuples

## Objectives

1. Describe the *tuple* data type
1. Create tuples, name and access their values
1. Use tuples to return multiple values from a function
1. Iterate over the elements of a dictionary using tuples

## Understanding Tuples

You are already familiar with arrays, which allow storing an ordered list of values of the same type. Those can be iterated over using a for-loop, like in this example with the list of seasons:
*/
let seasons = ["Winter", "Spring", "Summer", "Fall"]

for season in seasons {
  print(season)
}
/*:
In this exercise, we will learn about another type which allows grouping multiple, related values, the *tuple*. A tuple can contain values of any type where each value can be of a different type. However, a tuple is not considered a collection, therefore it is not possible to iterate over its values with a loop.

For example, you may want to store name and age of a person in a single compound value:
*/
let person = ("Frank", 32)
//: There are multiple ways of accessing the individual values of a tuple. Using index numbers starting with zero:
print(person.0)
print(person.1)
//: By assigning the individual values to new variables:
let (pName, pAge) = person

print(pName)
print(pAge)
/*:
**Note** The purpose of tuples is storing related values together temporarily. If you want more complex structures or longer term storage, classes or structs are more suitable. You will learn about them later.

Tuples can also be used to return multiple values from a function, for example:
*/
func fetchPerson(name: String) -> (age: Int, job: String) {
  let age = 32
  let job = "Janitor"

  return (age, job)
}

let name = "Frank"
let anotherPerson = fetchPerson(name)
print("\(name) is a \(anotherPerson.job) and \(anotherPerson.age) years old.")
//: In this case, we are using a *named tuple*. This makes it obvious what each value means without having to read the whole function. However, named tuples are not limited to functions, you can create them anywhere in your program:
let otherPerson = (name: "Frank", age: 32)

print("\(otherPerson.name) is \(otherPerson.age) years old.")
/*: 
Naming tuple values is generally advisable, unless their meaning is clear from the immediate context of their use.

Tuples also offer a convenient way for iterating over the elements of a dictionary. As an example, take a dictionary of favorite colors by season:
*/
let seasonFavColors = ["Winter": "White", "Spring": "Green", "Summer": "Blue", "Fall": "Orange"]

for (season, color) in seasonFavColors {
  print("In the \(season), my favorite color is \(color)")
}
//: For each element of the dictionary, the key will be assigned to the first and the value to the second variable of the tuple.
