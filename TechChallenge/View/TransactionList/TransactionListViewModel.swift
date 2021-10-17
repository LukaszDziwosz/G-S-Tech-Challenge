//
//  TransactionListViewModel.swift
//  TechChallenge
//
//  Created by Lukasz Dziwosz on 16/10/2021.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject {
    
    @Published var filteredTransactions: [TransactionModel] = []
    
    init(){
        filterTransaction()
    }
    
    private func filterTransaction() {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
        self.filteredTransactions = transactions.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
        
    }
}
