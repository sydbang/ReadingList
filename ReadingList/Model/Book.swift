//
//  Book.swift
//  ReadingList
//
//  Created by Sunghee Bang on 2022-01-28.
//

import Foundation

struct Book: Identifiable{
    
    // ID is the document ID in the Firestore database
    var id: String
    var title: String
    var author: String
    var pageNumber: Int
    var rating: Int
    var status: String
    var genre: String
    
    
}
