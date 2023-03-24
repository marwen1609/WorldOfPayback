//
//  TransactionsModel.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation

// MARK: - PBPGroup
struct PBPGroup: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable, Hashable {

    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.alias.reference == rhs.alias.reference
    }

    func hash(into hasher: inout Hasher) {
           hasher.combine(alias.reference)
       }

    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail
}

// MARK: - Alias
struct Alias: Codable {
    let reference: String
}

// MARK: - TransactionDetail
struct TransactionDetail: Codable {
    let description: String?
    let bookingDate: String
    let value: Value
}

// MARK: - Value
struct Value: Codable {
    let amount: Int
    let currency: String
}

