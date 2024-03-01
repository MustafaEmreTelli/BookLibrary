//
//  NetworkManager.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import Foundation
import SwiftUI

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getBookData(searchSpecifier: String, searchFilter: String, completed: @escaping (Result<[Books], BooksError>) -> Void) {
        
        let searchURL = "https://www.googleapis.com/books/v1/volumes?q="
        
        let bookURL = searchURL + searchFilter + searchSpecifier
        
        print(bookURL)
        
        guard let url = URL(string: bookURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(BookList.self, from: data)
                completed(.success(decodedResponse.items))
            } catch {
                print("Error decoding response:", error.localizedDescription)
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
}
