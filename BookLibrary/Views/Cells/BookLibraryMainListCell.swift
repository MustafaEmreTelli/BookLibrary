//
//  BookLibraryMainListCell.swift
//  BookLibrary
//
//  Created by Emre Telli on 16.04.2024.
//

import SwiftUI

struct BookLibraryMainListCell: View {
    var body: some View {
        HStack {
            BookLibraryMainBookCell(Books: MockBookLibrary.mockBook)
                .scaleEffect(0.50)
                .padding()
                .frame(maxWidth: 150)

            VStack {
                Text("Book 123123123123")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Book 123123123")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Book 123123")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Book 123")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Book ")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()

        }
        .frame(maxWidth: 350, maxHeight: 150)
        .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 4)
        )
        .cornerRadius(10.0)
    }
}

#Preview {
    BookLibraryMainListCell()
}
