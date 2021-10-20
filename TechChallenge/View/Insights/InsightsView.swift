//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {

    @ObservedObject var viewModel = TransactionListViewModel()
    // uses same data source so I decided on 1 view model for 2 views
    var body: some View {
        List {
            RingView(transactions: viewModel.transactions)
                .scaledToFit()
            
            ForEach(viewModel.categories) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    // TODO: calculate cummulative expense for each category
                    // WIP 
                    let cummulative = viewModel.categoryExpense(category: category)
                    Text("$\(cummulative.formatted())")
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
            .previewLayout(.sizeThatFits)
    }
}
#endif
