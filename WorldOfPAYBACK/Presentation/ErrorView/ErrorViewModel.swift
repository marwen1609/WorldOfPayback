//
//  ErrorViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
struct ErrorViewModel{
    let message: String
    let isNetwork: Bool
    init(
        message: String,
        isNetwork: Bool
    ) {
        self.message = message
        self.isNetwork = isNetwork
    }
}
