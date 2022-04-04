//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import Foundation

enum CarBrend: String {
    case kia
    case bmw
    case mercedes
    case lamborghini
}

enum EngineStatus {
    case start
    case stop
}

enum WindowsStatus {
    case up
    case down
}

/// Вещи для загрузки в багажник
enum Items: Double {
    case smallBox = 20
    case suitcase = 40
    case carpet = 60
    case sofa = 500
}

struct SportCar {
    let carBrend: CarBrend
    let yearOfRelease: Int
    var km: Int
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    let volumeTrunk: Double
    var usingTrunk: Double
    var procentUsingTrunk: Double {
        get {
            return 100 / (volumeTrunk / usingTrunk)
        }
    }
    /// Запустить двигатель
    mutating func startEngine() {
        self.engineStatus = .start
        print("Вы завели двигатель\n")
    }
    /// Заглушить двигатель
    mutating func stopEngine() {
        self.engineStatus = .stop
        print("Вы заглушили двигатель\n")
    }
    
    /// Проехать столько то километров
    mutating func goTo(newKm: Int) {
        if self.engineStatus == .start {
            km += newKm
            print("Вы успешно проехали \(newKm) км\n")
        } else if self.engineStatus == .stop {
            print("Что бы поехать вы должны завести двигатель!\n")
        }
    }
    /// Поднять окна
    mutating func upWindows() {
        self.windowsStatus = .up
        print("Вы подняли окна\n")
    }
    /// Опустить окна
    mutating func downWindows() {
        self.windowsStatus = .down
        print("Вы опустили окна\n")
    }
    /// Загрузить в багажник
    mutating func putInTrunk(itemForTrunk item: Items) {
        print("Багажник загружен на \(self.procentUsingTrunk)% \nВы хотите положить \(item) в багажник")
        if usingTrunk + item.rawValue <= volumeTrunk {
        self.usingTrunk += item.rawValue
        print("Вы положили \(item) в багажник\nБагажник загружен на \(self.procentUsingTrunk)% \n")
        } else {
            print("Не выйдет! Багажник заполнен\n")
        }
    
    }
    
}

struct TruckCar {
    
}

var firstCar = SportCar(carBrend: .kia, yearOfRelease: 2000, km: 0, engineStatus: .stop, windowsStatus: .up, volumeTrunk: 480, usingTrunk: 10)

var item: Items = .smallBox
firstCar.putInTrunk(itemForTrunk: item)

item = .sofa
firstCar.putInTrunk(itemForTrunk: item)

item = .carpet
firstCar.putInTrunk(itemForTrunk: item)

firstCar.goTo(newKm: 100)

firstCar.startEngine()
firstCar.downWindows()
firstCar.goTo(newKm: 100)
firstCar.upWindows()

