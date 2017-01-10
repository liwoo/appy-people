//
//  Post.swift
//  AppyPeople
//
//  Created by Jeremiah Chienda on 2017/01/06.
//  Copyright © 2017 Jeremiah Chienda. All rights reserved.
//

import Foundation


struct Post {
    let id: String?
    let caption: String?
    var createdOn: String?
    let imageURL: String?
    let likes: Int
    let userProfilePicture: String?
    let username: String?
    let userTagline = "Fun loving Malawian developer.  🎧🇲🇼💻"
    
    
    init(dictionary: [String : Any]) {
        let postCaption = dictionary["caption"] as! [String : Any]
        let captionDate = Double((postCaption["created_time"] as! String?)!)
        let postDate = NSDate(timeIntervalSince1970: captionDate!)
        let postLikes = dictionary["likes"] as! [String : Any]
        let postUser = dictionary["user"] as! [String : Any]
        
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE, h a"
        
        let postImages = dictionary["images"] as! [String : Any]
        let stdResImage = postImages["standard_resolution"] as! [String : Any]
        
        
        id = "someID"
        imageURL = stdResImage["url"] as! String?
        createdOn = dayTimePeriodFormatter.string(from: postDate as Date)
        caption = postCaption["text"] as! String?
        likes = postLikes["count"] as! Int
        userProfilePicture = postUser["profile_picture"] as! String?
        username = postUser["username"] as! String?
        
     }
    
    init() {
        id = "someID"
        caption = "someCaption"
        createdOn = "someDate"
        imageURL = "someURL"
        likes = 0
        userProfilePicture = "someProfilePicture"
        username = "someUserName"
    }
}



