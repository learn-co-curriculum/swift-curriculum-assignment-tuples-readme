# Tuples

![HelpMe](http://65.media.tumblr.com/tumblr_lfsqif5W2Z1qe1wk7o1_500.jpg)

> Help me, Obi-Wan Kenobi. You are my only hope.

## Learning Objectives
* Describe a tuple as being a type that groups multiple values into a single compound value.
* Explain that values within a tuple can be of any type and do not have to be of the same type as each other.
* Create a tuple and name the individual elements
* Iterate over the key-value pairs in a dictionary where each item is returned as a (key, value) tuple.


## Introduction
You already know that an array is a list of values, and in an array, all of the values have to be of a certain type, i.e. if you have an array of strings, it cannot contain integers.

A tuple is also a list of values, but a tuple's values can be of different types. Also, unlike an array, you can't add values to a tuple once it's defined.

The values in a tuple are generally related to one another. For example, you might have a tuple with a person's name and their age. In this regard, rather than call a tuple a _list_ of values, it would be more accurate to define a tuple as a _group of related values_.

Enough theory, let's dive into some examples!

## Tuples vs Arrays

Did you skip breakfast this morning? Don't worry I have a great assortment of `breakfastBeverages` for you, which should tide you over until your coffee break later in the lesson. :)

We'll start off comparing tuples with arrays. Consider the following array:

```swift
var breakfastBeverages = ["Milk", "Coffee", "Orange Juice"]
```

You can add an item to an array, but you can't add anything to a tuple.

```swift
breakfastBeverages.append("Apple Juice") // ["Milk", "Coffee", "Orange Juice", "Apple Juice"]
```

An array is a great data structure to use for a list of items of a certain type. Now let's consider a case in which an array could be used, but it wouldn't really be appropriate to do so.

Let's say we wanted to store some properties of a beverage, like whether we prefer a certain beverage hot or cold. We'd need to store the beverage name and either "Hot" or "Cold".

Since both items we want to store are strings, we could technically store them in an array. However what would it be an array of? Beverages? Temperatures?

```swift
let temperatureArray = ["Coffee", "Hot"]
let beverageName = temperatureArray[0]
let beverageTemperature = temperatureArray[1]
```

We'd really be misusing an array in order to store an item and a _property_ of that item, rather than another item of that type.

Is there a better way? Yes, we can use a tuple! Change those square brackets to parentheses and you've got yourself a tuple.

```swift
let temperatureTuple = ("Coffee", "Hot")
```

The tuple above is a group of related values. "Hot" describes the temperature of the "Coffee".

As with an array, we access the values in a tuple by index, however there is a difference in syntax. Tuples use dot syntax, i.e. `.0`, instead of the subscripting syntax that arrays use, i.e. `[0]`.

```swift
let beverageName = temperatureTuple.0
let beverageTemperature = temperatureTuple.1
```

If you are following along in a playground and you look at the sidebar you'll see .0 next to "Coffee", and .1 next to "Hot":

![tuple indexes in playground](https://cloud.githubusercontent.com/assets/202240/16925734/04c95e46-4d3f-11e6-9842-97550d93945a.png)


If `temperatureArray` is of type `[String]`, does that mean `temperatureTuple` is of type `(String)`? Nope! It's of type `(String, String)` which indicates that this tuple can only ever have two values which are both of type `String`.

You can verify this by <kbd>Option</kbd> clicking on the variable name in a playground to view the variable's type:

![option-click-to-view-variable-type](https://cloud.githubusercontent.com/assets/202240/16925611/68a0b564-4d3e-11e6-8536-f1c7bcfbd564.png)

The values of this particular tuple can't change since the variable is defined with `let`. However if we define it with `var` we can update it:

```swift
var temperatureTuple = ("Coffee", "Hot")
temperatureTuple.0 = "Milk"
temperatureTuple.1 = "Cold"
```

The value of `temperatureTuple` is now `("Milk", "Cold")`.

Even though `temperatureTuple` is now a variable tuple (since we defined it with `var`) you still can't add a new value to it, i.e. you can't make it a `(String, String, String)` or a `(String, String, Int)`. You also cannot remove an existing value from it. It was born as a `(String, String)` and it will forever remain a `(String, String)` up until the day it is garbage collected.

Let's get back to our coffee. We've established that we like our coffee "Hot". But what does "Hot" really mean? Do you prefer your coffee lip-scalding hot, or do you prefer a temperature that's a bit more sane? What we really need to do is to store the actual temperature in degrees.

Let's create a new tuple for that:

```swift
let preciseTemperatureTuple = ("Coffee", 160) // 160°F == 71°C.
```

The type of `preciseTemperatureTuple` is `(String, Int)`.

You could have also written this as:

```swift
let preciseTemperatureTuple: (String, Int) = ("Coffee", 160)
```

Now that you have a basic understanding of tuple syntax, let's take a look at how you would actually use a tuple as the return value of a function or a method.


## Tuples as Return Values

In Swift, functions can only return one object, but we can use tuples to return multiple values in a single tuple object.

Ok so it's time for that coffee break. You've been here reading about tuples all morning and now decide that you need a cup of coffee. You head over to Joe's Jamin Java Cafe since it has this new "Swift Serve" feature (pun intended). When you swipe your credit card, it automatically starts an order for your preferred coffee, in your preferred size, and at your preferred temperature. For example it would know that you prefer a 10.5 oz Cappuccino, at an ideal 160°F.

Joe is the owner and he coded the "Swift Serve" feature himself. He's a reformed Java developer that's slowly learning Swift, but he doesn't yet know about tuples since Java did not have them.

The "Swift Serve" feature is based on 3 methods that are used to fetch your coffee preferences.

```swift
func preferredCoffeeNameForCustomer(customerID: Int) -> String
func preferredCoffeeOuncesForCustomer(customerID: Int) -> Double
func preferredCoffeeTemperatureForCustomer(customerID: Int) -> Int
```

Since Joe uses Amazon Web Services, all of the data is stored in the cloud on remote servers, and there is a cost associated with each query that is made. With each query we receive all of the data but we only return one part of data in each of the methods. It seems wasteful to fetch the same data three different times.

```swift
let name = preferredCoffeeNameForCustomer(customerID)
let ounces = preferredCoffeeOuncesForCustomer(customerID)
let temperature = preferredCoffeeTemperatureForCustomer(customerID)
```

Is there a way that you can reduce these 3 method calls into a single one? Yes! Just return all three values at once in a tuple.

Let's convert one of the methods to return a tuple and then we can delete the other two:

Before:
```swift
func preferredCoffeeNameForCustomer(customerID: Int) -> String {
    let customerData = makeExpensiveAndSlowNetworkRequestToGetPreferencesForCustomer(customerID)
    // Data processing logic: extract coffeeName from customerData
    return coffeeName
}
```

After:
```swift
func preferencesForCustomer(customerID: Int) -> (String, Double, Int) {
  let customerData = makeExpensiveAndSlowNetworkRequestToGetPreferencesForCustomer(customerID)
  // Data processing logic: extract coffeeName, ounces, and temperature from customerData
  return (coffeeName, ounces, temperature)
}
```

You can see that this returns a tuple of type `(String, Double, Int)`.

This is how you would call the new method and store the returned tuple in a variable:

```swift
let preferencesTuple = preferencesForCustomer(customerID)
```

Now that you have the tuple, how would you access the individual elements? Recall the index based dot notation syntax you learn about earlier:

```swift
let name = preferencesTuple.0
let temperature = preferencesTuple.1
let ounces = preferencesTuple.2
```

Can you spot a problem in the code above?

Instead of 10.5 ounces of coffee at 160°F, you are about to get 160 ounces of coffee at 10.5°F. (Yes that would be a very large block of ice... coffee.)

Whoops, this is what it should have been:

```swift
let name = preferencesTuple.0
let ounces = preferencesTuple.1
let temperature = preferencesTuple.2
```

It would be great if instead of using .0, .1, and .2 you could use actual names. And you can, with named tuples!

## Named Tuples

In order to name the members of a tuple, all you have to do is add a variable name and a colon before the type:

For example:
```swift
let namedTuple = (name: "Jim", age: 30)
```

The type of this tuple is `(name: String, age: Int)`.

Now you can the access the values this way:
```swift
let name = namedTuple.name
let age = namedTuple.age
```

Let's make the `preferencesForCustomer` method return a named tuple. You would update the method signature to the following:

```swift
func preferencesForCustomer(customerID: Int) -> (name: String, ounces: Double, temperature: Int)
```

Now you can access the values like this:

```swift
let preferencesTuple = preferencesForCustomer(customerID)
let name = preferencesTuple.name
let ounces = preferencesTuple.ounces
let temperature = preferencesTuple.temperature
```

Which makes it a lot harder to make mistakes such as the following:
```swift
let ounces = preferencesTuple.temperature // Whoops, don't need 160 ounces of coffee
```

## Decomposing a Tuple

You can also decompose a tuple into individual variables in a single line.

```swift
let preferencesTuple = preferencesForCustomer(customerID)
let (name, ounces, temperature) = preferencesTuple
```

Which means that you can also call the method this way:
```swift
let (name, ounces, temperature) = preferencesForCustomer(customerID)
```


## Tuples in Dictionaries

You already know how to iterate over an array, but did you know that you can also iterate over a dictionary in the same way?

Let's say you have a dictionary that contains the name and the price of a cup of coffee:

```swift
let coffeeCostDictionary = [
    "Latte": 3.65,
    "Cappuccino": 4.45,
    "Americano": 3.35
]
```

You'd like to print out the name and price for each item in the dictionary.

You know how to write a for loop. But what would you put in the body in order to get the name and price from the item?

```swift
for item in coffeeCostDictionary {
  // Print the name and the price
}
```

So what exactly is an `item`? It's actually a tuple that contains a single key and value pair from the dictionary, i.e. its a tuple of type `(String, Int)`. You know what to do:

```swift
for item in coffeeCostDictionary {
    print("The cost of a \(item.0) is $\(item.1)")
}

// Prints:
// The cost of a Latte is $3.65
// The cost of a Americano is $3.35
// The cost of a Cappuccino is $4.45
```

Mission accomplished! But can we use something other than `.0` and `.1`?

Since dictionary tuples are unnamed tuples, there is not a named dot-property we can access. It would have been really nice to be able to do the following:

```swift
for item in coffeeCostDictionary {
    print("The cost of a \(item.name) is $\(item.price)") // Compile error: Value of tuple type '(String, Double)' has no member 'name'
}
```

We can do something else though. Do you recall that we can decompose a tuple into a list of variables on a single line?

```swift
for item in coffeeCostDictionary {
    let (name, price) = item
    print("The cost of a \(name) is $\(price)")  // Works!
}
```

And we really don't need the item variable since we can also do the following:

```swift
for (name, price) in coffeeCostDictionary {
    print("The cost of a \(name) is $\(price)")  // Also Works!
}
```

## Conclusion

You've learned about tuples, how to name members of a tuple, and have learned about how a tuple is similar to, and how it is different from an array. You've also learned how to return multiple values from a function with the use of tuples. In reality tuples are not used that much in Swift, but you'll know when the time is right to use one. It will be when you have a function in which you've been returning a value but now need to return another value as well and wished there was a way to do so. Then you'll recall that there is indeed a way to do so, and all will be good in the world.
