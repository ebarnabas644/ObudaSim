//
//  ContentView.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 10..
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameCore : GameCore
    
    var body: some View {
        GeometryReader{ geo in
        GeometryReader{ geometry in
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("DarkerBlue")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Button{
                            self.gameCore.GameMenu()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .font(.system(size: 50))
                        }
                        StatusView(width : geometry.size.height * 0.04 ,height: geometry.size.height * 0.15)
                        Button{
                            self.gameCore.cardView.ToggleTutorial()
                        } label: {
                            Image(systemName: "questionmark")
                                .foregroundColor(.white)
                                .font(.system(size: 50))
                        }
                    }
                    .frame(maxWidth: 600,  alignment: .center)
                    CardView()
                    Spacer()
                }
                TutorialPanel()
                
            }
        }.gesture(DragGesture(minimumDistance: 0.0, coordinateSpace: .local)
                    .onChanged{ value in
                        gameCore.cardView.rotation = Double(value.translation.width)
                        if value.translation.width < 0 {
                            gameCore.cardView.reply = gameCore.cardView.currentCard.leftReply
                            gameCore.cardView.replyVisibility = true
                            gameCore.statusView.PreviewStatus(statusImpact : gameCore.cardView.currentCard.statusImpactLeft)
                        }
                        else if value.translation.width > 0 {
                            gameCore.cardView.reply = gameCore.cardView.currentCard.rightReply
                            gameCore.cardView.replyVisibility = true
                            gameCore.statusView.PreviewStatus(statusImpact : gameCore.cardView.currentCard.statusImpactRight)
                        }
                    }
                    .onEnded{ value in
                        if value.translation.width < -geo.size.width * 0.3 {
                            gameCore.LoadLeftChoice()
                            gameCore.cardView.rotation = 0
                        }
                        else if value.translation.width > geo.size.width * 0.3 {
                            gameCore.LoadRightChoice()
                            gameCore.cardView.rotation = 0
                        }
                        else{
                            gameCore.cardView.rotation = 0
                        }
                        gameCore.cardView.replyVisibility = false
                        gameCore.statusView.ResetPreview()
                    })//https://stackoverflow.com/questions/60885532/how-to-detect-swiping-up-down-left-and-right-with-swiftui-on-a-view
    }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let gameCore = GameCore()
        GameView().environmentObject(gameCore)
            .environmentObject(gameCore.cardView)
            .environmentObject(gameCore.statusView)
    }
}
