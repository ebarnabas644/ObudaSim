//
//  CardView.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 10..
//

import Foundation
import SwiftUI

struct CardView: View {
    @EnvironmentObject var cardViewModel : CardViewModel
    
    var body: some View {
        GeometryReader{ geometry in
            let aspectRatio : CGFloat = 1.5
            let height = geometry.size.height
            let width = geometry.size.width
            let size = CardViewData(height: height, width: width, aspectRatio: aspectRatio)
            
            ZStack{
                Rectangle()
                    .frame(width: size.cardBackWidth, height: size.cardBackHeight, alignment: .bottom)
                    .foregroundColor(Color("Brown"))
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 5))
                    .cornerRadius(25)
                Rectangle()
                    .frame(width: size.cardFrontWidth, height: size.cardFrontHeight)
                    .foregroundColor(GetCardTypeColor())
                    .cornerRadius(15)
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                    VStack{
                        Spacer()
                        HStack{
                        TitleBar(title: cardViewModel.currentCard.eventName, width: size.cardTitleWidth, height: size.cardTitleHeight)
                            SemesterCounter(width: size.cardTitleHeight, height: size.cardTitleHeight, counter: cardViewModel.currentSemester)
                        }
                        PictureBox(pictureName: cardViewModel.currentCard.pictureName)
                            .frame(width: size.cardPictureWidth, height: size.cardPictureHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        DescriptionBox(description: cardViewModel.currentCard.description)
                            .frame(width: size.cardDescriptionWidth, height: size.cardDescriptionHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    ReplyBox(replyText: cardViewModel.reply)
                        .frame(width: size.cardReplyWidth, height: size.cardReplyHeight)
                        .opacity(cardViewModel.replyVisibility ? 1 : 0)
                })
            }.frame(width: width, height: height, alignment: .center)
            .shadow(radius: 30)
            .rotationEffect(.degrees(Util.Clamp(value: cardViewModel.rotation / 4, range: -18..<18)), anchor: .bottom)
            .animation(.easeIn(duration : 0.3))
        }
    }
    
    func GetCardTypeColor() -> Color{
        switch self.cardViewModel.currentCard.special {
        case SpecialEffect.ExtraSemester.rawValue:
            return Color("DarkRed")
        default:
            return Color("DarkBrown")
        }
    }
}
