//
//  TransactionsEndpoint.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
enum EndPoints {
    case getTransactions

    var path: String {
        switch self {
        case .getTransactions: return "/transactions"
        }
    }
}
extension EndPoints: CustomStringConvertible {
    var description: String { return AppConfiguration.baseUrl.appending(path)  }
}
