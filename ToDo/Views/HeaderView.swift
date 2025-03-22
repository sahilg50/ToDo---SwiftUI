//
//  HeaderView.swift
//  ToDo
//
//  Created by Sahil Gupta on 22/03/25.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .edgesIgnoringSafeArea(.top)
            
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3, alignment: .center)

    }
}

#Preview {
    HeaderView(
        title: "Title",
        subTitle: "Sub Title",
        backgroundColor: Color(white: 0.9)
    )
}
