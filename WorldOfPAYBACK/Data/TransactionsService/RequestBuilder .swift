//
//  RequestBuilder .swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
public typealias Headers = [String: String]

enum RequestBuilder {

    case getTransactions

    var httpMethod: HTTPMethod {
        switch self {
        case .getTransactions:
            return .GET
        }
    }

    func createRequest() -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        return NetworkRequest(url: getURL(), headers: headers, reqBody: requestBody, httpMethod: httpMethod)
    }

    var requestBody: Encodable? {
        switch self {
        case .getTransactions:
            return nil
        }
    }

    func getURL() -> String {
        switch self {
        case .getTransactions:
            return EndPoints.getTransactions.description
        }
    }
}
