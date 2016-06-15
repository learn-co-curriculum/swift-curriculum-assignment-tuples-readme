
##What's a Tuple?
Tuples are a very specialized way of grouping and organizing data, and to best understand their value, limitations and purpose we'll compare and contrast them to Arrays, Dictionaries and Classes.

**Arrays** help you manage variably-sized ordered collections of similar data, such as a list of numbers or strings.  For example, we can make an array of some key characters from the movie Star Wars:
```
// Array
let list = [ "Darth", "Ben", "Luke" ]
print( list[1] )
```
Arrays are pretty useful but they're somewhat limited in that their contents can *only* be accessed via indices. 

**Dictionaries** (as you might imagine by the name) help you manage data by mapping bits of it to keys, just like a language dictionary maps definitions to words.  The examples below use strings and arrays of strings but you could use almost anything (subject to certain rules that we'll cover in a later session).
```
// Dictionary
let simpleDictionary = [ "Darth":"big baddie", "Ben":"mentor", "Luke":"protagonist" ]
let richerDictionary = [
	"Darth":[ "big baddie", "father of Luke" ],
	"Ben":[ "mentor", "trainer of Darth" ],
	"Luke":[ "protagonist", "son of Darth" ]
	]
print( richerDictionary[ "Darth" ] )
[ "big baddie", "father of Luke" ]
print( richerDictionary[ "Darth" ]![1] )
"father of Luke"
```
Dicitionaries are very useful when you want a natural way of accessing contents and, crucially, you have a way of uniquely identifying each entry.

**Classes and Structs** You may have already heard about these but they haven't yet been covered in class.  In brief, classes and structs are a powerful way to represent data because they guarantee the presence of specific properties (kind of like a dictionary which guarantees that there are entries for specific keys and, furthermore, can't have any more or fewer entries).  Classes and Structs are great to model specific types of data where you know exactly what should be present, such as a "Student" having a first name, last name, and array of test grades.

**Tuples** are a special kind of tool that combine properties of arrays, dictionaries, and classes but are not interchangeable with any of them.  Yup, you read that right, they're kind of like a Franken-data structure.  
Like an array tuples allow you to access their contents by index.  
Like a dictionary tuples allow you to access their contents by name (if you specify names). 
Like a class or struct tuples have *exactly* the contents described in their declaration and of the type indicated in their declaration.  (This is checked for you by the compiler.  Remember, one of the key aspects of Swift is type-safety).

Arrays and Dictionaries are open-ended: they can contain some elements, thousands of elements or no elements, and the contents can grow or shrink.  They're the right solution when you don't know exactly what you have and need to iterate over the contents to search for an item or do something to each element.

Classes, Structs and Tuples are closed: once they've been declared the compiler will guarantee you exactly what they.  They're the right solution when you want to represent structured data and get help from the compiler to make sure its correct.

##What's a tuple good for?
Now you're probably wondering why on earth you would want to use a tuple and, if that's where your mind has gone, I can't blame you.  Rest assured that there *are* some circumstances where a tuple is extremely useful, kind of like that weird tool you walk by in the hardware store that twists your mind but, in the right hands and in the right situation, can get the job done like nothing else.

Tuples are the tool of choice when you want to pass highly structured data *to* a function or return highly structured data *from* a function but don't need the additional capabilities of a full-blown class or struct and don't want to go through the trouble of creating one.

The most common time you'll find yourself using a tuple is iterating over a dictionary.  Iterating over an array returns *one* thing (an element) for each pass of the iteration, but iterating over a dictionary returns *two* things for each pass (namely the key and the value) .  Therefore, the iteration returns a tuple to you (with the key and value components correctly typed to how the dictionary was declared).

**iteration**
```
// iterate over an array
for name in list {
	print(name)
}
"Darth"
"Ben"
"Luke"

// iterate over a Dictionary (note the tuple)
for (name, role) in simpleDictionary {
	print(name + "is the " + role + " in Star Wars")
}
Luke is the protagonist in Star Wars
```

**Returning multiple values from functions**
You can use a tuple to easily return related data from a function.  For example, here's a function that shows how you can, in a single line of code, return useful related information about a series of numbers that otherwise would take *four* lines of code:
```
func **dataSetStuff**( data: [Double] ) -> (**smallest** :Double, **largest** :Double, **average** :Double, **median** :Double) { 
	var smallest = 0.0
	var largest = 0.0
	var average = 0.0
	var median = 0.0
	...  // compute the values and assign them appropriately
	return (smallest, largest, average, median)
	 }
You call the function and **use the returned tuple** like this:
let numbers = [ 23.0, 66.38, 35.512, 83.2, 41.89 ]
let r = dataSetStuff( numbers )
print( r.smallest )
23.0
print( "average: " + r.average ", ", median: " + r.median )
average: 50.0, median: 41.89
You **create a tuple** like this:
let simpleTuple = ( 34, "who?", gamma:[1, 4, 16 ] )
print( simpleTuple.0 )
34
```

You create a tuple with **property names** like this:
```
// note how we're specifying keys for each value in the tuple
let namedTuple = ( alpha:34, beta:"who?", gamma:[1, 4, 16 ] )
print( namedTuple.alpha )
34
print (namedTuple.0 )  // you can STILL use idices to access if you like
34
```

You can also change the value assigned to any index or key after creating the tuple (you just can't change the keys or types of each element).
```
namedTuple.alpha = 79
print(namedTuple)
( 79, "who?", [1, 4, 16] )
namedTuple.alpha = "hello"
*Error*
```
As you might imagine there are many possibilities for what you can do with tuples and the bread-and-butter examples above should give you an appreciation of just how useful they are in the specific cases they're designed to be used in.

Experiment with the examples above in the Playground provided to solidify your understanding and appreciation of Tuples.







