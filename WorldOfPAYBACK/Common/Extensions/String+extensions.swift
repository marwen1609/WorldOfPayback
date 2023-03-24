//
//  String+extenstions.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func toDate() -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: self)
    }
}
