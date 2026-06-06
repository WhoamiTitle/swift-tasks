/*
 ## Задание

 Реализовать симуляцию зоопарка.

 В работе есть:
 - базовый класс Animal;
 - пять классов-наследников: Wolf, Fox, Bear, Cat, Chicken;
 - массив объектов животных;
 - методы для еды, старения, размножения и проверки смерти;
 - генератор случайных чисел;
 - цикл симуляции;
 - вывод событий в консоль;
 - ежедневная и финальная статистика.
 */

struct AnimalTextForms {
    let becameOlder: String
    let ate: String
    let didNotFindFood: String
    let died: String
}

class Animal {
    let species: String
    let name: String
    var age: Int
    var hunger: Int
    var isAlive: Bool

    let maxAge: Int
    let maxHunger: Int
    let foodChance: Double
    let reproductionChance: Double
    let reproductionAge: Int
    let textForms: AnimalTextForms

    var fullName: String {
        "\(species) \(name)"
    }

    init(
        species: String,
        name: String,
        age: Int,
        hunger: Int = 0,
        maxAge: Int,
        maxHunger: Int,
        foodChance: Double,
        reproductionChance: Double,
        reproductionAge: Int,
        textForms: AnimalTextForms
    ) {
        self.species = species
        self.name = name
        self.age = age
        self.hunger = hunger
        self.isAlive = true
        self.maxAge = maxAge
        self.maxHunger = maxHunger
        self.foodChance = foodChance
        self.reproductionChance = reproductionChance
        self.reproductionAge = reproductionAge
        self.textForms = textForms
    }

    func growOlder() {
        age += 1
        hunger += 1
        print("\(fullName) \(textForms.becameOlder) старше. Возраст: \(age).")
    }

    func eat() {
        if randomEvent(chance: foodChance) {
            hunger = 0
            print("\(fullName) \(textForms.ate).")
        } else {
            print("\(fullName) \(textForms.didNotFindFood) еду. Уровень голода: \(hunger).")
        }
    }

    func canReproduce() -> Bool {
        age >= reproductionAge && randomEvent(chance: reproductionChance)
    }

    func makeChild(number: Int) -> Animal {
        fatalError("Этот метод должен быть переопределен в классе-наследнике")
    }

    func checkDeath() -> String? {
        if age > maxAge {
            isAlive = false
            return "\(fullName) \(textForms.died) от старости."
        }

        if hunger >= maxHunger {
            isAlive = false
            return "\(fullName) \(textForms.died) от голода."
        }

        return nil
    }

    private func randomEvent(chance: Double) -> Bool {
        Double.random(in: 0...1) < chance
    }
}

final class Wolf: Animal {
    init(name: String, age: Int = 0) {
        super.init(
            species: "Волк",
            name: name,
            age: age,
            maxAge: 8,
            maxHunger: 4,
            foodChance: 0.65,
            reproductionChance: 0.20,
            reproductionAge: 3,
            textForms: AnimalTextForms(
                becameOlder: "стал",
                ate: "поел",
                didNotFindFood: "не нашел",
                died: "умер"
            )
        )
    }

    override func makeChild(number: Int) -> Animal {
        Wolf(name: "#\(number)")
    }
}

final class Fox: Animal {
    init(name: String, age: Int = 0) {
        super.init(
            species: "Лиса",
            name: name,
            age: age,
            maxAge: 7,
            maxHunger: 4,
            foodChance: 0.70,
            reproductionChance: 0.25,
            reproductionAge: 2,
            textForms: AnimalTextForms(
                becameOlder: "стала",
                ate: "поела",
                didNotFindFood: "не нашла",
                died: "умерла"
            )
        )
    }

    override func makeChild(number: Int) -> Animal {
        Fox(name: "#\(number)")
    }
}

final class Bear: Animal {
    init(name: String, age: Int = 0) {
        super.init(
            species: "Медведь",
            name: name,
            age: age,
            maxAge: 10,
            maxHunger: 5,
            foodChance: 0.75,
            reproductionChance: 0.15,
            reproductionAge: 4,
            textForms: AnimalTextForms(
                becameOlder: "стал",
                ate: "поел",
                didNotFindFood: "не нашел",
                died: "умер"
            )
        )
    }

