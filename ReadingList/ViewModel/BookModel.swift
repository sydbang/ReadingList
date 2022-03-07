//
//  BookModel].swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import Foundation
import Firebase

class BookModel: ObservableObject {
    
    @Published var books: [String: [Book]] = [:] // [Genre: [Book]]
    @Published var genres: [String] = []
    @Published var statuses: [String] = ["Plan to read", "Currently reading", "Completed"]
    
    init() {
        getGenres()
    }
    
    func getGenres() {
        
        // Get referecne to the database
        let db = Firestore.firestore()
        // Read the documents at a specific path
        let dbGenres = db.collection("Genres")
        
        dbGenres.getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                print("it's erroring")
            } else if let querySnapshot = querySnapshot {
                
                for doc in querySnapshot.documents {
                    self.addGenre(newGenre: doc.documentID)
                }
                
            } else {
                // There is no data
                print("data didn't come through")
            }
        }
        
        
    }
    
    func addGenre(newGenre: String) {
        if self.genres.contains(newGenre) {
            return
        } else {
            let db = Firestore.firestore()
            let dbGenres = db.collection("Genres")
            
            dbGenres.document(newGenre).setData([:])
            self.genres.append(newGenre)
        }
    }
    
    func addBook(title: String, author: String, pageNum: String, rating: Int, status: Int, genre: Int) {
        let db = Firestore.firestore()
        let dbBooks = db.collection("Books")
        
        let intPageNum = Int(pageNum)
        let statusString = self.statuses[status]
        let genreString = self.genres[genre]
        
        dbBooks.document().setData(["title": title, "author": author, "pageNum": intPageNum ?? 0, "rating": rating, "status": statusString, "genre": genreString])
        
        // refetch data
        getGenres()
    }
    
    func getBooksByGenre(genre: String) {
        
        let db = Firestore.firestore()
        let dbBooks = db.collection("Books")
        
        let query = dbBooks.whereField("genre", in: [genre])
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let querySnapshot = querySnapshot {
                DispatchQueue.main.async {
                    self.books[genre] = querySnapshot.documents.map { doc in
                        // map function iterates through the document array and performs the code on each of the items and return the result in collection
                        
                        return Book(id: doc.documentID,
                                    title: doc["title"] as? String ?? "",
                                    author: doc["author"] as? String ?? "",
                                    pageNumber: doc["pageNum"] as? Int ?? 0,
                                    rating: doc["rating"] as? Int ?? 0,
                                    status: doc["status"] as? String ?? "",
                                    genre: doc["genre"] as? String ?? "")
                    }
                }
            } else {
                //no data
            }
        }
    }
    
    func deleteBook(book: Book) {
        let db = Firestore.firestore()
        let dbBooks = db.collection("Books")
        
        dbBooks.document(book.id).delete()
    }
    
    func updateBook(book: Book) {
        let db = Firestore.firestore()
        let dbBooks = db.collection("Books")
        
        dbBooks.document(book.id).updateData(["rating": book.rating, "status": book.status, "genre": book.genre])
        
        // refetch data
        getGenres()
    }
}
