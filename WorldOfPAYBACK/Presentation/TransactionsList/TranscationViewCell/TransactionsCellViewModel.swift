//
//  TransactionsCellViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 18.03.23.
//

import Foundation

class TransactionsCellViewModel: ObservableObject {
    let transactionItem: Item
    let transactionDate: String

    init(transactionItem: Item) {
        self.transactionItem = transactionItem
        transactionDate = transactionItem.transactionDetail.bookingDate.toDate()?.toStringDate() ?? "-"
    }
}
