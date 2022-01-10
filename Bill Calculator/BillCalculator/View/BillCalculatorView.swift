//
//  BillCalculatorView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 15/05/2021.
//

import SwiftUI

struct BillCalculatorView: View {
    @StateObject var viewModel:BillCalculatorViewModel
    
    @Binding var navigateToResult :Bool
    var navigation: Navigation = Navigation()
    
    var body: some View {
        ZStack{
            switch navigation.view{
            case .calcultor:
                
                    ScrollView{
                        VStack(alignment:.leading){
                            
                            deliveryView()
                            
                            taxesView()
                            
                            servicesView()
                            
                            divider()
                            
                            ForEach(viewModel.billCreationModel.users.indices, id:\.self) { index in
                                UserView(userModel: $viewModel.billCreationModel.users[index])
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,alignment: .top)
                        .padding()
                        .toolbar{
                            Button(action: {
                                viewModel.checkIfthereIsItemForEveryUser()
                                if(viewModel.showResult){
                                    navigation.view = .result
                                }
                                    
                            }, label: {
                                Text("Calculate Bill")
                            })
                        }
                    }
                    .alert(isPresented: $viewModel.showErrorAlert) {
                        Alert(title: Text(viewModel.errorMessage), message: nil,
                              dismissButton:
                                .default(Text("Ok"))
                        )
                    }
                    .navigationTitle(Text("Calculator"))
            case .result:
                VStack{
                    ForEach(viewModel.billCreationModel.users, id:\.id){
                        user in
                        Text("\(user.userName) : \(user.totalCost)")
                    }
                }
                .navigationTitle(Text("Result"))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(navigation)
    }
    
    @ViewBuilder
    func divider() -> some View {
        if (viewModel.billCreationModel.delivery ?? false) || (viewModel.billCreationModel.taxes ?? false) || (viewModel.billCreationModel.services ?? false) {
            Divider().padding(.top,20)
        }
    }
    
}

struct BillCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        BillCalculatorView(viewModel: BillCalculatorViewModel(billCreationModel: BillCreationModel()), navigateToResult: .constant(false))
    }
}


class Navigation:ObservableObject{
    var view: Views = .calcultor
}

enum Views: CaseIterable{
    case calcultor
    case result
}
