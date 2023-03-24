//
//  Date+extensions.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 19.03.23.
//

import Foundation

extension Date {

    func toStringDate() -> String {
        let dateFormat = "dd. MMM yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}
