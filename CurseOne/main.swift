//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import Foundation

//MARK: -  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков
///Очередь
class GenericQueue<T> {
    
    var elements = [T]()
    
    func pushElement(_ element: T) {
        elements.append(element)
    }
    
    func showList() {
        print(elements)
    }
}

var listOfPeople = GenericQueue<String>()

listOfPeople.pushElement("Artem")
listOfPeople.pushElement("Boris")
listOfPeople.pushElement("Maga")
listOfPeople.pushElement("Oleg")
listOfPeople.pushElement("Grisha")

print(listOfPeople.elements)

//MARK: - 2. Добавить ему несколько методов высшего порядка
var listOfClanPeople = listOfPeople.elements.map({$0 + " [DEV]"})

var listOfClanPeopleSorted = listOfClanPeople.sorted(by: {$0 < $1})

listOfClanPeopleSorted.forEach() {
    print($0)
}



