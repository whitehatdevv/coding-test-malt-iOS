//
//  MainViewPresenter.swift
//  TestingCode
//
//  Created by Martinez, Emanuele on 30/11/21.
//

import Foundation

class MainViewPresenter {
    
    //MARK: - Dependencies
    var dataProvider: MainViewDataProvider?
    weak var view: MainViewOutputProtocol?
    weak var router: MainViewRouter?
    
    //MARK: - Properties
    var state: MainViewState = .loadingView {
        didSet {
            view?.update(state)
        }
    }
    
    //MARK: - Inits
    init(_ view: MainViewOutputProtocol, router: MainViewRouter, dataProvider: MainViewDataProvider) {
        self.view = view
        self.router = router
        self.dataProvider = dataProvider
    }
    
    //MARK: - Methods
    
    func handleResponseData(_ dto: [TransactionDTO]) {
        let dom = dto.filter { $0.date.isDateValid }.map(TransactionDOM.init)
        state = .data(dom)
    }
    
    func getTransactions() {
        dataProvider?.getTransactions(callback: { result in
            switch result {
            case .success(let transactionsDTO):
                self.handleResponseData(transactionsDTO)
            case .failure(let errorMessage):
                self.state = .error(errorMessage)
            }
        })
    }
    
}

//MARK: - Input Protocol's methods
extension MainViewPresenter: MainViewInputProtocol {
    
    func viewWillAppear() {
        getTransactions()
    }
    
    func refreshData() {
        state = .loadingTable
        getTransactions()
    }
    
}
