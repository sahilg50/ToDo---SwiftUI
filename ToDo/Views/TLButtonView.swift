//
//  TLButtonView.swift
//  ToDo
//
//  Created by Sahil Gupta on 22/03/25.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let backgrundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            // Attempt login in
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgrundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButtonView(title: "Button", backgrundColor: Color.blue) {
        // Action
    }
}
