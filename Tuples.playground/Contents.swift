let shoppingList = ["milk", "eggs", "bread"]
for item in shoppingList {
    print(item)
}

let seasonColors = [
    "autumn": "red",
    "winter": "grey",
    "spring": "green",
    "summer": "yellow"
]
for item in seasonColors {
    print(item)
}
for (season, color) in seasonColors {
    print(season)
    print(color)
    print()
}
for (season, color) in seasonColors {
    print("\(season) reminds me of \(color)")
}

func divmod(n: Int, _ d: Int) -> (Int, Int) {
    let q = n / d
    let r = n % d
    return (q, r)
}
divmod(23, 6)


let t = (10, "foo")

let x = (10, "foo", 100.1)
let (a, b, c) = x

let y = (10, "foo")
let fooStr = y.0

let p = (xcoord: 10, ycoord: 10)
print(p.xcoord)
print(p.ycoord)
