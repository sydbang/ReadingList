//
//  BookModel].swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import Foundation
import Firebase

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    @Published var genres: [String] = []
    @Published var statuses: [String] = ["Plan to read", "Currently reading", "Completed"]
    
    
    init() {
        
        getGenres()
    }
    
    func getGenres() {
        // This function should be able to fetch data from database
        
        // Get referecne to the database
        let db = Firestore.firestore()
        // Read the documents at a specific path
        let dbBooks = db.collection("Books")
        
        let query = dbBooks.getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let querySnapshot = querySnapshot {
                // Get all documents and create instances of the books
                
                self.books = querySnapshot.documents.map { doc in
                    // map function iterates through the document array and performs the code on each of the items and return the result in collection
                    
                    return Book(id: doc.documentID,
                                title: doc["title"] as? String ?? "",
                                author: doc["author"] as? String ?? "",
                                pageNumber: doc["pageNum"] as? Int ?? 0,
                                rating: doc["rating"] as? String ?? "",
                                status: doc["status"] as? String ?? "",
                                genre: doc["genre"] as? String ?? "")
                }
            }
        }
        
        for book in books {
            if genres.contains(book.genre) {
                continue
            } else {
                genres.append(book.genre)
            }
        }
    }
    
    func addGenre(newGenre: String) {
    
    }
 
}
