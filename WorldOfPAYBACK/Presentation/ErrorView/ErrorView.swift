//
//  ErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//


import SwiftUI

struct ErrorView: View {

    let viewModel: ErrorViewModel
    var retryActionClosure: (() -> Void)

    init(
        viewModel: ErrorViewModel,
        retryActionClosure: @escaping (() -> Void)
    ) {
        self.viewModel = viewModel
        self.retryActionClosure = retryActionClosure
    }

    var body: some View {
        VStack {
            Image(systemName: viewModel.isNetwork ? Icons.xmarkCloud : Icons.xmarkCircle)
                .resizable()
                .frame(width: 120, height: viewModel.isNetwork ? 80 : 120, alignment: .center)
                .scaledToFit()
                .foregroundColor(.red)
                .padding()
            Text(viewModel.message)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            if !viewModel.isNetwork {
                PrimaryButton(title: TextConstants.tryAgainString, width: 140, height: 36) {
                    retryActionClosure()
                }
            }
            Spacer()
        }.background(Color(UIColor.systemBackground))
            .padding()
    }

}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorViewFactory.makeView(from: TextConstants.offlineError, isNetwork: false, retryActionClosure: {})
    }
}
