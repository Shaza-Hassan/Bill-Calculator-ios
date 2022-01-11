//
//  BillCalculatorViewModel.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 20/09/2021.
//

import Foundation
import Combine
class BillCalculatorViewModel:ObservableObject {
    
    @Published var deliveryText:String
    @Published var deliveryError:Bool = false
    @Published var errorDeliveryText:String?

    @Published var servicesText:String
    @Published var servicesError:Bool = false
    @Published var errorServicesText:String?
    
    @Published var taxesText:String
    @Published var taxesError:Bool = false
    @Published var errorTaxesText:String?
    
    @Published var billCreationModel: BillCreationModel
    
    @Published var enableCalculationButton: Bool
    
    @Published var errorMessage:String = ""
    @Published var showErrorAlert: Bool = false
    @Published var showResult: Bool = false

    init(billCreationModel:BillCreationModel,
         enableCalculationButton: Bool = false,
         deliveryText:String = "",
         servicesText:String = "",
         taxesText:String = "") {
        self.billCreationModel = billCreationModel
        self.enableCalculationButton = enableCalculationButton
        self.deliveryText = deliveryText
        self.taxesText = taxesText
        self.servicesText = servicesText
    }
    
    func checkIfthereIsItemForEveryUser() {
        removeEmptyItems()
        for user in billCreationModel.users{
            if(user.items.isEmpty){
                enableCalculationButton = false
                showErrorMessage(errorMessage: "Insert Items for \(user.userName)")
                return
            }else{
                enableCalculationButton = true
            }
        }
        if(checkItemNames()){
            showErrorMessage(errorMessage: "Insert Items Name")
            return
        }
        
        startCalcution()
    }

    func removeEmptyItems(){
        for user in billCreationModel.users{
            let items = user.items.filter({
                $0.itemPrice != nil
            })
            user.items = items
        }
    }
    
    func checkItemNames() -> Bool{
        let items = billCreationModel.users.filter({
            $0.items.filter({
                $0.itemName.isEmpty
            }).isEmpty
        })
        return items.isEmpty
    }
    
    fileprivate func checkDeliveryField() {
        if(billCreationModel.delivery == true){
            if deliveryText.isEmpty {
                showErrorMessage(errorMessage: "")
            }
        }
    }
    
    func checkFields(){
        checkDeliveryField()
    }
    
    func showErrorMessage(errorMessage:String) {
        self.errorMessage = errorMessage
        self.showErrorAlert = true
    }
    
    func startCalcution(){
        let totalShared = calcuateTotalShared()
        let sharedForEachOne = totalShared / Double(billCreationModel.users.count)
        for user in billCreationModel.users{
            user.totalCost += sharedForEachOne
            for userItem in user.items{
                user.totalCost += userItem.itemPrice ?? 0.0
            }
            print(user.totalCost)
        }
        
        showResult = true
    }
    
    private func calcuateTotalShared() -> Double {
        var sum = 0.0
        if (!deliveryText.isEmpty){
            sum += Double(deliveryText) ?? 0.0
        }
        
        if (!taxesText.isEmpty){
            sum += Double(taxesText) ?? 0.0
        }
        
        if(!servicesText.isEmpty){
            sum += Double(servicesText) ?? 0.0
        }
        
        return sum
    }
}
