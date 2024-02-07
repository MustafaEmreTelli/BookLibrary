//
//  BookLibraryMainBookCell.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import SwiftUI

struct BookLibraryMainBookCell: View {
    @StateObject var viewModel = ImageHelperViewModel()
    
    let Books: Books
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.makeSecureURL(Books.volumeInfo.imageLinks.thumbnail)))
                .frame(width: 150, height: 200)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("\(Books.volumeInfo.title)")
                .fontWeight(.medium)
                .aspectRatio(contentMode: .fit)
                .minimumScaleFactor(0.7)
            
            Text(Books.volumeInfo.authors.joined(separator: ","))
                .font(.caption)
                .aspectRatio(contentMode: .fit)
                .minimumScaleFactor(0.7)
        }
        .padding()
    }
}

#Preview {
    BookLibraryMainBookCell(Books: MockBookLibrary.mockBook)
}

