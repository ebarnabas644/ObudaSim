//
//  CardModel.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 10..
//

import Foundation
import SwiftUI

class CardViewModel : ObservableObject{
    @Published var currentCard : Card!
    @Published var cardList : [Card]!
    @Published var currentDeck : [Card] = []
    @Published var rotation : Double = 0
    @Published var reply : String! = ""
    @Published var tutorialVisibility : Bool! = true
    @Published var replyVisibility : Bool! = false
    @Published var fetchError : Bool = false
    @Published var outOfCards : Bool = false
    @Published var currentSemester : Int = 1
    private var tempDeck : [Card] = []
    
    init() {
        self.FetchData()
        //For preview
        self.ResetDeck()
        self.ShuffleDeck(numberOfCards: 3)
        self.LoadNext()
    }
    
    func LoadNext() -> Void {
        if self.currentDeck.count > 0 {
            self.currentCard = currentDeck.removeFirst()
        }
        else {
            self.outOfCards = true
        }
    }
    
    func ShuffleDeck(numberOfCards : Int) -> Void {
        var counter : Int = numberOfCards
        while counter > 0 && tempDeck.count > 0 {
            let randomCard : Int = Int.random(in: 0..<tempDeck.count)
            if tempDeck[randomCard].repeatable {
                self.currentDeck.append(tempDeck[randomCard])
            }
            else {
                self.currentDeck.append(tempDeck.remove(at: randomCard))
            }
            counter -= 1
            self.outOfCards = false
        }
    }
    
    func ResetDeck() -> Void {
        self.currentDeck.removeAll()
        self.tempDeck.removeAll()
        self.tempDeck = cardList
    }
    
    func ToggleTutorial() -> Void {
        self.tutorialVisibility.toggle()
        
    }
    
    func IncreaseCompletedSemesters() -> Void {
        self.currentSemester += 1
    }
    
    private func FetchData() -> Void {
        if let data = self.ReadLocalFile(forName: "cards"){
            let parsedCards = self.ParseDataToCards(jsonData: data)
            self.cardList = parsedCards.cards
        }
        else{
            self.fetchError = true
        }
        
    }
    private func ReadLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            self.fetchError = true
        }
        
        return nil
    }
    
    private func ParseDataToCards(jsonData: Data) -> Cards {
        var decodedData : Cards = Cards(cards: [])
        do {
            decodedData = try JSONDecoder().decode(Cards.self,from: jsonData)
        } catch {
            self.fetchError = true
        }
        return decodedData
    }
    
    
}
