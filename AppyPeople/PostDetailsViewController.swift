//
//  PostDetailsViewController.swift
//  AppyPeople
//
//  Created by Jeremiah Chienda on 2017/01/09.
//  Copyright © 2017 Jeremiah Chienda. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    public var appyPerson: Post? {
        didSet {
            viewDidLoad()
        }
    }
    
    @IBOutlet weak var postDetailImageView: UIImageView!
    @IBOutlet weak var detailImageLoader: UIActivityIndicatorView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userTagLineLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        UIApplication.shared.statusBarStyle = .lightContent
        userTagLineLabel?.text = appyPerson?.userTagline
        userNameLabel?.text = appyPerson?.username?.uppercased()
        postCaptionLabel?.text = appyPerson?.caption
    }

    
    override func viewDidAppear(_ animated: Bool) {
        if appyPerson != nil {
            Helpers.loadImageFromURL(from: (appyPerson?.imageURL)!, on: self.postDetailImageView, loader: self.detailImageLoader)
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
            self.profileImageView.clipsToBounds = true
            self.profileImageView.layer.borderWidth = 2
            self.profileImageView.layer.borderColor = UIColor.white.cgColor
            Helpers.loadImageFromURL(from: (appyPerson?.userProfilePicture)!, on: self.profileImageView)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }

}
