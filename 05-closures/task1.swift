/*
 ## Задание

 Представьте, что вы разрабатываете простую систему скидок для магазина.

 Дан массив цен товаров. Нужно:
 1. Создать замыкание, которое принимает цену товара и возвращает размер скидки в процентах.
 2. Если цена товара больше или равна 1000 рублей, скидка должна быть 10%.
 3. Если у покупателя есть карта лояльности, к скидке добавляется еще 5%.
 4. Создать функцию, которая принимает цену товара и замыкание для расчета скидки.
 5. Для каждой цены вывести исходную цену, скидку и итоговую цену.

 Цель задания - понять, как замыкание можно сохранить в переменную,
 передать в функцию и вызвать внутри этой функции.
 */

import Foundation

let prices = [500.0, 1_200.0, 2_500.0, 750.0]
let hasLoyaltyCard = true

let discountRule: (Double) -> Double = { price in
    var discount = 0.0

    if price >= 1_000 {
        discount += 10
    }

    if hasLoyaltyCard {
        discount += 5
    }

    return discount
}

func finalPrice(for price: Double, using discountRule: (Double) -> Double) -> Double {
    let discount = discountRule(price)
    return price * (1 - discount / 100)
}

for price in prices {
    let discount = discountRule(price)
    let total = finalPrice(for: price, using: discountRule)

    print("Цена: \(String(format: "%.2f", price)) руб.")
    print("Скидка: \(String(format: "%.0f", discount))%")
    print("Итоговая цена: \(String(format: "%.2f", total)) руб.")
    print("---")
}
