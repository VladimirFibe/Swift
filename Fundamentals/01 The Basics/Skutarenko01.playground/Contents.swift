import SwiftUI

/// Создать характеристики студента, через константы или переменные, чтобы это было имя, фамилия, рост, вес, возраст.
/// Вывести красиво имя студента и фамилию в консоль, используя команду print

let firstname = "Владимир"
let lastname = "Файб"
let height = 184
let weight = 90.5
let age = 54

let info = """
            Фамилия: \(lastname)
            Имя: \(firstname)
            Рост: \(height)
            Вес:\(weight)
            Возраст: \(age)
            """
print(info)

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0
print(x, y, z)

var welcomeMessage: String
welcomeMessage = "Hello"
print(welcomeMessage)

var red, green, blue: Double
red = 0
green = 0
blue = 0

let π = 3.14159
let 你好 = "你好世界"
let 🐭 = "dogcow"
let `default` = "default"
print(🐭, 你好, π, `default`)

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++"

print("Текущее значение friendlyWelcome равно \(friendlyWelcome)")
