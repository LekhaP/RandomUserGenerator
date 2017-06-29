//
//  RandomUser.swift
//  RandomUsers
//
//  Created by Preeti Lekha on 6/26/17.
//  Copyright © 2017 randomuser. All rights reserved.
//

import Foundation
import UIKit

//{
//    "name": {
//        "title": "mr",
//        "first": "romain",
//        "last": "hoogmoed"
//    },
//    "email": "romain.hoogmoed@example.com",
//    "phone": "(656)-976-4980",
//    "cell": "(065)-247-9303",
//    "picture": {
//        "large": "https://randomuser.me/api/portraits/men/83.jpg",
//        "medium": "https://randomuser.me/api/portraits/med/men/83.jpg",
//        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/83.jpg"
//    }
//}

class UserName {
    var title: String?
    var first: String?
    var last: String?

    init() {
        self.title = ""
        self.first = ""
        self.last = ""
    }
    
    init(title: String) {
        self.title = title
    }

    init(first: String) {
        self.first = first
    }
    
    init(last: String) {
        self.last = last
    }
    
    func fullName() -> String {
        return (title?.capitalized)! + " " + (first?.capitalized)! + " " + (last?.capitalized)!
    }
}


class RandomUser {
    
    var userName : UserName = UserName()
    var userEmail : String = ""
    var userPhone : String = ""
    var userCell : String = ""
    var userThumbnailImageUrlString : String = ""
    var userFullImageUrlSting : String = ""

    
    init(user:NSDictionary) {
        
        //user email
        if let email = user["email"]
        {
            self.userEmail = email as! String
        }
        
        //user phone number
        if let phone = user["phone"]
        {
            self.userPhone = phone as! String
        }
        
        //user email
        if let cell = user["cell"]
        {
            self.userCell = cell as! String
        }
        
        if let userNameDetails = user["name"] as? [String: String] {
            let fullName : UserName = UserName()
            
            if let title = userNameDetails["title"]
            {
                fullName.title = title
            }
            
            if let first = userNameDetails["first"]
            {
                fullName.first = first
            }
            
            if let last = userNameDetails["last"]
            {
                fullName.last = last
            }
            
            self.userName = fullName
        }
        
        
        if let userPicUrls = user["picture"] as? [String: String] {
            
            if let thumbnail = userPicUrls["thumbnail"]
            {
                self.userThumbnailImageUrlString = thumbnail
            }
            if let fullImage = userPicUrls["medium"]
            {
                self.userFullImageUrlSting = fullImage
            }
        }
    }
}
