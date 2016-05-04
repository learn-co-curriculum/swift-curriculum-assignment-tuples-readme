Learn Tuples with Swift
======================

We've come a long way to learn the fundamentals of Swift. With our knowledge of variables, `Strings`, `Booleans` and collections, we can now create *functions*.  Functions are the building blocks of any application - large or small. To introduce the new (and funny-sounding) idea of `tuples`, let's review how functions can be used to send and receive data.


A Game of Chance
----------------
 Suppose you were creating a game that included the use of dice. You will randomly roll a pair a dice to receive some prize or to advance in the game. With our current knowledge of functions, the actions to start the game may look something like this:


```swift

func startGame() {
    let dice: Int = throwDice()
    print("Congrats - you rolled \(dice)!")
}

//simulate  dice throw
func throwDice() -> Int {
    print("..calculating random results from die throw..")
    
    //generate and return a random number - let's just return 5 for now
    return 5 
}

startGame()

```


Even though we accurately applied what we know, we’ve encountered some issues.  Our requirements state the game involves the throwing of `two` dice, but our `throwDice` function only allows for `one` dice to be thrown at a time. While we could call the function twice to generate `two` random numbers, it would be ideal if we could somehow call `throwDice` once and have it  return `two` independent values.
 

Upon further examination, the `throwDice` return value of `Int` also could cause issues related to readibility. For example, a future developer may wonder if the `Int` return value is indeed the result of the simulated dice throw, or the result of some other calculation.


Tuples as Types
---------------
Fortunately, `tuples` can be used to solve both issues! Let's rewrite (also called *refactor* in the parlance of software engineers) our game to support this new concept:


```swift

func startGame() {
    
    //define tuple to simulate dice
    let dice: (first: Int, second: Int) = throwDice()
    print("Congrats - you rolled a \(dice.first) and \(dice.second) ! ")
}


func throwDice() -> (first: Int, second: Int) {
    print("..calculating random results from die throw..")

    //generate and return a random number - let's just return 5 and 1 for now
    return (5, 1)
}

startGame()

```

 
Here's our game refactored to support tuples. If you've haven't noticed, the `dice` variable included in the `startGame()` function has been updated with an interesting new syntax. Instead of the function returning a single `Int` value, the new type `(first: Int, second: Int)` groups multiple values into a single compound value.

As seen in previous modules, we can declare native Swift types (i.e.`Int`, `String`) as constants, variables or return types. In the case of our refactored `dice` tuple, Swift treats this custom type as value `(first: Int, second: Int)`. In addition, even though `dice` supports two `Int` values, tuples can be of any type and do not have to be of the same type as each other.


Tuples & Collections
--------------------
Beyond variables and return types, tuples can also be used within Swift control structures. Here are two additional ways they can be used to iterate though an `Array` or `Dictionary` collection:


```swift

var numberList: Array<Int> = [8, 2, 10, 7, 5]

//return tuple combination - index & value
for (index, value) in numberList.enumerate() {
    print("the index \(index) contains value \(value)..")
}


let seasonFavColors = ["Winter": "White", "Spring": "Green", "Summer": "Blue", "Fall": "Orange"]

//return tuple combination - name & value pairs
for (season, color) in seasonFavColors {
    print("In the \(season), my favorite color is \(color)")
}

```
