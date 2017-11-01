//
//  TableViewDataSource.swift
//  888ru
//
//  Created by Nikolay Ischuk on 23.01.17.
//  Copyright © 2017 easyverzilla. All rights reserved.
//

import UIKit

open class TableViewDataSource<Item>: BaseViewDataSource<Item>, UITableViewDataSource {

    // MARK: - UITableViewDS

    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedRows.count
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.item(at: indexPath)
        let descriptor = cellDescriptorCreator(item, indexPath.row)
        registerIfNeeded(reuseIdentifier: descriptor.reuseIdentifier) {
            
            
            if let cellNib = descriptor.cellNib {
                tableView.register(cellNib, forCellReuseIdentifier: descriptor.reuseIdentifier)
            } else if descriptor.storyboardBasedCell == false {
                tableView.register(descriptor.cellClass!, forCellReuseIdentifier: descriptor.reuseIdentifier)
            }
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.reuseIdentifier, for: indexPath)
        descriptor.configure(cell)

        return cell
    }
}