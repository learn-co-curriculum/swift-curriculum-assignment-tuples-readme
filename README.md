# Tuples 

## Understanding Tuples

Imagine that you are planning on hosting a Game of Thrones viewing party! You want to make sure all your guests have whatever foods and beverages they like most. So, you of course need to make a grocery list. There's a lot of different foods and beverages that all your guests may want, and you want to keep track of how much to get

## Tuples as a Compound Type

We already know that we can iterate over arrays:

```swift
let favorite_candies = [
    "Skittles",
    "Starbursts",
    "Reeses Pieces"
]

for favorite_candy in favorite_candies {
    print("\(favorite_candy). Yum!")
}

// Skittles. Yum!
// Starbursts. Yum!
// Reeses Pieces. Yum!
```

This is useful and delicious, but do we want 1 Skittle, or a 1000? With tuples, we can keep track quite a bit better. Let's ask our guests what they want. We'll define three basic classes, GoTSansa, GoTTyrion, and GoTSandor.

```swift
class GoTSansa
{
    let grocery = "Lemoncake"
    let amount = 2

    func wants() -> (food: String, amount: Int)
    {
        return (food, amount)
    }
}

class GoTTyrion
{
    let grocery = "Wine"
    let amount = 3

    func wants() -> (grocery: String, amount: Int)
    {
        return (grocery, amount)
    }
}

class GoTSandor
{
    let grocery = "Chicken"
    let amount = 5

    func wants() -> (grocery: String, amount: Int)
    {
        return (grocery, amount)
    }
}
```

Each of these classes will return a tuple when their respecrtive wants() function is called. The tuple is a combination of the grocery and the amount of the grocery they want.

Now, let's put this together to make our grocery list.

```swift

//initialize our class instances
let sansa = GoTSansa()
let tyrion = GotTyrion()
let the_hound = GoTSandor()

//initialize an array of strings to represent our grocery list
var grocery_list = [String]()

//this function will return a compound type, a tuple, with a grocery item and the amount of the item to get
let sansa_grocery_tuple = sansa.wants()

//get the amount from the tuple - you can index an item with "dot syntax" like so!
let sansa_amount = sansa_grocery_tuple.amount

//get the specific item from the tuple
let sansa_grocery = sansa_grocery_tuple.grocery

//add to our grocery list the amount Sansa wants
for i:Int in 0..sansa_amount
{
    grocery_list.append(sansa_grocery)
    print("adding \(sansa_grocery) for Sansa")
}

//Prints:
//adding Lemoncake for Sansa
//adding Lemoncake for Sansa

//now, let's do the same for our other two characters!

let tyrion_grocery_tuple = tyrion.wants()

let tyrion_amount = tyrion_grocery_tuple.amount

let tyrion_grocery = tyrion_grocery_tuple.grocery

//add to our grocery list the amount Tyrion wants
for i:Int in 0..tyrion_amount
{
    grocery_list.append(tyrion_grocery)
    print("adding \(tyrion_grocery) for Tyrion")
}

//Prints:
//adding Wine for Tyrion
//adding Wine for Tyrion
//adding Wine for Tyrion

let hound_grocery_tuple = the_hound.wants()

let hound_amount = hound_grocery_tuple.amount

let hound_grocery = hound_grocery_tuple.grocery

//add to our grocery list the amount Tyrion wants
for i:Int in 0..hound_amount
{
    grocery_list.append(hound_grocery)
    print("adding \(hound_grocery) for the Hound")
}

//Prints:
//adding Chicken for the Hound
//adding Chicken for the Hound
//adding Chicken for the Hound
//adding Chicken for the Hound
//adding Chicken for the Hound

```

Now, our grocery list will be all set and when we're at the store.

## But, wait, there's more

I think most of us write our grocery lists with the amount of the grocery, instead of writing each down multiple times. Tuples can be a great help here too.

We can define tuples not just as something returned from a function, but in the wild too.

```swift

let list = ["Chicken": 5, "Wine": 3, "Lemoncake": 2]

```

That's quite a bit leaner, don't you think? To finish it off, print our nice tuple array.

```swift

for grocery, amount in list
{
    print("We need to get \(amount) \(grocery)s")
}

//Prints:
//We need to get 5 Chickens
//We need to get 3 Wines
//We need to get 2 Lemoncakes

``` 

Lastly, make sure Tyrion doesn't drive!
