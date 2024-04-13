//
//  BookLibraryMainViewModel.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import Foundation
import SwiftUI
import Combine

final class BookLibraryMainViewModel: ObservableObject {
    @Published var searchText = "" {
            didSet {
                searchTextChanged()
        }
    }
    
    @Published var searchFilter = "+inauthor:"
    
    let columns: [GridItem] = [GridItem(), GridItem()]
    
    @Published var books: [Books] = []
    @Published var selectedBook: Books = MockBookLibrary.mockBook
    
    private var cancellable: AnyCancellable?
        
        // A method to handle search text change with debounce
    func searchTextChanged() {
            // Cancel any ongoing search operation
        cancellable?.cancel()
            // Perform a search after a 0.5-second delay
        cancellable = Just(searchText)
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .sink { [weak self] newSearchText in
                self?.getBookData()
            }
    }
    
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
