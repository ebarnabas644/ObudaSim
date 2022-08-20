//
//  ProgressBarView.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 12..
//

import Foundation
import SwiftUI

struct ProgressBar: View{
    
    var progress : CGFloat
    var barHeight : CGFloat = 100
    var barWidth : CGFloat = 20
    var progressColor : Color
    var bgColor : Color
    var status : ChangeMode
    
    init(percent : CGFloat, progressColor : Color, bgColor : Color, width : CGFloat, height : CGFloat, status : ChangeMode) {
        progress = percent
        self.progressColor = progressColor
        self.bgColor = bgColor
        self.barWidth = width
        self.barHeight = height
        self.status = status
    }
    
    var body: some View{
        ZStack(alignment: .bottom) {
            Rectangle().frame(width: barWidth, height: barHeight)
                .foregroundColor(status == .Neutral ? bgColor : status == .Decrease ? .red : .green)
                .opacity(0.5)
            Rectangle().frame(width: barWidth, height: barHeight * progress)
                .foregroundColor(progressColor)
                .animation(.linear)
                .cornerRadius(45)
                .opacity(status == .Neutral ? 1 : 0.5)
        }
        .cornerRadius(45)
        .padding()
    }
}
