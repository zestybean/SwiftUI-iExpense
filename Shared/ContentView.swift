//
//  ContentView.swift
//  Shared
//
//  Created by Brando Lugo on 1/10/21.
//

import SwiftUI

//View
struct ContentView: View {
    //Watch for changes to envoke the body 
    @ObservedObject var expenses = Expenses()
    
    //Flag to see if add view is showing
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text("$\(item.amount)")
                        }
                    }
                    
                    .onDelete(perform: removeItems)
                }
                .navigationBarTitle("iExpense")
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add")
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(25)
                
            }
            .padding()
            
        }
        .sheet(isPresented: $showingAddExpense){
            //Show add view instance here
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
