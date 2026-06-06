/*
 ## Задание 2

 Дан массив целых чисел. Необходимо определить количество положительных,
 отрицательных и нулевых значений, максимальное значение и сумму элементов.
 */

let numbers = [12, -4, 0, 9, -15, 0, 27, -8, 3]

var positiveCount = 0
var negativeCount = 0
var zeroCount = 0
var sum = 0

for number in numbers {
    if number > 0 {
        positiveCount += 1
    } else if number < 0 {
        negativeCount += 1
    } else {
        zeroCount += 1
    }

    sum += number
}

let maximumValue = numbers.max() ?? 0

print("Количество положительных чисел: \(positiveCount)")
print("Количество отрицательных чисел: \(negativeCount)")
print("Количество нулевых значений: \(zeroCount)")
print("Максимальное значение: \(maximumValue)")
print("Сумма всех элементов: \(sum)")
