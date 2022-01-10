//
//  ContentView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 26/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var showError = false
    var body: some View {
        VStack{
            TextField("hint",
                      text: $text,
                      onCommit:{
                        if !isNumberOnly(text: text){
                            showError = true
                        }else{
                            showError = false
                        }
                      })
                .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if showError{
                Text("Accept number only")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
