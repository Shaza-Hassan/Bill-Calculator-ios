//
//  CheckBoxView.swift
//  Bill Calculator
//
//  Created by Shaza Hassan on 09/05/2021.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checkState:Bool
    @State var text :String
    
    var action: (() -> Void)
    var body: some View {
        Button(action:action) {
            HStack(alignment: .top, spacing: 10) {
                
                //2. Will update according to state
                Image(systemName: self.checkState ? "checkmark.square" : "square")
                    
                    .frame(width:20, height:20, alignment: .center)
                    .cornerRadius(5)
                
                Text(text)
                
            }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    
    static var previews: some View {
        CheckBoxView(checkState: .constant(true), text: ""){}
    }
}
