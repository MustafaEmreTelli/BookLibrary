//
//  Books.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import Foundation

struct Books: Decodable, Identifiable {
    var id: String
    var volumeInfo: volumeInfo
}

struct volumeInfo: Decodable {
    var title: String
    var authors: [String]
    var imageLinks: imageLinks
}

struct imageLinks: Decodable {
    var thumbnail: String
}

struct BookList: Decodable {
    let items: [Books]
}

struct MockBookLibrary {
    
    static let mockBook = Books(id: "1", volumeInfo: mockVolume)
    
    static let mockVolume = volumeInfo(title: "Lord of the Rings", authors: ["J.R.R Tolkien"], imageLinks: mockImageLinks)
    
    static let mockImageLinks = imageLinks(thumbnail: "https://books.google.com/books/content?id=vox-vgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")
    
    static let MockBook: [Books] = []
    
}
