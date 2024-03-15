//
//  ShelfController.swift
//  EasySklad
//
//  Created by Марат Хасанов on 12.03.2024.
//

import Foundation

enum SortingCriteriaShelf {
    case maxWeight //максимальный вес
    case size //размер
}

class ShelfController {
    private var allShelf: [Shelf] = []
    
    //Добавить товар на склад
    func addSheld(_ shelf: Shelf) {
        allShelf.append(shelf)
    }
    
    //сортировака, сначала самые вместительные
    func getSortedShelves(shelves: [Shelf]) -> [Shelf] {
        // определяем приоритет полок на основе объема и максимального веса
        return shelves.sorted {
            let volume1 = $0.height * $0.length * $0.width
            let volume2 = $1.height * $1.length * $1.width

            let weightedVolume1 = volume1 + $0.maxWeight
            let weightedVolume2 = volume2 + $1.maxWeight

            return weightedVolume1 > weightedVolume2
        }
    }
}
