//
//  SettingsView.swift
//  CryptoList
//
//  Created by Sergey Hrabrov on 20.07.2023.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    
    let gitHubURL = URL(string: "https://github.com/HrabrovSergeyM")!
    let instagramURL = URL(string: "https://instagram.com/hrabrov_s")!
    let linkedInURL = URL(string: "https://linkedin.com/in/sergey-khrabrov-rn-dev")!
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                aboutAppSection
                developerSection
            } // List
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            } // toolbar
        } // NavigationStack
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var aboutAppSection: some View {
        
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made with all the knowledge I have. It uses MVVM Architechture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            } // VStack
            .padding(.vertical)
        } header: {
            Text("About App")
        }
        
    }
    
    private var developerSection: some View {
        
        Section {
            VStack(alignment: .leading) {
                Image("photo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            } // VStack
            .padding(.vertical)
            Link("Rate my GitHub 👨‍💻", destination: gitHubURL)
            Link("Join my network on LinkedIn 🤝", destination: linkedInURL)
            Link("Follow me on Instagtam 😇", destination: instagramURL)
            
            
        } header: {
            Text("Developer")
        }
        
    }
    
    
}
