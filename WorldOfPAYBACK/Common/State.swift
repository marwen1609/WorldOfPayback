//
//  State.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
enum ViewState<T: Codable> {
    case initial
    case loading
    case empty
    case success(T)
    case failure(Error)

}
