//
//  CryptoListApp.swift
//  CryptoList
//
//  Created by Sergey Hrabrov on 18.07.2023.
//

import SwiftUI

@main
struct CryptoListApp: App {
    
    // MARK: - Properties
    
    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            } // NavigationView
            .environmentObject(vm)
        }
    }
}