    override func makeChild(number: Int) -> Animal {
        Bear(name: "#\(number)")
    }
}

final class Cat: Animal {
    init(name: String, age: Int = 0) {
        super.init(
            species: "Кошка",
            name: name,
            age: age,
            maxAge: 9,
            maxHunger: 4,
            foodChance: 0.80,
            reproductionChance: 0.30,
            reproductionAge: 2,
            textForms: AnimalTextForms(
                becameOlder: "стала",
                ate: "поела",
                didNotFindFood: "не нашла",
                died: "умерла"
            )
        )
    }

    override func makeChild(number: Int) -> Animal {
        Cat(name: "#\(number)")
    }
}

final class Chicken: Animal {
    init(name: String, age: Int = 0) {
        super.init(
            species: "Курица",
            name: name,
            age: age,
            maxAge: 5,
            maxHunger: 3,
            foodChance: 0.60,
            reproductionChance: 0.35,
            reproductionAge: 1,
            textForms: AnimalTextForms(
                becameOlder: "стала",
                ate: "поела",
                didNotFindFood: "не нашла",
                died: "умерла"
            )
        )
    }

    override func makeChild(number: Int) -> Animal {
        Chicken(name: "#\(number)")
    }
}

final class ZooSimulation {
    private var animals: [Animal]
    private var childCounters: [String: Int] = [:]
    private var totalBorn = 0
    private var totalDied = 0

    init(animals: [Animal]) {
        self.animals = animals
    }

    func run(days: Int) {
        for day in 1...days {
            runDay(number: day)
        }

        printFinalStatistics()
    }

    private func runDay(number day: Int) {
        print("=== День \(day) ===")
        print("")

        var bornToday: [Animal] = []
        var diedToday = 0
        let animalsAtStartOfDay = animals

        for animal in animalsAtStartOfDay {
            guard animal.isAlive else {
                continue
            }

            animal.growOlder()
            animal.eat()

            if animal.canReproduce() {
                let childNumber = nextChildNumber(for: animal.species)
                let child = animal.makeChild(number: childNumber)
                bornToday.append(child)
                print("У животного \(animal.fullName) появился потомок: \(child.fullName).")
            }

            if let deathMessage = animal.checkDeath() {
                diedToday += 1
                print(deathMessage)
            }

            print("")
        }

        animals.append(contentsOf: bornToday)
        animals = animals.filter { $0.isAlive }

        totalBorn += bornToday.count
        totalDied += diedToday

        printDayStatistics(bornToday: bornToday.count, diedToday: diedToday)
        print("")
    }

    private func nextChildNumber(for species: String) -> Int {
        let nextNumber = (childCounters[species] ?? 0) + 1
        childCounters[species] = nextNumber
        return nextNumber
    }

    private func printDayStatistics(bornToday: Int, diedToday: Int) {
        print("Статистика:")
        print("Всего животных: \(animals.count)")
        print("Родилось за день: \(bornToday)")
        print("Умерло за день: \(diedToday)")
        print("Животных по видам:")
        printSpeciesStatistics()
    }

    private func printFinalStatistics() {
        print("=== Финальная статистика ===")
        print("Всего животных осталось: \(animals.count)")
        print("Всего родилось: \(totalBorn)")
        print("Всего умерло: \(totalDied)")
        print("Животных по видам:")
        printSpeciesStatistics()
    }

    private func printSpeciesStatistics() {
        let animalsBySpecies = Dictionary(grouping: animals) { animal in
            animal.species
        }

        for species in animalsBySpecies.keys.sorted() {
            let count = animalsBySpecies[species]?.count ?? 0
            print("\(species): \(count)")
        }
    }
}

let initialAnimals: [Animal] = [
    Wolf(name: "Акела", age: 1),
    Fox(name: "Алиса", age: 2),
    Bear(name: "Боря", age: 8),
    Cat(name: "Муся", age: 2),
    Chicken(name: "Ряба", age: 0)
]

let simulation = ZooSimulation(animals: initialAnimals)
simulation.run(days: 5)
