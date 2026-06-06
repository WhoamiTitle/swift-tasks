/*
 ## Задание 5

 Реализовать функцию, которая принимает номер дня недели и возвращает его тип.
 Проверить функцию в цикле для значений от 1 до 8.
 */

func dayType(for dayNumber: Int) -> String {
    switch dayNumber {
    case 1...5:
        return "Рабочий день"
    case 6...7:
        return "Выходной"
    default:
        return "Ошибка: некорректный номер дня недели"
    }
}

for dayNumber in 1...8 {
    print("\(dayNumber): \(dayType(for: dayNumber))")
}
