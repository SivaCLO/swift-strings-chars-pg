
import UIKit

/*

A String is an ordered collection of Characters. Swift has got it's own data type called "String", which internally represents a collection of values of "Character" data type.

Swift's String type is bridged seemlessly to Foundation's NSString. The entire NSString API is available to call on any String value. You can also use a String value with any API that requires an NSString instance.
*/

var sampleNSString :NSString = "Hello"
var sampleString :String = sampleNSString

/* # String Literals

String literals are predefined String values that can be used as an initial value for a constant or variable.
*/

let testString = "Any thing you want"

/* String literals support escaped special characters (\0, \\, \t, \n, \r, \", \') and unicode scalars */

let stringWithEsc = "\t \"Testing Tab Char\""

let dollarSign = "\x24"        // $,  Unicode scalar U+0024
let blackHeart = "\u2665"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\U0001F496"  // 💖, Unicode scalar U+1F496

/* Empty Strings are used as a starting point to build longer Strings.
*/

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty { // Check if a String is empty
    "Empty String found"
}

/* # String Mutability

You indicate whether a particular String can be modified (or mutated) by assigning it to a variable (in which case it can be modified), or to a constant (in which case it cannot be modified):
*/

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander" // Compile time error


/* #Strings are Value Types

String value is copied when it is passed to a function or method, or when it is assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version. This behaviour differs from NSString. NSString is always passed by reference. No copying of the string takes place, unless you specifically request it.

*/

var param = "Test Param"

func sampleFunc(var param: String) {
    param = "Changing Param"
}

sampleFunc(param)
param // Value not changed

/* # Counting Characters
*/

let unusualMenagerie = "Koala, Snail, Penguin, Dromedary 🐪"
countElements(unusualMenagerie) // Iterates and finds the number of displayed Unicode chars.
unusualMenagerie.utf16count // Equivalent to length property. It counts every 16-bit as one character. This method is renamed in swift for clarity


/* # Concatenating Strings and Characters

String and Character values can be added together (or concatenated) with the addition operator (+) to create a new String value

*/

let string1 = "hello"
let string2 = " there"
let character1: Character = "!"
let character2: Character = "?"

let stringPlusCharacter = string1 + character1
let stringPlusString = string1 + string2
let characterPlusString = character1 + string1
let characterPlusCharacter = character1 + character2

var instruction = "look over"
instruction += string2 // Addition Assignment operator

/* # String Interpolation

String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal.

*/

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

/* # Comparing Strings

Swift provides three ways to compare String values: string equality, prefix equality, and suffix equality.

#String Equality

Two String values are considered equal if they contain exactly the same characters in the same order:
*/

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    "These two strings are considered equal"
}

/* #Prefix and Suffix Equality
Swift has got two special methods to check whether a string has a particular string prefix or suffix. Both methods perform a character-by-character comparison between the base string and the prefix or suffix string.
*/

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}
"There are \(act1SceneCount) scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}
"\(mansionCount) mansion scenes; \(cellCount) cell scenes"

/* #Uppercase and Lowercase Strings

You can access an uppercase or lowercase version of a string with its uppercaseString and lowercaseString properties
*/

let normal = "Could you help me, please?"
let shouty = normal.uppercaseString
let whispered = normal.lowercaseString

/* #Unicode

Swift’s String and Character types are fully Unicode-compliant. They support a number of different Unicode encodings
*/

let dogString = "Dog!🐶"
var utf8Result = ""

for codeUnit in dogString.utf8 {
    utf8Result += "\(codeUnit) "
}
utf8Result

var utf16Result = ""

for codeUnit in dogString.utf16 {
    utf16Result += "\(codeUnit) "
}
utf16Result

var unicodeScalarResult = ""

for scalar in dogString.unicodeScalars {
    unicodeScalarResult += "\(scalar.value) "
}
unicodeScalarResult


