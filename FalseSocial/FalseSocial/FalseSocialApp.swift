//
//  FalseSocialApp.swift
//  FalseSocial
//
//  Created by H on 6/20/22.
//

import SwiftUI
import Firebase

@main
struct FalseSocialApp: App {
    init(){ FirebaseApp.configure() } /// imports the firebase sdk/api thingy, in order to connect to the Firebase project.
    
    var body: some Scene {
        WindowGroup {
            PostsList() /// At launch, directs the current view to PostList(), which is a function found in  PostsList.swift within the heirarchy
        }
    }
}
