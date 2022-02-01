//
//  BookModel].swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import Foundation

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    @Published var genres: [String] = ["Fantasy", "Mystery", "Romance"]
    @Published var statuses: [String] = ["Plan to read", "Currently reading", "Completed"]
    
    init() {
        getGenres()
    }
    
    func getGenres() {
        for book in books {
            if genres.contains(book.genre) {
                continue
            } else {
                genres.append(book.genre)
            }
        }
    }
 
}
