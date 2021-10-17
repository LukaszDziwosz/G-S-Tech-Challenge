//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
    @ObservedObject var viewModel = TransactionListViewModel()
    
    var body: some View {
        VStack {
            makeCategoryView()
            List {
                ForEach(viewModel.transactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
    func makeCategoryView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                Button{
                    viewModel.sortTransactions()
                    }label: {
                        RoundButtonView(color: .black, title: "all")
                    }
                ForEach(viewModel.categories) { category in
                    Button{
                        viewModel.filterTransactions(category: category)
                        }label: {
                            RoundButtonView(color: category.color, title: category.rawValue)
                        }
                }
            }
            .padding()
        }
        .background(Color.accentColor)
        .opacity(0.8)
    }
}


#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
