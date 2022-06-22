//
//  Post.swift
//  PhotoSharingApp
//
//  Created by Omer on 22.06.2022.
//

import Foundation

class Post{
    
    var email: String
    var comment: String
    var image: String
    
    init(email: String, comment: String, image: String){
        self.email = email
        self.comment = comment
        self.image = image
    }
}
