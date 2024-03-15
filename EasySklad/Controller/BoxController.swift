//
//  BoxController.swift
//  EasySklad
//
//  Created by Марат Хасанов on 12.03.2024.
//

import Foundation

class BoxController {
    //сохраненный товар
    private var boxSaved: [Box] = []
    
    //Добавить товар на склад
    func addBox(_ box: Box) {
        boxSaved.append(box)
    }
    
    //сортировака, сначала самые крупные и тяжелые
    func getSortedBoxes(_ boxes: [Box]) -> [Box] {

        // Осторированные коробки по уменьшению объема, учитывая вес
        return boxes.sorted {
            let volume1 = $0.height * $0.length * $0.width
            let volume2 = $1.height * $1.length * $1.width

            let weightedVolume1 = volume1 + $0.weight
            let weightedVolume2 = volume2 + $1.weight

            return weightedVolume1 > weightedVolume2
        }
    }
}
