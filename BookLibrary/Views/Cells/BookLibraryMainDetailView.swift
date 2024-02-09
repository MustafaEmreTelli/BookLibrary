//
//  BookLibraryMainDetailView.swift
//  BookLibrary
//
//  Created by Emre Telli on 8.02.2024.
//

import SwiftUI

struct BookLibraryMainDetailView: View {
    @StateObject var viewModel = ImageHelperViewModel()
    
    let Books: Books
    
    var body: some View {
        VStack {
            HStack{
                AsyncImage(url: URL(string: viewModel.makeSecureURL(Books.volumeInfo.imageLinks.thumbnail))) { image in image
                        .resizable()
                    } placeholder: {
                        Image(systemName: "book")
                    }
                    .frame(width: 180, height: 280)
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
            }
            
            Text("\(Books.volumeInfo.title)")
                .font(.title)
                .fontWeight(.regular)
                .minimumScaleFactor(0.01)
                .aspectRatio(contentMode: .fit)
            
            Text("\(Books.volumeInfo.authors.joined(separator: " "))")
                .font(.headline)
                .fontWeight(.light)
                .minimumScaleFactor(0.01)
            
            Spacer()
        }
    }
}

#Preview {
    BookLibraryMainDetailView(Books: MockBookLibrary.mockBook)
}
