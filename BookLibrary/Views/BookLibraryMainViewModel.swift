//
//  BookLibraryMainViewModel.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import Foundation
import SwiftUI

final class BookLibraryMainViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchFilter = "+inauthor:"
    
    let columns: [GridItem] = [GridItem(), GridItem()]
    
    @Published var books: [Books] = []
    @Published var selectedBook: Books = MockBookLibrary.mockBook
    
    func getBookData() {
        NetworkManager.shared.getBookData(searchSpecifier: searchText, searchFilter: searchFilter){ result in
            DispatchQueue.main.async{
                switch result {
                case .success(let Books):
                    self.books = Books
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func changeToTitle() {
        searchFilter = "+intitle:"
    }
    
    func changeToAuthor() {
        searchFilter = "+inauthor:"
    }
    
    func changeToCategory() {
        searchFilter = "+incategory:"
    }
    
}
