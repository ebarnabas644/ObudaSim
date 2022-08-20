//
//  TutorialPanel.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 18..
//

import Foundation
import SwiftUI

struct TutorialPanel : View {
    @EnvironmentObject var cardViewModel : CardViewModel
    
    var body: some View{
        GeometryReader{ geometry in
            let buttonWidth : CGFloat = geometry.size.width * 0.7
            let buttonHeight : CGFloat = geometry.size.height * 0.1
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack{
            Text("Tutorial")
                .font(.system(size: 60))
                .bold()
                Spacer()
                VStack(alignment: .leading){
                    Text("Pénz").foregroundColor(.yellow)
                        .font(.system(size : 25))
                        .bold()
                Text("Energia").foregroundColor(.orange)
                    .font(.system(size : 25))
                    .bold()
                Text("Alkohol").foregroundColor(.purple)
                    .font(.system(size : 25))
                    .bold()
                Text("Tanulás").foregroundColor(.blue)
                    .font(.system(size : 25))
                    .bold()
                    Text("\n\(Image(systemName: "chevron.right")) Ezeket az erőforrásaidat kell egyensúlyban tartani az egyetemi megpróbáltatásaid során.\n\(Image(systemName: "chevron.right")) Bármelyik elfogy vagy túlcsordul az a játék végét fogja jelenteni.\n\(Image(systemName: "chevron.right")) Egy véletlen eseményre kell reagálnod jobbra vagy balra húzással.\n\(Image(systemName: "chevron.right")) A kártya mozgatásával megjelenthető a 2 válaszlehetőség.\n\(Image(systemName: "chevron.right")) A státusz jelző háttérszíne fogja jelenzni az egyes döntések hatását.\n\(Image(systemName: "chevron.right")) Ha nem tanulsz eleget akkor a vörös kártyák miatt csúszhatsz.")
                        .font(.system(size: 17))

                        
                }.frame(maxWidth: 325, alignment: .leading)
                Spacer()
                Button{
                    cardViewModel.ToggleTutorial()
                } label: {
                    MenuButtonStyle(content: "Vissza a játékhoz", width: buttonWidth, height: buttonHeight)
                }
            }.foregroundColor(.white)
        }
        .opacity(cardViewModel.tutorialVisibility ? 1 : 0)
        }
    }
    
}
