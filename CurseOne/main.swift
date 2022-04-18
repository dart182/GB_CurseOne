//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import Foundation

//MARK: -  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков
///Очередь
struct GenericQueue<T> {
    
    var elements: [T] = []
    
    mutating func pushElement(_ element: T) {
        elements.append(element)
    }
    
    func showList() {
        print(elements)
    }
}

var listOfPeople = GenericQueue<String>()
var listOfNumbers = GenericQueue<Int>()

listOfPeople.pushElement("Artem")
listOfPeople.pushElement("Boris")
listOfPeople.pushElement("Maga")
listOfPeople.pushElement("Oleg")
listOfPeople.pushElement("Grisha")

listOfNumbers.pushElement(1)
listOfNumbers.pushElement(2)
listOfNumbers.pushElement(3)
listOfNumbers.pushElement(4)
listOfNumbers.pushElement(5)

listOfNumbers.elements.filter { $0 % 2 == 0 }

print(listOfNumbers.elements)

print(listOfPeople.elements)

listOfPeople.elements.forEach() {
    print($0)
}


