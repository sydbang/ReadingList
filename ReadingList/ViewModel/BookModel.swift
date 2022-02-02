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
        
        
        dbBooks.getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                print("it's erroring")
            } else if let querySnapshot = querySnapshot {
                // Get all documents and create instances of the books
                
                for doc in querySnapshot.documents {
                    print(doc.documentID)
                }
                
                
                //Update the list property in the main thread since it causes UI change
                DispatchQueue.main.async {
                    print("async start");
                    self.books = querySnapshot.documents.map { doc in
                        // map function iterates through the document array and performs the code on each of the items and return the result in collection
                        print(doc["title"]);
                        
                        
                        return Book(id: doc.documentID,
                                    title: doc["title"] as? String ?? "",
                                    author: doc["author"] as? String ?? "",
                                    pageNumber: doc["pageNum"] as? Int ?? 0,
                                    rating: doc["rating"] as? Int ?? 0,
                                    status: doc["status"] as? String ?? "",
                                    genre: doc["genre"] as? String ?? "")
                    }

                    for book in self.books {
                        if self.genres.contains(book.genre) {
                            print(book.genre)
                            continue
                        } else {
                            self.genres.append(book.genre)
                            print(book.genre)
                        }
                    }
                }
            } else {
                // There is no data
                print("data didn't come through")
            }
        }

        
    }
    
    func addGenre(newGenre: String) {
    
    }
 
}
