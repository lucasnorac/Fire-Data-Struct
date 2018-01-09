//
//  PostsSnap.swift
//  Fire Data Struct
//
//  Created by Lucas Caron Albarello on 19/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import Foundation
import Firebase

struct PostsSnapshot {
    let posts: [Post]
    init?(with snapshot: DataSnapshot) {
        var posts  = [Post]()
        guard let snapDict = snapshot.value as? [String : [String:Any]] else {return nil}
        for snap in snapDict{
            guard let post = Post(postId: snap.key, dict: snap.value) else {continue}
            posts.append(post)
        }
        self.posts = posts
    }
}
