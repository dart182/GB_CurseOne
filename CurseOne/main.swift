//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import UIKit

// 1

func number(x: Int) -> String {
    if x % 2 == 0 {
        return "Четное"
    } else {
        return "Нечетное"
    }
}

print(number(x: 8))


// 2

func number(x: Int) -> String {
    if x % 3 == 0 {
        return "Делится на 3 без остатка"
    } else {
        return "Не делится на 3 без остатка"
    }
}

print(number(x: 12))


// 3

var array = [Int]()

func getArray(number: Int) {
    for newNumber in 1...number  {
        array.append(newNumber)
    }
}

getArray(number: 100)
print(array)

// 4

var array = [Int]()

func getArray(number: Int) {
    for newNumber in 1...number  {
        if newNumber % 2 != 0 && newNumber % 3 == 0 {
            array.append(newNumber)
        }
        
    }
}

getArray(number: 100)
print(array)
