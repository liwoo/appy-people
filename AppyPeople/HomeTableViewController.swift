//
//  HomeTableViewController.swift
//  AppyPeople
//
//  Created by Jeremiah Chienda on 2017/01/04.
//  Copyright © 2017 Jeremiah Chienda. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    private var data = [[Post]]()
    private var instagram = InstagramAPIHandler()
    
    @IBOutlet weak var emptyDataImageView: UIImageView!
    
    private func fetchAppyPeople() {
        
        instagram.fetch(request: "recent", with: { res, error in
            if error != nil {
                weak var selfie = self
                Helpers.simpleAlert(show: error, from: selfie)
                
                DispatchQueue.main.async {
                    self.tableView.backgroundView = self.emptyDataImageView
                    self.emptyDataImageView.isHidden = false
                }

            } else {
                for item in (res?["data"] as! [[String : Any]]) {
                    self.data.append([Post(dictionary: item)])
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAppyPeople()
    }
    

    // MARK: - AppyPeopleViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    private struct Storyboard {
        static let AppyPeopleCellID = "AppyPeopleCellID"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.AppyPeopleCellID, for: indexPath)

        let person = data[indexPath.section][indexPath.row]
    
        
        if let personcCell = cell as? HomeImageTableViewCell {
            personcCell.person = person
        }

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationNavCon = segue.destination as! UINavigationController
        let targetViewCon = destinationNavCon.topViewController
        if let postViewController = targetViewCon as? PostDetailsViewController {
            let postIndex = tableView.indexPathForSelectedRow
            postViewController.appyPerson = data[(postIndex?.section)!][(postIndex?.row)!]
        }
    }
 

}
