//
//  CheckFieldsIsEmpty.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 26/04/2021.
//

import Foundation

func isEmpty(text:String) -> Bool {
    return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
}

func isNumberOnly(text:String) -> Bool {
    let x = CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: text))
    return x
}
