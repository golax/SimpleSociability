//
//  PostsRepository.swift
//  FalseSocial
//
//  Created by H on 6/22/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct PostsRepository {
    static let postsReference = Firestore.firestore().collection("posts")
    static func create(_ post: Post) async throws {
        let document = postsReference.document(post.id.uuidString)
        try await document.setData(from: post)
    }
}



/// an async wrapper, as a way to know that the document of posts is saved to Firebase 

private extension DocumentReference {
    func setData<T: Encodable>(from value: T) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            // Method only throws if there’s an encoding error, which indicates a problem with our model.
            // We handled this with a force try, while all other errors are passed to the completion handler.
            try! setData(from: value) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                continuation.resume()
            }
        }
    }
}
