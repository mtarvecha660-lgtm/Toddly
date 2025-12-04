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
    
    @State private var title: String = ""
    @State private var isAlertShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(lists)
                {
                    list in
                    Text(list.title)
                        .font(.title2)
                        .fontWeight(.light)
                        .padding(.vertical,2)
                        .swipeActions{
                            Button("Delete", role: .destructive){
                                modelContext.delete(list)
                            }
                        }
                }
            }
            .navigationTitle("MyList")
            .toolbar{
                ToolbarItem(placement:.topBarTrailing){
                    Button{
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .alert("Create a new item", isPresented: $isAlertShowing){
                TextField("Enter a item", text: $title)
                
                Button(){
                    modelContext.insert(Listt(title: title))
                    title = ""
                }label:{
                    Text("Save")
                }
                .disabled(title.isEmpty)
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

#Preview("Second List") {
    let container = try! ModelContainer(for: Listt.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    let ctx = container.mainContext
    ctx.insert(Listt(title: "Swift Coding Club"))
    ctx.insert(Listt(title: "Laundary"))
    ctx.insert(Listt(title: "Homework"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Main List") {
    ContentView()
        .modelContainer(for: Listt.self, inMemory: true)
}
