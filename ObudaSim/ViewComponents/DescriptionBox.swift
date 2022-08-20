//
//  DescriptionBox.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 16..
//

import Foundation
import SwiftUI

struct DescriptionBox : View {
    var description : String
    
    init(description : String) {
        self.description = description
    }
    
    var body: some View{
        GeometryReader{ geometry in
        ZStack {
            Rectangle()
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.orange)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 5))
                .cornerRadius(5)
            Text(description)
                .font(.system(size: 20))
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
    }

}

