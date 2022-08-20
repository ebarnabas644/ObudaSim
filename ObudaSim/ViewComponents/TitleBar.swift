//
//  TitleBar.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 16..
//

import Foundation
import SwiftUI

struct TitleBar : View{
    
    var title : String
    var width : CGFloat
    var height : CGFloat
    
    init(title : String, width : CGFloat, height : CGFloat) {
        self.title = title
        self.width = width
        self.height = height
    }
    
    var body: some View{
        ZStack(alignment: .center) {
            HStack{
            Rectangle().frame(width: self.width, height: self.height)
                .foregroundColor(.orange)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 5))
                .cornerRadius(5)
            }
            Text(self.title)
                .font(.system(size: 19))
        }
    }
}
