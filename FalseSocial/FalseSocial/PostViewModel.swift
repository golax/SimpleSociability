//
//  PostViewModel.swift
//  FalseSocial
//
//  Created by H on 6/21/22.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts = [Post]() /// only uploaded posts
    
    func makeCreateAction() -> NewPostForm.CreateAction { return { [weak self] post in
        try await PostsRepository.create(post)
        self?.posts.insert(post, at: 0)
        }
    } /// adds the post to Firebase
    func fetchPosts() { /// attempt to fetch posts at startup (PostsRepository.swift)
        Task {
            do { posts = try await PostsRepository.fetchPosts() }
            catch { print("Can't fetch posts: \(error)") }
        }
    }
}
