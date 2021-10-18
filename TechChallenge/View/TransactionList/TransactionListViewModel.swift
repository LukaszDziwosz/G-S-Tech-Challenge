//
//  TransactionListViewModel.swift
//  TechChallenge
//
//  Created by Lukasz Dziwosz on 16/10/2021.
//

import Foundation
import Combine


final class TransactionListViewModel: ObservableObject {
    
    @Published var transactions: [TransactionModel] = []
    @Published var categoryIndex: Int = 0
    private var subscriptions = Set<AnyCancellable>()
    
    let categories = TransactionModel.Category.allCases
    
    init(){
        sortTransactions()
    }
    
   func sortTransactions() {
        let transactions: [TransactionModel] = ModelData.sampleTransactions

        self.transactions = transactions.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
    }
    
    func filterTransactions(category: TransactionModel.Category) {
        sortTransactions()
        categoryIndex = categories.firstIndex(of: category) ?? 0
        
        if categoryIndex != 0 {
        var filteredTransactions: [TransactionModel] = []
        $transactions
            .map { $0.filter { $0.category == category} }
            .sink(receiveValue: { filteredTransactions  = $0 })
            .store(in: &subscriptions)
        
        self.transactions = filteredTransactions
        }
    
    }
    
//   func selectDeselect(_ transaction: TransactionModel) {
//       if self.transactions.contains(transaction) {
//           self.transactions.remove(transaction)
//            } else {
//                self.transactions.insert(transaction)
//            }
//        }
    
}
