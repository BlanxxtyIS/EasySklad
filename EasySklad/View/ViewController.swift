//
//  ViewController.swift
//  EasySklad
//
//  Created by Марат Хасанов on 12.03.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.text = "Тут будет выводиться инфа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boxes = [
        Box(number: 0, length: 5, width: 5, height: 5, weight: 5, canRotate: true, canStack: false),
        Box(number: 1, length: 10, width: 5, height: 5, weight: 15, canRotate: true, canStack: false),
        Box(number: 2, length: 10, width: 5, height: 15, weight: 10, canRotate: true, canStack: false),
        Box(number: 3, length: 20, width: 5, height: 5, weight: 10, canRotate: true, canStack: true),
        Box(number: 4, length: 3, width: 5, height: 5, weight: 10, canRotate: true, canStack: true),
        Box(number: 5, length: 10, width: 5, height: 15, weight: 10, canRotate: true, canStack: true),
        Box(number: 6, length: 20, width: 5, height: 5, weight: 10, canRotate: true, canStack: true),
        Box(number: 7, length: 3, width: 5, height: 5, weight: 10, canRotate: true, canStack: false),
    ]
    
    let shelfves = [Shelf(index: 0, length: 20, width: 10, height: 15, maxWeight: 500, currentWeight: 0), Shelf(index: 1, length: 10, width: 10, height: 15, maxWeight: 100, currentWeight: 0)]

    private let khasanovSklad = KhasanovMethodController()

    override func viewDidLoad() {        
        let box = BoxController()
        let shelf = ShelfController()
        let boxSorted = box.getSortedBoxes(boxes)
        let shelfSorted = shelf.getSortedShelves(shelves: shelfves)
        let result = khasanovSklad.placeBoxesOnShelves(boxes, shelfves)
        setupAllViews()
        print("Максимальное количество коробок, которое можно разместить на полках: \(result)")
        print("Номера коробок и полок, на которых они размещены: Полка: \(result.0)")
        print("Не помещенные коробки: \(result.notCompletedBox)")
    }
    
    private func setupAllViews() {
        view.addSubview(testLabel)
        NSLayoutConstraint.activate([testLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     testLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     testLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     testLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func boxAdded() -> [Box]{
        let boxSorted = BoxController()
        for i in boxes {
            boxSorted.addBox(i)
        }
        return boxSorted.getSortedBoxes(boxes)
    }
}

