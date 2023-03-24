//
//  TransactionsService.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
import Combine

protocol TransactionsServiceProtocol {
    static func fetchTransactions() -> AnyPublisher<PBPGroup, NetworkError>
}

struct TransactionsService: TransactionsServiceProtocol {

    static func fetchTransactions() -> AnyPublisher<PBPGroup, NetworkError> {
        let endpoint = RequestBuilder.getTransactions
        let request = endpoint.createRequest()
        return RequestHandler.request(request)
    }
}
