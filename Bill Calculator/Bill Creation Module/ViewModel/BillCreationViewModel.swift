//
//  BillCreationViewModel.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 14/05/2021.
//

import Foundation

class BillCreationViewModel: ObservableObject{
    
    @Published var servises:Bool = false
    @Published var delivery:Bool = false
    @Published var taxes:Bool = false
    @Published var noOfPeople:String = ""
    @Published var showNumberError = false
    @Published var showEmptyError = false
    @Published var notEmpty = false
    @Published var creationBillModel: BillCreationModel = BillCreationModel()
    
    func changeServicesState(){
        servises.toggle()
    }

    func changeDeliveryState(){
        delivery.toggle()
    }
    
    func changeTaxesState(){
        taxes.toggle()
    }
    
    func checkIfNumberOnly(text:String) {
        if isNumberOnly(text: text){
            showNumberError = false
        }else{
            showNumberError = true
        }
    }
    
    func checkEmpty() {
        if isEmpty(text: noOfPeople){
            showEmptyError = true
            notEmpty = false
        }else{
            showEmptyError = false
            notEmpty = true
            constructObject()
        }
    }
    
    func constructObject(){
        creationBillModel.delivery = delivery
        creationBillModel.services = servises
        creationBillModel.taxes = taxes
        creationBillModel.users.removeAll()
        createUsers()
    }

    func createUsers(){
        for index in 1...Int(noOfPeople)! {
            let userModel = UserModel()
            userModel.id = index
            userModel.userName = "User \(index)"
            creationBillModel.users.append(userModel)
        }
    }
}
