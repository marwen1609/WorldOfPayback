//
//  LoaderView.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 19.03.23.
//

import SwiftUI

struct LoaderView: View {
    var tintColor: Color = .gray
    var scaleSize: CGFloat = 1.5

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            ProgressView()
                .scaleEffect(scaleSize, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
            Text(TextConstants.loadingString)
                .font(.headline)
                .fontWeight(.medium)
        }
    }
}
struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
