//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import Foundation

/// Бренд автомобиля
enum CarBrend {
    case kia
    case mercedes
    case lamborghini
}
/// Статус двигателя
enum CarEngineStatus {
    case on
    case off
}
/// Статус окон
enum CarWindowsStatus {
    case up
    case down
}
/// Предметы для перевозки
enum ItemForTrunk: Double {
    case sBox = 10
    case smallBox = 20
    case box = 100
    case bigBox = 500
}
/// Положение крыши в спорткаре
enum SportCarRoof {
    case up
    case down
}

// MARK: - Car
protocol CarProtocol {
    /// Объем багажника
    var carTrunkVolume: Double { get }
    ///  Объем багажника использовано
    var carTrunkVolumeUse: Double { get set }
    /// Пробег
    var carKM: Double { get set }
    /// Объем бензобака
    var carFuelVolume: Double { get set }
    /// Расход
    var carFuelExpense: Double { get set }
    var carBrend: CarBrend { get }
    var carEngineStatus: CarEngineStatus { get set }
    var carWindowsStatus: CarWindowsStatus { get set }

    ///  Количество бензина в баке
    var carFuelVolumeHave: Double { get set }
    /// Загруз багажника в процентах
    var carTrunkPercent: Double { get }
    ///  Количество бензина в процентах
    var carFuelPercent: Double { get }
}

// MARK: - Car Engine
extension CarProtocol {
    /// Завести двигатель
    mutating func carEngineOn() {
        carEngineStatus = .on
        print("Двигатель \(carEngineStatus)")
        print("Топливо: \(carFuelPercent)%\n")
    }
    /// Заглушить двигатель
    mutating func carEngineOff() {
        carEngineStatus = .off
        print("Двигатель \(carEngineStatus)\n")
    }
    ///  Проехать столько то км
    mutating func carRide(km: Double) {
        if carFuelVolumeHave >= km / carFuelExpense {
            carKM += km
            carFuelVolumeHave -= km / carFuelExpense
            print("Вы проехали \(km)км")
            print("Топливо: \(carFuelPercent)%\n")
        } else {
            carKM += carFuelVolumeHave * carFuelExpense
            print("Вы проехали только \(carFuelVolumeHave * carFuelExpense)км")
            carFuelVolumeHave = 0
            print("Топливо: \(carFuelPercent)%\n")
        }

    }
    /// Заправить автомобиль
    mutating func carFuel() {
        carFuelVolumeHave = carFuelVolume
        print("Автомобиль заправлен")
        print("Топливо: \(carFuelPercent)%\n")
    }
    
}
// MARK: - Car Comfort
extension CarProtocol {
    mutating func carWindowsUp() {
        carWindowsStatus = .up
        print("Окна подняты")
    }
    /// Опустить окна
    mutating func carWindowsDown() {
        carWindowsStatus = .down
        print("Окна опущены")
    }
}

// MARK: - Car Put&Pull
extension CarProtocol {
    /// Положить предмет в багажник
    mutating func putBoxInCar(itemForTrunk item: ItemForTrunk) {
        if carTrunkVolume - carTrunkVolumeUse >= item.rawValue {
            carTrunkVolumeUse += item.rawValue
            print("Вы положили \(item) в багажник")
            print("Багажник заполнен: \(carTrunkPercent)%\n")
        } else {
            print("\(item) не помещается в багажник\n")
        }
    }
    /// Вытащить все из багажника
    mutating func pullAllItems() {
        carTrunkVolumeUse = 0
        print("Багажник пуст\n")
    }
    
}

// MARK: - Car
class Car: CarProtocol {
    /// Объем багажника
    var carTrunkVolume: Double
    ///  Объем багажника использовано
    var carTrunkVolumeUse: Double
    /// Пробег
    var carKM: Double
    /// Объем бензобака
    var carFuelVolume: Double
    /// Расход
    var carFuelExpense: Double
    var carBrend: CarBrend
    var carEngineStatus: CarEngineStatus
    var carWindowsStatus: CarWindowsStatus

    ///  Количество бензина в баке
    var carFuelVolumeHave: Double {
        didSet {
            if carFuelVolumeHave <= 0 {
                carFuelVolumeHave = 0
                print("Экстренная остановка!")
            }
        }
    }
    /// Загруз багажника в процентах
    var carTrunkPercent: Double {
        return 100 / ( carTrunkVolume / carTrunkVolumeUse )
    }
    ///  Количество бензина в процентах
    var carFuelPercent: Double {
        return 100 / ( self.carFuelVolume / self.carFuelVolumeHave )
    }

    init(carTrunkVolume: Double,
         carTrunkVolumeUse: Double,
         carKM: Double,
         carFuelVolume: Double,
         carFuelVolumeHave: Double,
         carFuelExpense: Double,
         carBrend: CarBrend,
         carEngineStatus: CarEngineStatus,
         carWindowsStatus: CarWindowsStatus) {
        self.carTrunkVolume = carTrunkVolume
        self.carTrunkVolumeUse = carTrunkVolumeUse
        self.carKM = carKM
        self.carFuelVolume = carFuelVolume
        self.carFuelVolumeHave = carFuelVolumeHave
        self.carFuelExpense = carFuelExpense
        self.carBrend = carBrend
        self.carEngineStatus = carEngineStatus
        self.carWindowsStatus = carWindowsStatus
        print("Ура! Ты приобрел новенькую \(self.carBrend)\n")
    }
    
    convenience init(carBrend: CarBrend) {
        self.init(carTrunkVolume: 400,
                  carTrunkVolumeUse: 0,
                  carKM: 0,
                  carFuelVolume: 40,
                  carFuelVolumeHave: 40,
                  carFuelExpense: 10,
                  carBrend: carBrend,
                  carEngineStatus: .off,
                  carWindowsStatus: .down)
    }
}


var car = Car(carBrend: .kia)

car.carEngineStatus = .on
print(car.carEngineStatus)

car.carRide(km: 400)
car.carFuel()

car.putBoxInCar(itemForTrunk: .smallBox)
car.putBoxInCar(itemForTrunk: .box)
car.putBoxInCar(itemForTrunk: .bigBox)

car.carWindowsDown()
car.carEngineOn()

