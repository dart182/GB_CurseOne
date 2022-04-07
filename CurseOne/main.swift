//
//  main.swift
//  CurseOne
//
//  Created by Константин Савченко on 31.03.2022.
//

import Foundation

/// Бренд автомобиля
indirect enum CarBrend {
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

/// Родительский класс автомобиль
class Car {
    /// Объем багажника
    var carTrunkVolume: Double
    ///  Объем багажника использовано
    var carTrunkVolumeUse: Double
    /// Пробег
    var carKM: Double
    /// Объем бензобака
    let carFuelVolume: Double
    /// Расход
    let carFuelExpense: Double
    let carBrend: CarBrend
    var carEngineStatus: CarEngineStatus
    var carWindowsStatus: CarWindowsStatus
    /// Счетчик созданных машин
    static var carCount = 0

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
    
    /// Завести двигатель
    func carEngineOn() {
        self.carEngineStatus = .on
        print("Двигатель \(self.carEngineStatus)")
        print("Топливо: \(self.carFuelPercent)%\n")
    }
    /// Заглушить двигатель
    func carEngineOff() {
        self.carEngineStatus = .off
        print("Двигатель \(self.carEngineStatus)\n")
    }
    /// Поднять окна
    func carWindowsUp() {
        self.carWindowsStatus = .up
        print("Окна подняты")
    }
    /// Опустить окна
    func carWindowsDown() {
        self.carWindowsStatus = .down
        print("Окна опущены")
    }
    /// Проехать указанное кол-во км
    func carRide(km: Double) {
        if self.carFuelVolumeHave >= km / carFuelExpense {
            self.carKM += km
            self.carFuelVolumeHave -= km / carFuelExpense
            print("Вы проехали \(km)км")
            print("Топливо: \(self.carFuelPercent)%\n")
        } else {
            self.carKM += self.carFuelVolumeHave * self.carFuelExpense
            print("Вы проехали только \(self.carFuelVolumeHave * self.carFuelExpense)км")
            self.carFuelVolumeHave = 0
            print("Топливо: \(self.carFuelPercent)%\n")
        }

    }
    /// Заправить автомобиль
    func carFuel() {
        self.carFuelVolumeHave = self.carFuelVolume
        print("Автомобиль заправлен")
        print("Топливо: \(self.carFuelPercent)%\n")
    }
    /// Положить предмет в багажник
    func putBoxInCar(itemForTrunk item: ItemForTrunk) {
        if self.carTrunkVolume - self.carTrunkVolumeUse >= item.rawValue {
            self.carTrunkVolumeUse += item.rawValue
            print("Вы положили \(item) в багажник")
            print("Багажник заполнен: \(self.carTrunkPercent)%\n")
        } else {
            print("\(item) не помещается в багажник\n")
        }
    }
    /// Вытащить все из багажника
    func pullAllItems() {
        self.carTrunkVolumeUse = 0
        print("Багажник пуст\n")
    }
    
    init(carBrend: CarBrend) {
        self.carTrunkVolume = 400
        self.carTrunkVolumeUse = 0
        self.carFuelVolume = 40
        self.carFuelVolumeHave = 40
        self.carFuelExpense = 10
        self.carKM = 0
        self.carBrend = carBrend
        self.carEngineStatus = .off
        self.carWindowsStatus = .up
        print("Ура! Ты приобрел новенькую \(self.carBrend)\n")
        Car.carCount += 1
    }
    
    deinit {
        
    }
}

/// Класс спортивный автомобиль, наследует класс автомобиль
class SportCar: Car {
    var carRoof: SportCarRoof
    
    func sportCarRoofUp() {
        self.carRoof = .up
        print("Крыша поднята\n")
    }
    
    func sportCarRoofDown() {
        self.carRoof = .down
        print("Крыша убрана\n")
    }
    
    override init(carBrend: CarBrend) {
        self.carRoof = .up
        super.init(carBrend: carBrend)
        self.carTrunkVolume = 80
        print("Ты пересел на спорткар \(self.carBrend)\n")
    }
    
    deinit {
        Car.carCount -= 1
        print("Машина уничтожена")
    }
}

/// Класс грузовой автомобиль, наследует класс автомобиль
class TrunkCar: Car {
    override init(carBrend: CarBrend) {
        super.init(carBrend: carBrend)
        self.carTrunkVolume = 2000
        print("Ты пересел на грузовик \(self.carBrend)\n")
    }
    
    deinit {
        
    }
}

var car1 = Car(carBrend: .kia)

car1.carEngineOn()

car1.carRide(km: 200)

car1.carRide(km: 1000)

car1.carFuel()

car1.carRide(km: 100)

car1.putBoxInCar(itemForTrunk: .smallBox)
car1.putBoxInCar(itemForTrunk: .box)
car1.putBoxInCar(itemForTrunk: .bigBox)

var carTrunk = TrunkCar(carBrend: .mercedes)

carTrunk.putBoxInCar(itemForTrunk: .bigBox)
print(Car.carCount)

var sportCar = SportCar(carBrend: .lamborghini)

sportCar.sportCarRoofDown()
sportCar.carRide(km: 1000)
