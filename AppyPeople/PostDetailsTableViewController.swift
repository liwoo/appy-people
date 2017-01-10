//
//  PostDetailsTableViewController.swift
//  AppyPeople
//
//  Created by Jeremiah Chienda on 2017/01/09.
//  Copyright © 2017 Jeremiah Chienda. All rights reserved.
//

import UIKit

class PostDetailsTableViewController: UITableViewController {

    public var appyPerson: Post? {
        didSet {
            viewDidLoad()
        }
    }
    
    @IBOutlet weak var postDetailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
    }

    override func viewDidAppear(_ animated: Bool) {
        if appyPerson != nil {
            //Helpers.loadImageFromURL(from: (appyPerson?.imageURL)!, on: self.postDetailImageView)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
}
