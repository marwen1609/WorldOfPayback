//
//  TransactionsDetailsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation

class TransactionsDetailsViewModel: ObservableObject {
    let transaction: Item

    init(transaction: Item) {
        self.transaction = transaction
    }
}
