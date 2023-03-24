//
//  EmptyView.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 20.03.23.
//

import SwiftUI

struct EmptyView: View {
    let title: String

    var body: some View {
        Text(title)
            .foregroundColor(.secondary)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(title: TextConstants.transactionEmptyViewString)
            .foregroundColor(.secondary)
    }
}
