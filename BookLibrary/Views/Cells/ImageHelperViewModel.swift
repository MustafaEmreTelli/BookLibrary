//
//  BookLibraryMainBookCellViewModel.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import Foundation

final class ImageHelperViewModel: ObservableObject{
    func makeSecureURL(_ urlString: String) -> String {
        guard var urlComponents = URLComponents(string: urlString) else {
            return urlString
        }

        if urlComponents.scheme == "http" {
            urlComponents.scheme = "https"
        }

        if let secureURL = urlComponents.url?.absoluteString {
            return secureURL
        } else {
            return urlString
        }
    }
}
