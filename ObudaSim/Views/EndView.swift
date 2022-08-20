//
//  EndView.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 18..
//

import Foundation
import SwiftUI

struct EndView : View {
    @EnvironmentObject var gameCore : GameCore
    
    var body : some View{
        GeometryReader{ geometry in
            let buttonWidth : CGFloat = geometry.size.width * 0.5
            let buttonHeight : CGFloat = geometry.size.height * 0.1
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"),Color("DarkerBlue")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                VStack{
                    Text(self.gameCore.endCause == .Victory ? "Nyertél" : "Game Over")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                    Text(self.gameCore.EndText())
                        .foregroundColor(self.gameCore.endCause == .Victory ? .green : .red)
                        .font(.system(size: 22))
                        .padding()
                    Button{
                        self.gameCore.GameMenu()
                    } label: {
                        MenuButtonStyle(content: "Menü", width: buttonWidth, height: buttonHeight)
                    }
                }
            }
        }
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        let gameCore = GameCore()
        EndView().environmentObject(gameCore)
            .environmentObject(gameCore.cardView)
            .environmentObject(gameCore.statusView)
    }
}
