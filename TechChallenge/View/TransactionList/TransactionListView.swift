//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
    @ObservedObject var viewModel = TransactionListViewModel()
    @State private var selection: Set<TransactionModel> = []
    
    var body: some View {
            VStack {
                makeCategoryView()
                ScrollView {
                    ForEach(viewModel.transactions) { transaction in
                        TransactionView(transaction: transaction, isNotExpanded: self.selection.contains(transaction)
                            )
                            .onTapGesture {
                                self.selectDeselect(transaction)
                            }
                            .modifier(ListRowModifier())
                            .animation(.linear(duration: 0.2))
                    }
                }
                .animation(.easeIn)

                FloatingView(color: viewModel.categories[viewModel.categoryIndex].color,
                             sum: (viewModel.transactions.sum(\.amount) - selection.sum(\.amount)).formatted(),
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
    
    private func selectDeselect(_ transaction: TransactionModel) {
            if selection.contains(transaction) {
                selection.remove(transaction)
            } else {
                selection.insert(transaction)
            }
        }

}
struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }
    }
}


#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
