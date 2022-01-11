//
//  BillCalculatorApp.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 11/01/2022.
//


import SwiftUI

@main
struct BillCalculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            BillsListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
