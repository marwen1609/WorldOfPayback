//
//  TransactionsUseCase.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
import Combine

protocol TransactionsUseCaseProtocol {
    var transactionsRepository: TransactionsRepositoryProtocol { get set }
    func execute() -> AnyPublisher<[Item], NetworkError>
}

class TransactionsUseCase: TransactionsUseCaseProtocol {
     var transactionsRepository: TransactionsRepositoryProtocol

    init(transactionsRepository: TransactionsRepositoryProtocol) {
        self.transactionsRepository = transactionsRepository
    }

    func execute() -> AnyPublisher<[Item], NetworkError> {
        let randomInt = Int.random(in: 1...10)
        switch randomInt {
        case 1...7:
            return transactionsRepository.getTransactions()
        case 8...9:
            return  transactionsRepository.getMockedTransactions()
        default:
            return transactionsRepository.getEmptyTransactions()
        }
    }
}
