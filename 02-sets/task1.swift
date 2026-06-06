/*
 ## Практическая работа N2

 1. Создайте два множества: setA и setB. setA должен содержать числа от 1 до 10, а setB - числа от 5 до 15.
 2. Найдите пересечение, объединение и разность множеств setA и setB.
 3. Проверьте, является ли setA подмножеством setB, и является ли setB подмножеством setA.
 4. Найдите симметрическую разность множеств setA и setB. Проверьте, являются ли множества setA и setB равными.
 5. Выведите результат в форматированном виде.
 */

let setA: Set<Int> = Set(1...10)
let setB: Set<Int> = Set(5...15)

let intersection = setA.intersection(setB).sorted()
let union = setA.union(setB).sorted()
let difference = setA.subtracting(setB).sorted()

let isSubsetA = setA.isSubset(of: setB)
let isSubsetB = setB.isSubset(of: setA)

let symmetricDifference = setA.symmetricDifference(setB).sorted()
let isEqual = setA == setB

print("Пересечение: \(intersection)")
print("Объединение: \(union)")
print("Разность: \(difference)")
print("setA является подмножеством setB: \(isSubsetA)")
print("setB является подмножеством setA: \(isSubsetB)")
print("Симметрическая разность: \(symmetricDifference)")
print("Множества равны: \(isEqual)")
