# Writing Assignment - Tuples

So far you have seen how to use arrays for holding a set of values and then iterate through them, for example:

```swift
var distances: [Int] = [10, 15, 20]

for distance in distances {
  print(distance)
}
```

Arrays are a useful method for collecting variables, but limited as the values they contain can only be of one type. In this exercise we will introduce another, more flexible content type, the tuple.

A tuple is a flexible variable type that allows you to group multiple variables into one convenient compound variable. The variables contained within a tuple can be of any type (for example a string, integer or even arrays) and you can mix the types. This makes tuples useful for creating a container variable for related values, for example:

```swift
let completedDistance = ("km", 10, true)
```

This tuple represents an entry from a fitness tracker, recording a distance unit as a string, a distance as an integer and a boolean to show completion.

**Note**: Tuples are designed for short term groups of related data and not for data that is accessed frequently in an application. Long term data storage is generally handled by classes, which you will learn later.

You can access the values inside a tuple using index numbers, for example:

```swift
print ("You ran \(completedDistance.1)\(completedDistance.0)")
```

But a better method is to decompose the tuple structure into separate variables and access those variables, for example:

```swift
let (distanceUnit, distanceQuantity, distanceAchieved) = completedDistance
print ("You ran \(distanceQuantity)\(distanceUnit)")
```

This method also lets you tidily mix the values in the tuple with text descriptions, or more practically, the labels of interface elements.

A perfect use of tuples is to take their value(s) from a function, for example:

```swift
func formatRun(userName: String) -> (distanceUnit: String, distanceQuantity: Int, distanceAchieved: Bool) {
  var unit = "km"
  var quantity = 100
  var achieved = true

  return (unit, quantity, achieved)
}

let computedDistance = formatRun("Bob")

print("\(computedDistance.distanceUnit) and \(computedDistance.distanceQuantity) and \(computedDistance.distanceAchieved)")

```

This is a simplified function as you haven't covered functions or logic in detail yet, but a function is a reusable section of code. The theoretical example above takes a user's name, passes it to a function and based on a user's preferences outputs the appropriate values for that user. You could repeat this for every user registered with your app.

Another common use of a tuple is as an individual pair when iterating a Dictionary of pairs, for example a collection of runs:

```swift
var runs = [1: 10, 2: 15, 3: 20]

for (runNumber, runDistance) in runs {
    print("\(runNumber): \(runDistance)")
}
```
