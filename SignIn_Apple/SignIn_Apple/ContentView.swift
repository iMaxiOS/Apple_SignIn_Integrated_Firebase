//
//  ContentView.swift
//  SignIn_Apple
//
//  Created by Maxim Granchenko on 26.02.2021.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var logStatus = false
    
    var body: some View {
        if logStatus {
            Home()
        } else {
            Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
