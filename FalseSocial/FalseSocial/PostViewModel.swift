//
//  PostViewModel.swift
//  FalseSocial
//
//  Created by H on 6/21/22.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts = [Post.testPost]
    func makeCreateAction() -> NewPostForm.CreateAction { return { [weak self] post in self?.posts.insert(post, at: 0)} }
}