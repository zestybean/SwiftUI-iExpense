//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Brando Lugo on 1/11/21.
//

import Foundation

//Model
struct ExpenseItem: Identifiable {
    //Unique identifier
    let id = UUID()
    
    let name: String
    let type: String
    let amount: Int
    
}

//ViewModel
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
