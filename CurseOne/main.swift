//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import Foundation

// 1

func numberEven(number: Int) -> String {
    if number % 2 == 0 {
        return "Четное"
    } else {
        return "Нечетное"
    }
}

print(numberEven(number: 9))
print("---------------------------")

// 2

func numberDivThree(number: Int) -> String {
    if number % 3 == 0 {
        return "Делится на 3 без остатка"
    } else {
        return "Не делится на 3 без остатка"
    }
}

print(numberDivThree(number: 11))
print("---------------------------")

// 3

var array = [Int]()

for newNumber in 1...100  {
    array.append(newNumber)
}

print(array)
print("---------------------------")

// 4

var newArray = [Int]()

for newNumber in 1...100  {
    if newNumber % 2 != 0 && newNumber % 3 == 0 {
        newArray.append(newNumber)
    }
}

print(newArray)
print("---------------------------")
