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
    
    var body: some View{
        ZStack{
            Text(content)
        }
    }
}
