//
//  ЛрфыфтщмЬуерщв.swift
//  EasySklad
//
//  Created by Марат Хасанов on 12.03.2024.


//1 Int - оставшийся объем
//2 Int - вес полки
//3 Box - коробки на полке
import Foundation

class KhasanovMethodController {
    func placeBoxesOnShelves(_ boxes: [Box], _ shelves: [Shelf]) -> ([Int: [Int]], notCompletedBox: [Box]) {
        var notCompletedBox: [Box] = []
        
        let boxesController = BoxController()
        let sortedBoxes = boxesController.getSortedBoxes(boxes)
        
        let shelfController = ShelfController()
        let sortedShelf = shelfController.getSortedShelves(shelves: shelves)
        
        var shelfBoxMap: [Int: [Int]] = [:] // Словарь для хранения номеров коробок на каждой полке
        var placedBoxes: Set<Int> = Set() // Множество для отслеживания размещенных коробок

        //MARK: НАДО КРАСИТЬ ПОЛ И ВЫСЧИТЫВАТЬ
        
        // Перебираем полки
        for shelf in sortedShelf {
            shelfBoxMap[shelf.index] = [] // Инициализируем список коробок на текущей полке
            
            //объем текущей полки
            var shelfVolume = shelf.height * shelf.length * shelf.width

            // Перебираем коробки и пытаемся разместить их на текущей полке
            for box in sortedBoxes {
                // Проверяем, размещалась ли уже эта коробка
                if placedBoxes.contains(box.number) {
                    continue // Если да, переходим к следующей коробке
                }
                //объем текущей коробки
                let boxVolume = box.height * box.length * box.width
                //если на коробку можно складывать
                if box.canStack {
                    // Проверяем, поместится ли коробка на текущей полке
                    shelfVolume -= boxVolume
                } else {
                    let newBoxVolume = box.width * box.length * shelf.height
                    shelfVolume -= newBoxVolume
                }
                if shelfVolume >= 0 {
                    if shelf.width >= box.width && shelf.height >= box.height && shelf.length >= box.length {
                        shelfBoxMap[shelf.index]?.append(box.number) // Добавляем номер коробки на текущую полку
                        placedBoxes.insert(box.number) // Добавляем номер коробки в множество размещенных
                        
                    } else {
                        if box.canStack {
                            // Проверяем, поместится ли коробка на текущей полке
                            shelfVolume += boxVolume
                        } else {
                            let newBoxVolume = box.width * box.length * shelf.height
                            shelfVolume += newBoxVolume
                        }
                    }
                } else {
                    //объем коробки привышает объем полки
                    if box.canStack {
                        // Проверяем, поместится ли коробка на текущей полке
                        shelfVolume += boxVolume
                    } else {
                        let newBoxVolume = box.width * box.length * shelf.height
                        shelfVolume += newBoxVolume
                    }
                    continue
                }
            }
        }

        return (shelfBoxMap, notCompletedBox)
    }

}
