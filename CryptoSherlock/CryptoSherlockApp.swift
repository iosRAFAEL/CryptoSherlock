//
//  CryptoSherlockApp.swift
//  CryptoSherlock
//
//  Created by RAFAEL on 29.06.2023.
//

import SwiftUI

@main
struct CryptoSherlockApp: App {
    
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
