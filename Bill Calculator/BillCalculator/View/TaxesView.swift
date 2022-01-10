//
//  TaxesView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 18/09/2021.
//

import Foundation
import SwiftUI

extension BillCalculatorView{
    
    @ViewBuilder
    func taxesView() -> some View {
        if viewModel.billCreationModel.taxes ?? false{
            TextFieldWithHeader(header: "Taxes", hint: "Taxes", text: $viewModel.taxesText,keyBoardType: .decimalPad)
        }
    }
}
