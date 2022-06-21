//
//  PostModule.swift
//  FalseSocial
//
//  Created by H on 6/20/22.
//

import Foundation

struct Post: Identifiable {
    var title: String
    var content: String
    var authorName: String
    var timestamp = Date()
    var id = UUID() /// a unique identifier, specifically, a universally unique identification hash. It is used to make each post unique
    
    func contains(_ string: String) -> Bool { /// a "if contains" function, which is essential for the searchbar to work (see PostList.swift)
        let properties = [title, content, authorName].map { $0.lowercased() } /// gets the unique text for each post, in lowercase
        let query = string.lowercased() /// automatically make the query lowercase
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty /// returns any posts that agree with this statement. 
    }
}

extension Post { static let testPost = Post(title: "Hello, this is a test", content: "Hello, world!", authorName: "You") } /// a test post that is used as a placeholder


