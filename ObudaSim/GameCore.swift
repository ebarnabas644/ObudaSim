//
//  GameCore.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 12..
//

import Foundation
import SwiftUI

class GameCore : ObservableObject {
    @ObservedObject private(set) var cardView : CardViewModel = CardViewModel()
    @ObservedObject private(set) var statusView: StatusViewModel = StatusViewModel()
    @Published private(set) var currentView : Page = .menu
    private var numberOfMaxSemesters = 11
    private var numberOfCardsPerSemester = 3
    private var numberOfStartingSemesters = 7
    private var cardPlayed = 0
    @Published var endCause : EndCause = .Victory
    
    func LoadRightChoice() -> Void {
        self.statusView.ModifyStatus(statusImpact: cardView.currentCard.statusImpactRight)
        self.ProgressSemester()
        self.CheckGameOver()
        self.cardView.LoadNext()
    }
    
    func LoadLeftChoice() -> Void {
        self.statusView.ModifyStatus(statusImpact: cardView.currentCard.statusImpactLeft)
        self.ProgressSemester()
        self.CheckGameOver()
        self.cardView.LoadNext()
    }
    
    func ProgressSemester() -> Void {
        self.cardPlayed += 1
        if self.cardPlayed >= numberOfCardsPerSemester {
            self.cardPlayed = 0
            self.cardView.IncreaseCompletedSemesters()
            self.statusView.status.numberOfCompletedSemesters += 1
        }
    }
    
    func CheckSpecialEffects() -> Void {
        switch self.cardView.currentCard.special {
        case SpecialEffect.None.rawValue:
            break
        case SpecialEffect.ExtraSemester.rawValue:
            if self.statusView.status.state.study < 50 {
                self.cardView.ShuffleDeck(numberOfCards: numberOfCardsPerSemester)
            }
        default:
            break
        }
    }
    
    func CheckGameOver() -> Void {
        var gameOver : Bool = false
        if self.statusView.status.state.money <= 0 {
            gameOver = true
            self.endCause = .LowMoney
        }
        
        else if self.statusView.status.state.money >= 100 {
            gameOver = true
            self.endCause = .HighMoney
        }
        
        else if self.statusView.status.state.energy <= 0{
            gameOver = true
            self.endCause = .LowEnergy
        }
        
        else if self.statusView.status.state.energy >= 100 {
            gameOver = true
            self.endCause = .HighEnergy
        }
        
        else if self.statusView.status.state.alcohol <= 0 {
            gameOver = true
            self.endCause = .LowAlcohol
        }
        
        else if self.statusView.status.state.alcohol >= 100 {
            gameOver = true
            self.endCause = .HighAlcohol
        }
        
        else if self.statusView.status.state.study <= 0 {
            gameOver = true
            self.endCause = .LowStudy
        }
        
        else if self.statusView.status.state.study >= 100 {
            gameOver = true
            self.endCause = .HighStudy
        }
        
        else if self.statusView.status.numberOfCompletedSemesters > self.numberOfMaxSemesters{
            gameOver = true
            self.endCause = .OutOfSemesters
        }
        
        else if self.cardView.outOfCards {
            gameOver = true
            self.endCause = .Victory
        }
        
        if gameOver
        {
            self.GameOver()
        }
    }
    
    func StartGame() -> Void {
        self.SwitchView(page: .game)
        self.statusView.resetStatus()
        self.cardView.ResetDeck()
        self.cardView.ShuffleDeck(numberOfCards: self.numberOfStartingSemesters * self.numberOfCardsPerSemester)
        self.cardView.LoadNext()
    }
    
    func GameOver() -> Void {
        self.SwitchView(page: .over)
    }
    
    func GameMenu() -> Void {
        self.SwitchView(page: .menu)
    }
    
    func EndText() -> String{
        switch self.endCause {
            case .LowMoney:
                return "Elfogyott a p??nzed."
            case .LowEnergy:
                return "Teljesen kimer??lt??l."
            case .LowAlcohol:
                return "Nem itt??l eleget."
            case .LowStudy:
                return "Megbukt??l a vizsg??idon."
            case .HighMoney:
                return "Kiraboltak."
            case .HighEnergy:
                return "T??lp??r??gt??l."
            case .HighAlcohol:
                return "Elhunyt??l alkohol m??rgez??sben."
            case .HighStudy:
                return "Elf??radt??l a sok tanul??st??l."
            case .Victory:
                return "Sikeresen t??l??lted az egyetemet."
            case .OutOfSemesters:
                return "Kifutott??l az ??llami t??mogatott f??l??veidb??l."
        }
    }
    
    private func SwitchView(page : Page) -> Void {
        self.currentView = page
    }
}
