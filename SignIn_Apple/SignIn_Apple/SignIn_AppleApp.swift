//
//  SignIn_AppleApp.swift
//  SignIn_Apple
//
//  Created by Maxim Granchenko on 26.02.2021.
//

import SwiftUI
import Firebase

@main
struct SignIn_AppleApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
