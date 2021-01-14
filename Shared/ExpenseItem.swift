//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Brando Lugo on 1/11/21.
//

import Foundation

//Model
struct ExpenseItem: Identifiable, Codable {
    //Unique identifier
    let id = UUID()
    
    let name: String
    let type: String
    let amount: Int
    
    
    
}

//ViewModel
    class Expenses: ObservableObject {
        @Published var items = [ExpenseItem]() {
            didSet {
                let encoder = JSONEncoder()
                
                if let encoded = try? encoder.encode(items) {
                    UserDefaults.standard.set(encoded, forKey: "Items")
                }
            }
        }
        
        init() {
            if let items = UserDefaults.standard.data(forKey: "Items") {
                let decoder = JSONDecoder()
                
                if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                    self.items = decoded
                    return
                }
            }
            
            self.items = []
        }
}
