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
    @Published var selection: Set<TransactionModel> = []
    @Published var categoryIndex: Int = 0
    private var subscriptions = Set<AnyCancellable>()
    
    var allCategories = TransactionModel.Category.allCases
    var categories: [TransactionModel.Category] { allCategories.filter { $0.rawValue != "all" }}
    
    
    init(){
        sortTransactions()
    }
    
   func sortTransactions() {
        let transactions: [TransactionModel] = ModelData.sampleTransactions

       self.transactions = transactions.sorted(by: {$0.date.compare($1.date) == .orderedAscending})
    }
    
    func filterTransactions(category: TransactionModel.Category) {
        sortTransactions()
        categoryIndex = allCategories.firstIndex(of: category) ?? 0
        
        if categoryIndex != 0 {
        var filteredTransactions: [TransactionModel] = []
        $transactions
            .map { $0.filter { $0.category == category} }
            .sink(receiveValue: { filteredTransactions  = $0 })
            .store(in: &subscriptions)
        
       transactions = filteredTransactions
        }
    
    }
    
     func selectDeselect(_ transaction: TransactionModel) {
            if selection.contains(transaction) {
                selection.remove(transaction)
            } else {
                selection.insert(transaction)
            }
        }
    //WIP will use Combine to update InsightView and take away selected this is just temporary
    func categoryExpense(category: TransactionModel.Category) -> Double {
        let total = transactions.reduce(0.0) { result, transaction in
            if (transaction.category == category){
                return result + transaction.amount
            } else {
                return result + 0.0
                }
        }
        return total
    }
    
}
