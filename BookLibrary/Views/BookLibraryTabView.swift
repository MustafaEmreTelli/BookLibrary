//
//  BookLibraryTabView.swift
//  BookLibrary
//
//  Created by Emre Telli on 8.02.2024.
//

import SwiftUI

struct BookLibraryTabView: View {
    var body: some View {
        TabView{
            BookLibraryMainView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Browse")
                }
            
            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    BookLibraryTabView()
}
