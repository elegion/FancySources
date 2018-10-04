//
//  SharedData.swift
//  SystemUtils
//
//  Created by Nikolay Ischuk on 09.04.2018.
//  Copyright © 2018 e-Legion. All rights reserved.
//

import Foundation
import UIKit

public struct SharedData {
    public static let fakeCellIdentifier = "FancySources.FakeCell"
}

extension UITableView {
    public func fs_registerFakeCell() {
        register(UITableViewCell.self, forCellReuseIdentifier: SharedData.fakeCellIdentifier)
    }
}

extension UICollectionView {
    public func fs_registerFakeCell() {
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: SharedData.fakeCellIdentifier)
    }

    public func fs_registerFakeSupplementary(of kind: String) {
        register(UICollectionReusableView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: SharedData.fakeCellIdentifier)
    }
}
