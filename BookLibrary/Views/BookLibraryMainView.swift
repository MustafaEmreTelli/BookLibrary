//
//  ContentView.swift
//  BookLibrary
//
//  Created by Emre Telli on 4.12.2023.
//

import SwiftUI

struct BookLibraryMainView: View {
    @StateObject var viewModel = BookLibraryMainViewModel()
    @State var isDetailViewOpen = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(" Author", systemImage: "person"){
                        viewModel.changeToAuthor()
                        viewModel.getBookData()
                    }
                    .foregroundColor(viewModel.searchFilter == "+inauthor:" ? .green : .gray)
                    
                    Button("Title", systemImage: "text.quote"){
                        viewModel.changeToTitle()
                    }
                    .foregroundColor(viewModel.searchFilter == "+intitle:" ? .green : .gray)
                    
                    
                    Button("Category", systemImage: "fish.fill"){
                        viewModel.changeToCategory()
                    }
                    .foregroundColor(viewModel.searchFilter == "+incategory:" ? .green : .gray)
                }
                .buttonStyle(.bordered)
                
                ScrollView{
                    LazyVGrid(columns: viewModel.columns){
                        ForEach(viewModel.books){ Books in
                            BookLibraryMainBookCell(Books: Books)
                                .onTapGesture {
                                    print("\(Books.volumeInfo.title)")
                                    isDetailViewOpen = true
                                    viewModel.selectedBook = Books
                                }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Book Library 📖")
                    
                }
                .onAppear{
                    viewModel.getBookData()
                }
                
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search Books")
        .onChange(of: viewModel.searchText) {
            viewModel.getBookData()
        }
        
        .sheet(isPresented: $isDetailViewOpen, content: {
            BookLibraryMainDetailView(Books: viewModel.selectedBook)
        })
    }
}

#Preview {
    BookLibraryMainView()
}
