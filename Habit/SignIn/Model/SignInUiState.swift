//
//  SignInUiState.swift
//  Habit
//
//  Created by Pedro Delmondes  on 27/03/2024.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
