//
//  BookLibraryReadingListView.swift
//  BookLibrary
//
//  Created by Emre Telli on 16.04.2024.
//

import SwiftUI

struct BookLibraryReadingListView: View {
    var body: some View {
        NavigationStack{
            VStack{
                BookLibraryMainListCell()
                BookLibraryMainListCell()
                BookLibraryMainListCell()
                BookLibraryMainListCell()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Reading Lists 📖")
        }
    }
}

#Preview {
    BookLibraryReadingListView()
}
