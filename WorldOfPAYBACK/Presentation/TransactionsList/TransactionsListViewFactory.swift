//
//  TransactionListViewFactory.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation

protocol TransactionsListViewManufactoring {
     static func makeView() -> TransactionsListView
}
// MARK: - Factory
final class TransactionsListViewFactory: TransactionsListViewManufactoring {

   public func configureView() -> TransactionsListView {
        let viewModel = makeTransactionsViewModel()
        let view = TransactionsListView(viewModel: viewModel)
        return view
    }
    private func makeRepository() -> TransactionsRepositoryProtocol {
        return TransactionsRepository()
    }

    private func makeTransactionsUseCase() -> TransactionsUseCaseProtocol {
        return TransactionsUseCase(transactionsRepository: makeRepository())
    }

    private func makeTransactionsViewModel() -> TransactionsListViewModel {
        return TransactionsListViewModel(useCase: makeTransactionsUseCase())
    }

    public static func makeView() -> TransactionsListView {
        return self.init().configureView()
    }
}

