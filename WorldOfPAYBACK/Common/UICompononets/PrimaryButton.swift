//
//  PrimaryButton.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 20.03.23.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let width: CGFloat
    let height: CGFloat
    var actionClosure: (() -> Void)

    var body: some View {
        Button(title) {
            actionClosure()
        }
        .frame(width: width, height: height, alignment: .center)
        .background(Color.black)
        .foregroundColor(.white)
        .font(.subheadline)
        .clipShape(Capsule())
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Retry", width: 180, height: 40, actionClosure: {})
    }
}
