//
//  SignUpUIStaate.swift
//  Habit
//
//  Created by Pedro Delmondes  on 31/03/2024.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
