//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sahil Gupta on 14/03/25.
//

import SwiftUI
import FirebaseCore

@main
struct ToDo: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
