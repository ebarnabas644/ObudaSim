//
//  CardViewData.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 22..
//

import Foundation
import SwiftUI

struct CardViewData {
    let aspectRatio : CGFloat
    let height : CGFloat
    let width : CGFloat
    let cardBackWidth : CGFloat
    let cardBackHeight : CGFloat
    let cardFrontWidth : CGFloat
    let cardFrontHeight : CGFloat
    let cardTitleWidth : CGFloat
    let cardTitleHeight : CGFloat
    let cardPictureWidth : CGFloat
    let cardPictureHeight : CGFloat
    let cardDescriptionWidth : CGFloat
    let cardDescriptionHeight : CGFloat
    let cardReplyWidth : CGFloat
    let cardReplyHeight : CGFloat
    
    init(height : CGFloat, width : CGFloat, aspectRatio : CGFloat) {
        self.height = height
        self.width = width
        self.aspectRatio = aspectRatio
        self.cardBackWidth = height * 0.9 / aspectRatio
        self.cardBackHeight = height * 0.9
        self.cardFrontWidth = height * 0.83 / aspectRatio
        self.cardFrontHeight = height * 0.85
        self.cardTitleWidth = height * 0.6 / aspectRatio
        self.cardTitleHeight = height * 0.05
        self.cardPictureWidth = height * 0.7 / aspectRatio
        self.cardPictureHeight = height * 0.4
        self.cardDescriptionWidth = height * 0.7 / aspectRatio
        self.cardDescriptionHeight = height * 0.3
        self.cardReplyWidth = height * 0.9 / aspectRatio
        self.cardReplyHeight = height * 0.2
    }
}
