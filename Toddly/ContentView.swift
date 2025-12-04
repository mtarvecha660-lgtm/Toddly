//
//  ContentView.swift
//  Toddly
//
//  Created by student on 04/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext)
        private var modelContext
    
    @Query private var lists: [Listt]
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(lists)
                {
                    list in
                    Text(list.title)
                }
            }
            .navigationTitle("MyList")
            .toolbar{
                ToolbarItem(placement:.topBarTrailing){
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .overlay{
                if lists.isEmpty{
                    ContentUnavailableView("Add your item",
                                           systemImage:"heart.circle",description: Text("No item is added. Add one"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
