//
//  BillCalculatorView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 15/05/2021.
//

import SwiftUI

struct BillCalculatorView: View {
    @StateObject var viewModel:BillCalculatorViewModel
    
    @State var navigation: Navigation = Navigation()
    
    var body: some View {
        ZStack{
            switch navigation.view{
            case .calcultor:
                BillInfoView(viewModel: viewModel, navigation: $navigation)
            case .result:
                ResultView(users: viewModel.billCreationModel.users)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(navigation)
    }
}

struct BillCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        BillCalculatorView(viewModel: BillCalculatorViewModel(billCreationModel: BillCreationModel()))
    }
}


class Navigation:ObservableObject{
    var view: Views = .calcultor
}

enum Views: CaseIterable{
    case calcultor
    case result
}
