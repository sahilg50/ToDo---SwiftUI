//
//  TLButtonView.swift
//  ToDo
//
//  Created by Sahil Gupta on 22/03/25.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            // Attempt login in
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButtonView(title: "Button", backgroundColor: Color.blue) {
        // Action
    }
}
