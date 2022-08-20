//
//  MenuButton.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 19..
//

import Foundation
import SwiftUI

struct MenuButtonStyle : View {
    var content : String
    var width : CGFloat
    var height : CGFloat
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .cornerRadius(25)
                .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(content)
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}
