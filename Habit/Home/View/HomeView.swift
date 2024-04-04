//
//  HomeView.swift
//  Habit
//
//  Created by Pedro Delmondes  on 27/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Home Page")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
