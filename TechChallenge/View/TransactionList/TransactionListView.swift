//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
    @ObservedObject var viewModel = TransactionListViewModel()
   
    let categories = TransactionModel.Category.allCases
    
    var body: some View {
        VStack {
            makeCategoryView()
            List {
                ForEach(viewModel.filteredTransactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
    }
    func makeCategoryView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                Button{
                    print("tapped")
                    }label: {
                        RoundButtonView(color: .black, title: "all")
                    }
                ForEach(categories) { category in
                    Button{
                        print("tapped")
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
