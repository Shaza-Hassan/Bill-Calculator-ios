//
//  ItemView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 16/05/2021.
//

import SwiftUI

struct ItemView: View {
    @State var itemPrice:String = ""
    @Binding var itemModel :ItemModel
    @Binding var userModel: UserModel
    var removeItem : () -> ()
    var body: some View {
        HStack{
            TextField("Item name", text: $itemModel.itemName).textFieldStyle(RoundedBorderTextFieldStyle())
                
            
            TextField("Item Price", text: $itemPrice).textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .onChange(of: itemPrice, perform: { value in
                    itemModel.itemPrice = Double(value)
                }).padding(.leading,10)
            
            Button(action:{
                removeItem()
            }){
                HStack(){
                    Image(systemName: "minus")
                }.foregroundColor(.red)
                    .frame(width: 44, alignment: .center)
            }
        }
        .padding(.top,10)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView( itemModel: .constant(ItemModel()), userModel: .constant(UserModel()),removeItem: {})
    }
}
