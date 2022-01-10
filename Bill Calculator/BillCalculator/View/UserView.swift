//
//  UserView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 15/05/2021.
//

import SwiftUI
import Combine

struct UserView: View {
    @Binding var userModel:UserModel
    var body: some View {
     
            VStack(alignment:.leading){
                TextFieldWithHeader(header: userModel.userName, hint: "User Name", text: $userModel.userName,changeHeader: true)
                
                if userModel.items.count > 0{
                    VStack{
                        ForEach($userModel.items, id: \.id) { item in
                            ItemView(itemModel: item, userModel: $userModel, removeItem: {
                                if let index = userModel.items.firstIndex(of: item.wrappedValue){
                                    userModel.items.remove(at: index)
                                    userModel = userModel
                                }
                            })
                        }
                    }
                }
                
                
                Button(action:{
                    let item = ItemModel()
                    let user = userModel
                    user.items.append(item)
                    self.userModel = user
                }){
                    HStack(){
                        Spacer()
                        Text("Add Item")
                        Image(systemName: "plus")
                    }
                }
                
                Divider().padding(.bottom,10)
                
                
            }
        
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userModel: .constant(UserModel()))
    }
}
