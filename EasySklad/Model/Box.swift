//
//  Box.swift
//  EasySklad
//
//  Created by Марат Хасанов on 12.03.2024.
//

import Foundation

struct Box {
    let number: Int //номер
    let length: Int //длина
    let width: Int //ширина
    let height: Int //высота
    let weight: Int //вес
    let canRotate: Bool //разрешения переворота
    let canStack: Bool //разрешение складывать
}

extension Box {
    enum SortingCriteriaBox {
        case weight //вес
        case volume //объем
    }
}
