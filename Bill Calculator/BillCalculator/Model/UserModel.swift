//
//  UserModel.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 16/05/2021.
//

import Foundation
import Combine

class UserModel:Identifiable,Equatable,ObservableObject {
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int = 1
    var userName: String = ""
    var totalCost:Double = 0.0
    var items: [ItemModel] = []
}
