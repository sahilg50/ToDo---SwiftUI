//
//  MainViewModel.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {
                [weak self] _, user in DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                }
        }
    }
    
    public var isSignedIn: Bool {
        print(self.currentUserId)
        return Auth.auth().currentUser != nil
    }
}
