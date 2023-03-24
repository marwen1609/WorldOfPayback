//
//  TransactionsDetailsView.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import SwiftUI

struct TransactionsDetailsView: View {
    @StateObject var viewModel: TransactionsDetailsViewModel

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 30)
                VStack(alignment: .leading) {
                    Text(viewModel.transaction.partnerDisplayName)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(viewModel.transaction.transactionDetail.description ?? "-")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    Divider()
                        .overlay(.black)
                    HStack {
                        Text(TextConstants.totalString)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("\(viewModel.transaction.transactionDetail.value.amount) " + viewModel.transaction.transactionDetail.value.currency)
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                }.padding(8)
                    .background(RoundedRectangle(cornerRadius: 6).fill(Color.cardBackground))
                Spacer()
            }.padding(8)
        }
        .navigationTitle(viewModel.transaction.partnerDisplayName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
