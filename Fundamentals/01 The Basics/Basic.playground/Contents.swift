import Cocoa

let redColor: String = "red"
let greenColor = "green"
let blueColor = "blue"

var color = "black"

color = redColor

print("Red color value = \(redColor)")

var x = 0.0, y = 0.0, z = 0.0; print(x, y, z, separator: ", ", terminator: " и т.д.")

var name = "Jason"
name = "Any"

// multiline string
print("Multi line string")
var address = """
123 Main st
Apt. 483
Mainville, CA
"""
print(address)
print("-----")

print("Unicode based characters")
/// special character string
let specialChars = "\u{29}\u{2680}"
print("-----")

print("Multi line vs extended delimiters")
/// multiline vs extended delimiters
address = "124 Oak St.\nOaklive, CA"
print(address)
address = #"124 Oak St.\nOaklive, CA"#
print(address)
print("-----")

print("String concatenation")

/// String concatenation
var sentence = "We are learning "
sentence += "Swift programming language"
print(sentence)
print("-----")

/// Iteration over characters in a string
print("iterate over sentence using for in loop")
sentence = "Swift"
for char in sentence {
    print(char)
}
print("-----")

/// Single character
let singleCharacter: Character = "A"

/// Collection / array of characters
let arrayOfCharacters: [Character] = ["A", "n", "i", "m", "a", "l"]
var characterStr = String(arrayOfCharacters)
