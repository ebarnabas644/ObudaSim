//
//  SemesterCounter.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 22..
//

import Foundation
import SwiftUI

struct SemesterCounter : View {
    var width : CGFloat
    var height : CGFloat
    var counter : Int
    
    init(width : CGFloat, height : CGFloat, counter : Int) {
        self.width = width
        self.height = height
        self.counter = counter
    }
    
    var body: some View{
        ZStack{
            Circle()
                .frame(width: self.width, height: self.height, alignment: .center)
                .foregroundColor(.orange)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            Text("\(self.counter)")
                .bold()
        }
    }
}
