//
//  ContentView.swift
//  Landmarks
//
//  Created by Sahil Gupta on 14/03/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            ToDoListView()
        }
        else {
            LoginView()
        }
    }
}

#Preview {
    MainView().preferredColorScheme(.dark)
}
