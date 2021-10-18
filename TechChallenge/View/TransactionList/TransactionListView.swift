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
                FloatingView(color: viewModel.categories[viewModel.categoryIndex].color,
                             sum: viewModel.transactions.sum(\.amount).formatted(),
                             title: viewModel.categories[viewModel.categoryIndex].rawValue)
                
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
    }
        
    
    func makeCategoryView() -> some View {
        ScrollView(.horizontal) {
            HStack {
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
