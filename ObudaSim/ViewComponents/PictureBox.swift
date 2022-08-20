//
//  PictureBox.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 16..
//

import Foundation
import SwiftUI

struct PictureBox : View {
    var pictureName : String
    
    init(pictureName : String) {
        self.pictureName = pictureName
    }
    
    var body: some View{
        Image(pictureName)
            .resizable()
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 5))
            .cornerRadius(5)
    }
    
}
