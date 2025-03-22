//
//  LoginViewModel.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    init() {}
}

