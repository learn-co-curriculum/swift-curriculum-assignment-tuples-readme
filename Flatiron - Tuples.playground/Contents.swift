//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let sampleTuple = ( alpha:34, beta:"who?", gamma:[1, 4, 16 ] )

print(sampleTuple.0)
print(sampleTuple.gamma)

let list = [ "Darth", "Ben", "Luke" ]
print( list[1] )


let simpleDictionary = [ "Darth":"big baddie", "Ben":"mentor", "Luke":"protagonist" ]
let richerDictionary = [
	"Darth":[ "big baddie", "father of Luke" ],
	"Ben":[ "mentor", "trainer of Darth" ],
	"Luke":[ "protagonist", "son of Darth" ]
	]
print( richerDictionary[ "Darth" ] )
print( richerDictionary[ "Darth" ]![1] )


for name in list {
	print(name)
}


for (name, role) in simpleDictionary {
	print(name + " is the " + role + " in Star Wars")
}



let simpleTuple = ( 34, "who?", gamma:[1, 4, 16 ] )
print( simpleTuple.0 )



func dataSetStuff( data:[Double] ) -> (smallest :Double, largest :Double, average :Double, median :Double) {
	var smallest = 0.0
	var largest = 0.0
	var average = 0.0
	var median = 0.0
	// NB  for simplicity we're leaving off the computation of the median
	return ( data.reduce(data[0], combine: { min($0, $1) }), data.reduce(data[0], combine: { max($0, $1) }), data.reduce(0, combine: +) / Double(data.count), median)
}

let numbers = [ 23.0, 66.38, 35.512, 83.2, 41.89 ]
let r = dataSetStuff( numbers )
print(r.smallest)
print(r.average)




var namedTuple = ( alpha:34, beta:"who?", gamma:[1, 4, 16 ] )
print( namedTuple.alpha )
print (namedTuple.0 )  // you can STILL use idices to access if you like

namedTuple.alpha = 79
print(namedTuple)



