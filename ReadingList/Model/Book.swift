//
//  Book.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import Foundation

class Book: Decodable, Identifiable, ObservableObject {
    
    // ID is the document ID in the Firestore database
    var id: String
    var title: String
    var author: String
    var pageNumber: Int
    var rating: String
    var status: String
    var genre: String
    
    
}
