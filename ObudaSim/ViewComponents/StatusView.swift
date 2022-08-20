//
//  StatusView.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 12..
//

import Foundation
import SwiftUI

struct StatusView: View {
    @EnvironmentObject var statusViewModel : StatusViewModel
    var height : CGFloat
    var width : CGFloat
    
    init(width : CGFloat, height : CGFloat){
        self.height = height
        self.width = width
    }
    
    var body: some View {
        GeometryReader{ geometry in
            HStack{
                ProgressBar(percent: ConvertStatusToCGFloat(status: statusViewModel.status.state.money), progressColor: .yellow, bgColor: .gray, width: width, height: geometry.size.height, status: statusViewModel.moneyStatus)
                ProgressBar(percent: ConvertStatusToCGFloat(status: statusViewModel.status.state.energy), progressColor: .orange, bgColor: .gray, width: width, height: geometry.size.height, status: statusViewModel.energyStatus)
                ProgressBar(percent: ConvertStatusToCGFloat(status: statusViewModel.status.state.alcohol), progressColor: .purple, bgColor: .gray, width: width, height: geometry.size.height, status: statusViewModel.alcoholStatus)
                ProgressBar(percent: ConvertStatusToCGFloat(status: statusViewModel.status.state.study), progressColor: .blue, bgColor: .gray, width: width, height: geometry.size.height, status: statusViewModel.studyStatus)
        }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }.frame(height: self.height)
    }
    
    func ConvertStatusToCGFloat(status : Int) -> CGFloat {
        return (CGFloat)(Double(status) / 100.0)
    }
}
