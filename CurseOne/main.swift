//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import UIKit

//1

func number(x: Int) -> String {
    if x % 2 == 0 {
        return "Четное"
    } else {
        return "Нечетное"
    }
}

print(number(x: 8))

//2

func number(x: Int) -> String {
    if x % 3 == 0 {
        return "Делится на 3 без остатка"
    } else {
        return "Не делится на 3 без остатка"
    }
}

print(number(x: 12))
