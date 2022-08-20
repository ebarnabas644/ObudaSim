//
//  StatusViewModel.swift
//  ObudaSim
//
//  Created by user193157 on 2022. 02. 12..
//

import Foundation
import SwiftUI
import Darwin

class StatusViewModel : ObservableObject{
    @Published var status : Status
    @Published var moneyStatus : ChangeMode = .Neutral
    @Published var energyStatus : ChangeMode = .Neutral
    @Published var alcoholStatus : ChangeMode = .Neutral
    @Published var studyStatus : ChangeMode = .Neutral
    
    init(){
        self.status = Status()
    }
    
    func ModifyStatus(statusImpact : StatusEffect) -> Void {
        self.status.state.money = Util.Clamp(value: self.status.state.money + statusImpact.money, range: 0..<101)
        self.status.state.energy = Util.Clamp(value: self.status.state.energy + statusImpact.energy, range: 0..<101)
        self.status.state.alcohol = Util.Clamp(value: self.status.state.alcohol + statusImpact.alcohol, range: 0..<101)
        self.status.state.study = Util.Clamp(value: self.status.state.study + statusImpact.study, range: 0..<101)
        
    }
    
    func PreviewStatus(statusImpact : StatusEffect) -> Void {
        moneyStatus = statusImpact.money == 0 ? .Neutral : (statusImpact.money > 0 ? .Increase : .Decrease)
        energyStatus = statusImpact.energy == 0 ? .Neutral : (statusImpact.energy > 0 ? .Increase : .Decrease)
        alcoholStatus = statusImpact.alcohol == 0 ? .Neutral : (statusImpact.alcohol > 0 ? .Increase : .Decrease)
        studyStatus = statusImpact.study == 0 ? .Neutral : (statusImpact.study > 0 ? .Increase : .Decrease)
        
    }
    
    func ResetPreview() -> Void {
        moneyStatus = .Neutral
        energyStatus = .Neutral
        alcoholStatus = .Neutral
        studyStatus = .Neutral
    }
    
    func resetStatus() -> Void {
        self.status.state = StatusEffect(money: 50, energy: 50, alcohol: 50, study: 50)
        self.status.numberOfCompletedSemesters = 1
    }
}
