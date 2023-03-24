//
//  TransactionsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
import Network
import Combine
import SwiftUI

class TransactionsListViewModel: ObservableObject {
    let useCase: TransactionsUseCaseProtocol
    @Published private (set) var state: ViewState<[Item]> = .initial
    @Published var path = NavigationPath()
    @Published var categories = Set<Int>()
    @Published var showTotalView = false
    @Published var isLoading = true
    var filteredTrasnactions: [Item] = []
    var allTrasnactions: [Item] = []
    var subscriptions = Set<AnyCancellable>()
    var selectedCategory: Int = 0 { // 0 means that there's no category selected
        didSet {
            showTotalView = selectedCategory == 0 ? false : true
        }
    }

    init(useCase: TransactionsUseCaseProtocol) {
        self.useCase = useCase
    }

    func getTransactions() {
        state = .loading
        useCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    self.state = .failure(error)
                case .finished:
                    debugPrint("nothing much to do here")
                }
            } receiveValue: { (response) in
                self.setStateOnReceiveValue(response)
            }
            .store(in: &subscriptions)
    }

    func filterListByCategory(category: Int) {
        guard category != 0 else {
            self.state = .success(allTrasnactions)
            return
        }
        filteredTrasnactions = allTrasnactions.filter { item in
            item.category == category
        }
        self.state = .success(filteredTrasnactions)
    }
    
    func getCategoryTotal() -> Int {
        guard selectedCategory != 0 else {
            return 0
        }
        let ammounts = filteredTrasnactions.map {
            $0.transactionDetail.value.amount
        }
        return ammounts.reduce(0, +)
    }

    func setStateOnReceiveValue(_ response: [Item]) {
        self.isLoading = false
        if response.isEmpty {
            self.state = .empty
        } else {
            self.allTrasnactions = response
            self.categories = Set(self.allTrasnactions.map { $0.category })
            self.state = .success(response)
        }
    }
}

