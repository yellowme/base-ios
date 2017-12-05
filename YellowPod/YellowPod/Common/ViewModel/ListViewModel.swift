//
//  ListViewModel.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/26/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import UIKit

public protocol ListViewModelDelegate: class {
    func didLoadData()
    func handleError(withMessage message: String)
}

protocol ListViewModel: RefreshableViewModel {
    associatedtype Adapter: Transformator
    associatedtype Model
    associatedtype Holder
    
    var items: [Model] { get set }
    var transformator: Adapter { get set }
    func modelForElement(_ element: Model) -> Holder
    func remove(_ index: Int)
}

extension ListViewModel {
    func itemAt(_ index: Int) -> Model? {
        guard index < items.count else {
            return nil
        }
        return items[index]
    }
}

protocol ListViewModelController {
    associatedtype AViewModel: ListViewModel
    
    var viewModel: AViewModel! { get set }
    func refresh()
}

extension ListViewModelController where Self: UITableViewController {
    func refresh() {
        viewModel.refresh()
        tableView.reloadData()
    }
}
