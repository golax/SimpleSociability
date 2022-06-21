//
//  PostsList.swift
//  FalseSocial
//
//  Created by H on 6/20/22.
//

import SwiftUI

struct PostsList: View {
    private var posts = [Post.testPost]
 
    @State private var searchText = ""
    
    var body: some View {
        
            NavigationView {
                List(posts) { post in if searchText.isEmpty || post.contains(searchText) {  PostRow(post: post)  } } /// hides nothing if no text is in the searchbar, blank by default
                .searchable(text: $searchText)
                .navigationTitle("Posts")
                
            }
        }
    }

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
