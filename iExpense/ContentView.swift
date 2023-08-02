//
//  ContentView.swift
//  iExpense
//
//  Created by Maverick Brazill on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var newExpense = false
    @StateObject var expenses = Expenses()
    
    func removeItem(at offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                    Button{
                        newExpense.toggle()
                    }label:{
                        Image(systemName: "plus")
                    }
                }.padding(.trailing, 20)
                List{
                    ForEach(expenses.items, id:\.id){ item in
                        HStack{
                            VStack{
                                Text(item.name)
                                    .multilineTextAlignment(.leading)
                                    .fontWeight(.bold)
                                Text(item.type)
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                            
                            Text(item.amount.formatted(.currency(code: "USD")))
                        }
                    }.onDelete(perform: removeItem)
                }.listStyle(.plain)
                .sheet(isPresented: $newExpense){
                    PlusView(expenses: expenses)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
