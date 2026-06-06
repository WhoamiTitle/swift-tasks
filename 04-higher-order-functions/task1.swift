/*
 ## 1. Выбранный метод

 filter

 ## 2. Краткое описание

 Метод filter проходит по всем элементам массива и оставляет только те элементы,
 которые соответствуют заданному условию. Условие передается в виде замыкания,
 которое для каждого элемента возвращает true или false.

 ## 5. Что происходит "под капотом"

 filter создает новый массив, затем последовательно перебирает элементы
 исходного массива. Для каждого элемента вызывается условие. Если условие
 возвращает true, элемент добавляется в новый массив. Если false - пропускается.
 */

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 3. Пример использования встроенного метода filter.
let evenNumbersUsingFilter = numbers.filter { number in
    number % 2 == 0
}

print("Встроенный filter: \(evenNumbersUsingFilter)")

// 4. Собственный аналог filter без использования встроенных функций высшего порядка.
func myFilter(_ array: [Int], condition: (Int) -> Bool) -> [Int] {
    var result: [Int] = []

    for element in array {
        if condition(element) {
            result.append(element)
        }
    }

    return result
}

let evenNumbersUsingMyFilter = myFilter(numbers) { number in
    number % 2 == 0
}

print("Собственный myFilter: \(evenNumbersUsingMyFilter)")

// Обычный код без отдельной функции: цикл, условие и накопление результата.
var evenNumbersUsingLoop: [Int] = []

for number in numbers {
    if number % 2 == 0 {
        evenNumbersUsingLoop.append(number)
    }
}

print("Обычный цикл: \(evenNumbersUsingLoop)")
