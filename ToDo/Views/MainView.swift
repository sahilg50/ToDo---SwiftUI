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
                accountView            
        }
        else {
            LoginView()
        }
    }
     
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
    
}

#Preview {
    MainView().preferredColorScheme(.dark)
}
