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
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                
                NavigationView {
                    HomeView()
                        .toolbar(.hidden, for: .navigationBar)
                } // NavigationView
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                } // ZStack
                .zIndex(2.0)
                
               
                
                
                
            } // ZStack
        }
    }
}
