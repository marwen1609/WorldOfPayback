//
//  TransactionsListView.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import SwiftUI

struct TransactionsListView: View {

    @StateObject var viewModel: TransactionsListViewModel
    @State private var presentedTransactions: [Item] = []
    

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            switch viewModel.state {
            case .loading,.initial:
                VStack {
                    LoaderView()
                }
            case .success(let transactions):
                VStack(alignment: .trailing) {
                    createList(transactions: transactions)
                }.navigationTitle(TextConstants.transactionsString)
                    .toolbar {
                        createCategoryFilterMenu()
                            .padding(.trailing, 16)
                    }
            case .failure(let error):
                ErrorViewFactory.makeView(
                    from: error.localizedDescription,
                    isNetwork: false, retryActionClosure: {
                        viewModel.getTransactions()

                    }
                ).navigationTitle(TextConstants.transactionsString)
            case .empty:
                EmptyView(title: TextConstants.transactionEmptyViewString)
                    .navigationTitle(TextConstants.transactionsString)
            }
        }.onAppear {
            viewModel.getTransactions()
        }
    }

    @ViewBuilder func createList(transactions: [Item]) -> some View {
        List {
            ForEach(transactions, id: \.self) { transaction in
                NavigationLink(value: transaction) {
                    TransactionsCellView(viewModel: TransactionsCellViewModel(transactionItem: transaction))
                }
            }

        }.listStyle(PlainListStyle())
            .navigationDestination(for: Item.self) { transaction in
                TransactionsDetailsViewFactory.makeView(from: transaction)
            }
    }

    @ViewBuilder func createCategoryFilterMenu() -> some View {
        Menu {
            createMenuButtons()
        } label: {
            navigationBarView()
        }
    }

    @ViewBuilder func createMenuButtons() -> some View {
        Button(TextConstants.allCategoriesString ,action: {
            withAnimation {
                viewModel.filterListByCategory(category: 0)
                viewModel.selectedCategory = 0
            }
        })
        ForEach(viewModel.categories.sorted { $0 < $1 }, id: \.self) { category in
            Button(TextConstants.categoryString + " \(category)",action: {
                withAnimation {
                    viewModel.filterListByCategory(category: category)
                    viewModel.selectedCategory = category
                }
            })
        }
    }

    @ViewBuilder func navigationBarView() -> some View {
        HStack {
            if viewModel.showTotalView {
                Text(TextConstants.totalString + " \(viewModel.getCategoryTotal())")
                    .transition(.opacity)
                    .foregroundColor(.black)
            }
            Image(systemName: Icons.ellipsisCircle)
                .foregroundColor(.black)
        }
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListViewFactory.makeView()
    }
}
