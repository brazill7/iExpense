//
//  Expenses.swift
//  iExpense
//
//  Created by Maverick Brazill on 8/2/23.
//

import Foundation


struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]() {
        didSet{
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "items"){
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decoded
                return
            }
        }
        items = []
    }
}
