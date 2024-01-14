//
//  DataPresenter.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 13/01/2024.
//

import Foundation

class DataPresenter {
    private let networkManager = NetworkManager()
    weak var view: DataViewInterface?
    
    func loadData() {
        networkManager.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.view?.updateWithData(data)
                case .failure(let error):
                    self?.view?.showError(error)
                }
            }
        }
    }
}
