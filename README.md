# Tuples 


## Learning Objectives (Students will be able to ....) 
- Describe a tuple as being a type that groups multiple values into a single compound value.
- Explain that values within a tuple can be of any type and do not have to be of the same type as each other.
- Iterate over the key-value pairs in a dictionary where each item is returned as a (key, value) tuple.
- Create a tuple and name the individual elements

## What the Student Already Knows
A student should already understand the concept of variables, constants, Int, String, Bool, Array, Dictionary and functions but not Tuples.

## Outline/ Nots

* Start with the known- students know how to iterate over arrays. Show an example of iterating over an array. 
    * Present some real world problem such as, “If you have a dictionary where the keys represent the seasons and the values represent your favorite color associated with that season, is there an easy way to print out a list that for each sentence and color that says “In the {season} my favorite color is {color}.”
    - If you have a better example feel free to use it, but always aim for a real world example. And you can use that example throughout the rest of your reading and/or use other new examples. 
    * The answer is tuples and this sets the stage for writing the content that covers your learning objectives above.--- You can iterate over the key-value pairs in a dictionary with a for-in loop. Each item in the dictionary is returned as a (key, value) tuple. Explain how you can decompose the tuple’s members into temporary constants as part of the iteration.
    
```
let seasonFavColors = ["Winter": "White", "Spring": "Green", "Summer": "Blue", "Fall": "Orange"]

for (season, color) in seasonFavColors {
   			 print("In the \(season), my favorite color is \(color)")
}
```

* Think about why you would want to create you own tuple. (Typically it would be when you want to return multiple types from a function. Try to be creative and think of a concrete example.) This sets the stage for explaining how to create a tuple. Create a tuple where they name the individual elements when it is defined.
    
