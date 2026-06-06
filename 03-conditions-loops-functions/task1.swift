/*
 ## Задание 1

 Пользователь вводит сумму покупки и указывает, есть ли у него карта лояльности.
 Нужно определить итоговую стоимость покупки с учетом скидок.
 */

import Foundation

print("Введите сумму покупки:")
let amountInput = readLine() ?? ""
let normalizedAmountInput = amountInput.replacingOccurrences(of: ",", with: ".")

if let purchaseAmount = Double(normalizedAmountInput), purchaseAmount >= 0 {
    print("Есть карта лояльности? Введите да или нет:")
    let loyaltyCardInput = (readLine() ?? "").lowercased()
    let hasLoyaltyCard = loyaltyCardInput == "да"
        || loyaltyCardInput == "yes"
        || loyaltyCardInput == "true"
        || loyaltyCardInput == "1"

    var discount: Double = 0

    if purchaseAmount > 10_000 {
        discount = 10
    } else if purchaseAmount > 5_000 {
        discount = 5
    }

    if hasLoyaltyCard {
        discount += 2
    }

    let finalPrice = purchaseAmount * (1 - discount / 100)

    print("Примененная скидка: \(String(format: "%.0f", discount))%")
    print("Итоговая стоимость: \(String(format: "%.2f", finalPrice)) рублей")
} else {
    print("Ошибка: сумма покупки должна быть неотрицательным числом")
}
