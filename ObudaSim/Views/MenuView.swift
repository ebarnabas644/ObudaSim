//
//  MenuView.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 17..
//

import Foundation
import SwiftUI

struct MenuView : View {
    @EnvironmentObject var gameCore : GameCore
    
    var body : some View{
        GeometryReader{ geometry in
            let buttonWidth : CGFloat = geometry.size.width * 0.5
            let buttonHeight : CGFloat = geometry.size.height * 0.1
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("DarkerBlue")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                        .ignoresSafeArea()
                    VStack{
                        Spacer()
                        Text("ObudaSim")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                        Text("Hiba/Nem található a cards.json fájl.")
                            .foregroundColor(.red)
                            .opacity(self.gameCore.cardView.fetchError ? 1 : 0)
                            .font(.system(size: 20))
                        Button{
                            self.gameCore.StartGame()
                        } label: {
                            MenuButtonStyle(content: "Start", width : buttonWidth, height : buttonHeight)
                        }
                        .disabled(gameCore.cardView.fetchError)
                        Spacer()
                    }
                }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        let gameCore = GameCore()
        MenuView().environmentObject(gameCore)
            .environmentObject(gameCore.cardView)
            .environmentObject(gameCore.statusView)
    }
}
