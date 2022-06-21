//
//  NewPostForm.swift
//  FalseSocial
//
//  Created by H on 6/20/22.
//

import SwiftUI

struct NewPostForm: View {
    
    @State private var post = Post(title: "", content: "", authorName: "")
    
    var body: some View {
        NavigationView {
            Form {
                
                Section{
                    TextField("Title", text: $post.title)
                    TextField("Author Name", text: $post.authorName)
                }
                
                Section("Content"){
                    TextEditor(text: $post.content)
                        .multilineTextAlignment(.leading)
                }
                
            }
            .onSubmit(createPost)
            .navigationTitle("New Post")
            
            Button(action: createPost){ Text("Create Post") }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .listRowBackground(Color.accentColor)
        }
    }
    private func createPost() {
        print("[PostForm] Creating post...")
    }
}



struct NewPostForm_Previews: PreviewProvider {
    static var previews: some View {
        NewPostForm()
    }
}
