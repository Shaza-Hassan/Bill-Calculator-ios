//
//  BillCreationView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 09/05/2021.
//

import SwiftUI

struct BillCreationView: View {
    @ObservedObject var viewModel: BillCreationViewModel
    @State var showResult : Bool = false
    var body: some View {
        VStack(alignment:.leading){
            Text("Number of people in this bill:")
            TextField("No of people", text: $viewModel.noOfPeople)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: viewModel.noOfPeople, perform: { value in
                    viewModel.checkIfNumberOnly(text: value)
                })
            
            if viewModel.showNumberError{
                Text("Should number only")
                    .foregroundColor(.red)
            }
            
            if viewModel.showEmptyError{
                Text("Shouldn't be Empty")
                    .foregroundColor(.red)
            }
            HStack{
                CheckBoxView(checkState: $viewModel.servises, text: "Services"){
                    viewModel.changeServicesState()
                }
                Spacer()
                CheckBoxView(checkState: $viewModel.delivery, text: "Delivery"){
                    viewModel.changeDeliveryState()
                }
                Spacer()
                CheckBoxView(checkState: $viewModel.taxes, text: "Taxes"){
                    viewModel.changeTaxesState()
                }
            }.padding(.top,30)
            
            Divider()
            
            HStack {
                Spacer()
                let billCalculatorViewModel = BillCalculatorViewModel(billCreationModel: viewModel.creationBillModel)
                
                NavigationLink(destination:BillCalculatorView(viewModel: billCalculatorViewModel), isActive: $viewModel.notEmpty){
                    EmptyView()
                }
                Spacer()
            }.padding(.top,30)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,alignment: .top)
        .padding()
        .navigationTitle("Bill creation")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            Button("Create Bill"){
                viewModel.checkEmpty()
                
            }
        }
        
    }
}

struct BillCreationView_Previews: PreviewProvider {
    static var previews: some View {
        BillCreationView(viewModel: BillCreationViewModel())
    }
}

struct BillCreationViewRTL_Previews: PreviewProvider {
    static var previews: some View {
        BillCreationView(viewModel: BillCreationViewModel()).environment(\.locale, Locale(identifier: "ar"))
    }
}
