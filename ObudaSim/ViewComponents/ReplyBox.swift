//
//  ReplyBox.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 16..
//

import Foundation
import SwiftUI

struct ReplyBox : View {
    var replyText : String
    
    init(replyText : String) {
        self.replyText = replyText
    }
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.6)
                .cornerRadius(25)
            Text(replyText)
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
    }
    
}
