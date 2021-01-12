//
//  AddView.swift
//  iExpense
//
//  Created by Brando Lugo on 1/11/21.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id:\.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
                Section{
                    HStack{
                        Spacer()
                        Button(action: {
                            if let actualAmount = Int(self.amount)
                            {
                                let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                                self.expenses.items.append(item)
                            }
                        }) {
                            HStack{
                                Image(systemName: "square.and.pencil")
                                Text("Save")
                            }
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                        
                        Spacer()
                    }
                }
               
            }
            .navigationBarTitle("Add expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
