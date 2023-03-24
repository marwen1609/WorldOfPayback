//
//  TransactionsRepository.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
import Combine

protocol TransactionsRepositoryProtocol {
    func getMockedTransactions() -> AnyPublisher<[Item], NetworkError>
    func getTransactions() -> AnyPublisher<[Item], NetworkError>
    func getEmptyTransactions() -> AnyPublisher<[Item], NetworkError>
}

struct TransactionsRepository: TransactionsRepositoryProtocol {

    func getMockedTransactions() -> AnyPublisher<[Item], NetworkError> {
        let transactions: PBPGroup = Bundle.main.decode(PBPGroup.self,from: "PBTransactions.json") ?? PBPGroup(items: [])
        let sortedTransactions = transactions.items.sorted(by: {
            $0.transactionDetail.bookingDate.toDate() ?? Date() > $1.transactionDetail.bookingDate.toDate() ?? Date()
        })
         return Future<[Item], NetworkError>(){ promise in
             promise(.success(sortedTransactions))
         }.delay(for: .seconds(3), scheduler: DispatchQueue.main)
         .eraseToAnyPublisher()

    }

    func getTransactions() -> AnyPublisher<[Item], NetworkError> {
        let transactionsPublisher = TransactionsService.fetchTransactions()
            .map {
                $0.items.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate})
            }
            .eraseToAnyPublisher()

        return transactionsPublisher
    }

    func getEmptyTransactions() -> AnyPublisher<[Item], NetworkError> {
        return Future<[Item], NetworkError>(){ promise in
            promise(.success([]))
        }.delay(for: .seconds(3), scheduler: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
