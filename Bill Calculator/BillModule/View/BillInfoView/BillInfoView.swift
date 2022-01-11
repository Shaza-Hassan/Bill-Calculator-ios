//
//  BillInfoView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 11/01/2022.
//

import SwiftUI
import CoreData

struct BillInfoView: View {
    @ObservedObject var viewModel:BillCalculatorViewModel
    @Binding var navigation: Navigation

    @Environment(\.managedObjectContext) private var viewContext

    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                
                deliveryView()
                
                taxesView()
                
                servicesView()
                
                divider()
                
                ForEach(viewModel.billCreationModel.users.indices, id:\.self) { index in
                    UserView(userModel: $viewModel.billCreationModel.users[index])
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,alignment: .top)
                .padding()
                .toolbar{
                    Button(action: {
                        viewModel.checkIfthereIsItemForEveryUser()
                        if(viewModel.showResult){
                            navigation.view = .result
                            addBillInCoreData()
                        }
                        
                    }, label: {
                        Text("Calculate Bill")
                    })
                }
        }
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text(viewModel.errorMessage), message: nil,
                  dismissButton:
                        .default(Text("Ok"))
            )
        }
        .navigationTitle(Text("Calculator"))
        
    }
    
    @ViewBuilder
    func divider() -> some View {
        if (viewModel.billCreationModel.delivery ?? false)
            || (viewModel.billCreationModel.taxes ?? false)
            || (viewModel.billCreationModel.services ?? false) {
            Divider().padding(.top,20)
        }
    }
    
    func constructItem(itemModel:ItemModel) -> Items{
        let newItem = Items(context: viewContext)
        newItem.id = itemModel.id
        newItem.itemName = itemModel.itemName
        newItem.itemPrice = itemModel.itemPrice ?? 0.0
        return newItem
    }
    
    func constructUser(userModel:UserModel) -> Users {
        let newUser = Users(context: viewContext)
        var items: [Items] = []
        newUser.totalCost = userModel.totalCost
        newUser.userName = userModel.userName
        newUser.id = userModel.id
        for item in userModel.items{
            let itemInCoreData = constructItem(itemModel: item)
            items.append(itemInCoreData)
        }
        newUser.items = NSSet.init(array: items)
        return newUser
    }
    
    func addBillInCoreData(){
        let billId = viewModel.billCreationModel.id
        let newBill = Bills(context: viewContext)
        newBill.id = billId
        let users = viewModel.billCreationModel.users
        var usersInCoreData: [Users] = []
        for user in users {
            let userInCoreData = constructUser(userModel: user)
            usersInCoreData.append(userInCoreData)
        }
        newBill.users = NSSet.init(array: usersInCoreData)
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

struct BillInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BillInfoView(viewModel: BillCalculatorViewModel(billCreationModel: BillCreationModel()),navigation: .constant(Navigation()))
    }
}
