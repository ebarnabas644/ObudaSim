//
//  MainView.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 17..
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameCore : GameCore
    
    var body: some View {
        switch gameCore.currentView {
        case Page.menu:
            MenuView()
        case Page.game:
            GameView()
        case Page.over:
            EndView()
        }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let gameCore = GameCore()
        MainView().environmentObject(gameCore)
            .environmentObject(gameCore.cardView)
            .environmentObject(gameCore.statusView)
    }
}
}
