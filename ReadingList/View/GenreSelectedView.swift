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
        
        VStack {
            Text(genre).font(.title2)
            if (model.books[genre] != nil) {
                Text(genre)
            }
        /*
            if (model.books[genre] != nil) {
                let books = model.books[genre]
                // Display each book title and author to click on to navigate to more details
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: BookDetailView(book: book)) {
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
 */
        }
            
            
            
            
        
        
        
    }
}

struct GenreSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectedView(genre: "Fantasy")
    }
}
