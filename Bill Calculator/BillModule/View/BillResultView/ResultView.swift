//
//  ResultView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 10/01/2022.
//

import SwiftUI

struct ResultView: View {
    var users: [UserModel]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(users,id: \.id){user in
                    HStack{
                        Text("\(user.userName) : ")
                            .font(.headline)
                            
                        Text(String(format: "%.1f", user.totalCost))
                            .font(.body)
                    }
                    Divider()
                }
            }
        }
        .padding()
        .navigationTitle(Text("Result"))

    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(users: [UserModel(),UserModel()])
    }
}
