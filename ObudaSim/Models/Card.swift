//
//  Card.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 11..
//

import Foundation
import SwiftUI


struct Card : Codable{
    let special : SpecialEffect.RawValue
    let repeatable : Bool
    let eventName : String
    let rightReply : String
    let leftReply : String
    let description : String
    let statusImpactRight : StatusEffect
    let statusImpactLeft : StatusEffect
    let pictureName : String
}
