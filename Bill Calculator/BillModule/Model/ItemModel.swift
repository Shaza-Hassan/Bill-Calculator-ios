//
//  ItemModel.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 16/05/2021.
//

import Foundation

class ItemModel:ObservableObject,Identifiable,Equatable {
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID().uuidString
    var itemName:String = ""
    var itemPrice:Double?
}
