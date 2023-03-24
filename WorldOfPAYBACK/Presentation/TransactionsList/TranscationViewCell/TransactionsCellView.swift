//
//  TransactionsViewCell.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 18.03.23.
//

import SwiftUI

struct TransactionsCellView: View {
    @StateObject var viewModel: TransactionsCellViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(viewModel.transactionItem.partnerDisplayName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60,alignment: .center)
                .cornerRadius(4)
                .padding(2)

            VStack(alignment: .leading) {
                Text(viewModel.transactionDate)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Text(viewModel.transactionItem.partnerDisplayName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(viewModel.transactionItem.transactionDetail.description ?? "-")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            HStack(spacing: 4) {
                Text(viewModel.transactionItem.transactionDetail.value.amount.description)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .lineLimit(1)
                Text(viewModel.transactionItem.transactionDetail.value.currency)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .lineLimit(1)
            }
        }
    }
}
