//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: BaseViewModel

    var body: some View {
        VStack {
            if viewModel.networkStatus != .satisfied {
                ErrorViewFactory.makeView(
                    from: TextConstants.offlineError,
                    isNetwork: true,
                    retryActionClosure: {}
                ).frame(maxHeight: .infinity)
            } else {
                TransactionsListViewFactory.makeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BaseViewModel())
    }
}
