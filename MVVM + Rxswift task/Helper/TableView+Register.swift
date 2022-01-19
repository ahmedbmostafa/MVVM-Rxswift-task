//
//  TableView+Register.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Foundation
import UIKit
extension UITableView {
    func registerNib(identifier: String) {
         let tableNib = UINib(nibName: identifier, bundle: nil)
         self.register(tableNib, forCellReuseIdentifier: identifier )
     }
}
extension UICollectionView {
    func registerNib(identifier: String) {
        let collectionNib = UINib(nibName: identifier, bundle: nil)
        self.register(collectionNib, forCellWithReuseIdentifier: identifier )
    }
}
extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }
        return lastIndexPath == indexPath
    }
}
