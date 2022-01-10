//
//  CreationBillModel.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 15/05/2021.
//

import Foundation

struct BillCreationModel:Identifiable {
    var id: String = UUID().uuidString
    var users:[UserModel] = []
    var delivery:Bool?
    var taxes:Bool?
    var services:Bool?
}
