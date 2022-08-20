//
//  ObudaSimApp.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 10..
//

import SwiftUI

@main
struct ObudaSimApp: App {
    @ObservedObject var gameCore : GameCore = GameCore()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(gameCore)
                .environmentObject(gameCore.cardView)
                .environmentObject(gameCore.statusView)
        }
    }
}
