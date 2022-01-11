//
//  BillsListView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 11/01/2022.
//

import SwiftUI

struct BillsListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: Bills.entity(),
        sortDescriptors: [],
//        predicate: NSPredicate(
//            format: "users == \(3)"
//        ),
        animation: .default)
    private var bills: FetchedResults<Bills>

    
    var body: some View {
        NavigationView{
            ZStack{
                if bills.isEmpty{
                    Text("Press on plus to add new bill")
                }else{
                    List(bills){
                        bill in
                        Text("\(bill.objectID)" ?? "Bill name")
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: BillCreationView(viewModel: BillCreationViewModel())){
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
}

struct BillsListView_Previews: PreviewProvider {
    static var previews: some View {
        BillsListView()
    }
}
