//
//  SharedTextField.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 18/09/2021.
//

import SwiftUI

struct TextFieldWithHeader: View {
    @State var header:String?
    @State var hint:String
    @Binding var text:String
    var keyBoardType: UIKeyboardType = .default
    var changeHeader:Bool = false
    var body: some View {
        LazyVStack(alignment: .leading){
            if header != nil || (!(header?.isEmpty ?? true)){
                Text(header!)
                .font(.subheadline)
            }
            TextField(hint, text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(keyBoardType)
                .onChange(of: hint, perform: { value in
                    if changeHeader{
                        header = value
                    }
                })
                
        }
        
    }
}

struct SharedTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithHeader(header: "test", hint: "Hint", text: .constant(""))
    }
}
