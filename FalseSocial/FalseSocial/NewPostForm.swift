//
//  NewPostForm.swift
//  FalseSocial
//
//  Created by H on 6/20/22.
//

import SwiftUI

struct NewPostForm: View {
    
    typealias CreateAction = (Post) async throws -> Void
    let createAction: CreateAction
    
    @State private var state = FormState.idle
    @State private var post = Post(title: "", content: "", authorName: "") /// initiates title, content, and author's name as local variables, every time a new post is created (@State)
    @Environment(\.dismiss) private var dismiss /// allows the "form sheet" to disappear/reappear once the submit button is clicked
    
    enum FormState { /// adds states embedded into the "add post" button, to which all of the user configurable items are disabled as uploading commences. If an error occurs, all processes stop
        case idle, working, error
        var isError: Bool {
            get{self == .error}
            set {
                guard !newValue else { return }
                self = .idle
            }
        }
    }
    
    
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
                
                Button(action: createPost){
                    if state == .working { ProgressView() }
                    else{ Text("Create Post") }
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .listRowBackground(Color.accentColor)
            }
            .onSubmit(createPost) /// allows the post button to work
            .navigationTitle("New Post")
        }
        .disabled(state == .working)
    }
    
    private func createPost() { /// create the post, then dismiss the current view
        Task { /// a safekeep that terminates the async process if an error occurs while creating the post (usually while connecting to the Firebase database)
            state = .working
            do {
                try await createAction(post)
                dismiss()
            }
            catch {
                print("Can't create post: \(error)")
                state = .error
            }
        }
    }
}

struct NewPostForm_Previews: PreviewProvider {
    static var previews: some View {
        NewPostForm(createAction: {_ in })
    }
}
