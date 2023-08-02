//
//  PlusView.swift
//  iExpense
//
//  Created by Maverick Brazill on 8/2/23.
//

import SwiftUI

struct PlusView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State var name = ""
    @State var type = "Personal"
    @State var amount = 0.0
    let types = ["Personal", "Buisness"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("name", text: $name)
                
                Picker("type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("amount", value: $amount, format: .currency(code: "USD"))
                Button{
                    let newItem = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(newItem)
                    
                    dismiss()
                }label:{
                    Text("Save")
                }.buttonStyle(.borderedProminent)
            }
            
        }.navigationTitle("Add new Expense")
    }
}

