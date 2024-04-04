//
//  HabitApp.swift
//  Habit
//
//  Created by Pedro Delmondes  on 24/03/2024.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
