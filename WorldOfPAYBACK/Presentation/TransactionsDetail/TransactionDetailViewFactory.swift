//
//  TransactionDetailViewFactory.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 19.03.23.
//

import Foundation

protocol TransactionsDetailsViewManufactoring {
    static func makeView(
        from transaction: Item
    ) -> TransactionsDetailsView
}
// MARK: - Factory
final class TransactionsDetailsViewFactory: TransactionsDetailsViewManufactoring {
    static func makeView(
        from transaction: Item
    ) -> TransactionsDetailsView {
        return self.init().configureView(
            from: transaction
        )
    }

    public func configureView(
        from transaction: Item
    ) -> TransactionsDetailsView {
        let viewModel = makeViewModel(
            from: transaction
        )
        let view = TransactionsDetailsView(viewModel: viewModel)
        return view
    }

    private func makeViewModel(
        from transaction: Item
    ) -> TransactionsDetailsViewModel {
        return TransactionsDetailsViewModel(
            transaction: transaction
        )
    }
}
