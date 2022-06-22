//
//  PostsList.swift
//  FalseSocial
//
//  Created by H on 6/20/22.
//

import SwiftUI

struct PostsList: View {
    
    @StateObject var viewModel = PostsViewModel()
    @State private var searchText = ""
    @State private var showNewPostForm = false
    
    var body: some View {
            NavigationView {
                List(viewModel.posts) { post in if searchText.isEmpty || post.contains(searchText) {  PostRow(post: post)  } } /// hides nothing if no text is in the searchbar, blank by default
                .searchable(text: $searchText)
                .navigationTitle("Posts")
                .toolbar { /// adds the create post button at the toolbar
                    Button{ showNewPostForm = true }
                    label: { Label("New Post", systemImage: "square.and.pencil") }
                }
            }
            .sheet(isPresented: $showNewPostForm){ NewPostForm(createAction: viewModel.makeCreateAction())
            } /// once the button is pressed, the formsheet will appear
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
