//
//  Home.swift
//  SignIn_Apple
//
//  Created by Maxim Granchenko on 26.02.2021.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_status") var logStatus = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Logged in successfully with Apple")
                
                Button(action: {
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    
                    withAnimation(.easeInOut) {
                        logStatus = false
                    }
                }, label: {
                    Text("Log out")
                        .padding()
                        .background(Color.red)
                })
            }
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
