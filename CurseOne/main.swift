//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import Foundation

// MARK: 1. Написать функцию, которая определяет, четное число или нет.

func numberEven(number: Int) -> Bool {
    number % 2 == 0 ? true : false
}

print(numberEven(number: 9))
print("---------------------------")

// MARK: 2. Написать функцию, которая определяет, делится ли число без остатка на 3.


func numberDivThree(number: Int) -> Bool {
    number % 3 == 0 ? true : false
}

print(numberDivThree(number: 11))
print("---------------------------")

// MARK: 3. Создать возрастающий массив из 100 чисел.

var array = [Int]()

for newNumber in 1...100  {
    array.append(newNumber)
}

print(array)
print("---------------------------")

// MARK: 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var count = 0
for newNumber in array  {
    if numberEven(number: newNumber) || !numberDivThree(number: newNumber) {
        array.remove(at: count)
    } else {
        count += 1
    }
}
//
//var count = 0
//for newNumber in array  {
//    if newNumber % 2 == 0 || newNumber % 3 != 0 {
//        array.remove(at: count)
//    } else {
//        count += 1
//    }
//}

print(array)
print("---------------------------")
