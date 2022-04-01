//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import UIKit

func number(x: Int) -> String {
    if x % 2 == 0 {
        return "Четное"
    } else {
        return "Нечетное"
    }
}

print(number(x: 8))
