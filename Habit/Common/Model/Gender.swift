//
//  Gender.swift
//  Habit
//
//  Created by Pedro Delmondes  on 30/03/2024.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case female = "Feminino"
    
    var id: String {
        self.rawValue
    }
}
