/*
 ## Задание 6

 Реализовать функцию, которая определяет, является ли число простым.
 Используя эту функцию, вывести все простые числа в диапазоне от 1 до 20.
 */

func isPrime(_ number: Int) -> Bool {
    if number < 2 {
        return false
    }

    if number == 2 {
        return true
    }

    for divisor in 2..<number {
        if number % divisor == 0 {
            return false
        }
    }

    return true
}

var primeNumbers: [Int] = []

for number in 1...20 {
    if isPrime(number) {
        primeNumbers.append(number)
    }
}

print("Простые числа от 1 до 20: \(primeNumbers)")
