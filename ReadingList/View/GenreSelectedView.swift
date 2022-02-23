//
//  GenreSelectedView.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-31.
//

import SwiftUI

struct GenreSelectedView: View {
    
    @EnvironmentObject var model: BookModel
    
    var genre: String
    
    var body: some View {

            Text(genre).font(.title2)
                .onAppear() {
                    model.getBooksByGenre(genre: genre)
                }
            
            if (model.books[genre] != nil) {
                
                let books = model.books[genre]
                
                ForEach (books!, id: \.self) { book in
                    NavigationLink (destination: BookDetailView(book: book)) {
                        VStack (alignment: .leading){
                            Text(book.title)
                                .font(.headline)
                                .padding(5)
                                .padding(.leading, 10)
                            Text(book.author)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
    }
}

struct GenreSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectedView(genre: "Fantasy")
    }
}
