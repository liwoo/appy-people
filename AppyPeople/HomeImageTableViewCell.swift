//
//  HomeImageTableViewCell.swift
//  AppyPeople
//
//  Created by Jeremiah Chienda on 2017/01/05.
//  Copyright © 2017 Jeremiah Chienda. All rights reserved.
//

import UIKit

class HomeImageTableViewCell: UITableViewCell {

   
    @IBOutlet weak var postCaptionLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postLikesLabel: UILabel!
    @IBOutlet weak var homeLoader: UIActivityIndicatorView!
    
    var person: Post? {
        didSet {
            if let person = person {
                postCaptionLabel?.text = person.caption
                postDateLabel?.text = person.createdOn
                Helpers.loadImageFromURL(from: person.imageURL!, on: postImageView, loader: homeLoader)
                postLikesLabel?.text = String(person.likes)
            }
        }
    }
    
    
}
