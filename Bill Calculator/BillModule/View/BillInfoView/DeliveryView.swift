//
//  DeliveryView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 18/09/2021.
//

import Foundation
import SwiftUI

extension BillInfoView{
    @ViewBuilder
    func deliveryView() -> some View {
        if viewModel.billCreationModel.delivery ?? false{
            TextFieldWithHeader(header: "Delivery", hint: "Delivery", text: $viewModel.deliveryText,keyBoardType: .decimalPad)
        }
    }
}
