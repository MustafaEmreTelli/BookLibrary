//
//  BooksError.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import Foundation

enum BooksError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
