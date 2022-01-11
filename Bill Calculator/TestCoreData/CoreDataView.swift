//
//  CoreDataView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 10/01/2022.
//

import SwiftUI
import CoreData

struct CoreDataView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: Entity.entity(),
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Entity>
    var body: some View {
        NavigationView{
            List{
                ForEach(items){
                    item in
                    Text(item.title ?? "Default")
                }
                .onDelete(perform: deleteItems)
            }

            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Entity(context: viewContext)
            newItem.title = UUID().uuidString

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
