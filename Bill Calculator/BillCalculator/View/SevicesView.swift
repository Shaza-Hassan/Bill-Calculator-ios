//
//  SevicesView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 18/09/2021.
//

import Foundation
import SwiftUI

extension BillCalculatorView{
    
    @ViewBuilder
    func servicesView() -> some View {
        if viewModel.billCreationModel.services ?? false{
            TextFieldWithHeader(header: "Services", hint: "Services", text: $viewModel.servicesText,keyBoardType: .decimalPad)
        }
    }
}
