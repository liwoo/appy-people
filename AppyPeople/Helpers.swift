//
//  Helpers.swift
//  AppyPeople
//
//  Created by Jeremiah Chienda on 2017/01/07.
//  Copyright © 2017 Jeremiah Chienda. All rights reserved.
//

import Foundation
import UIKit

class Helpers {
    public static func simpleAlert(show message: String?, from view: UIViewController?) {
        let alertController = UIAlertController(title: "Error",
                                                message: message ?? "Sorry, something went wrong",
                                                preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("User Pressed OK")
        }
        
        alertController.addAction(okAction)
        
        view?.present(alertController, animated: true, completion: nil)
    }
    
    public static func loadImageFromURL(from url: String, on view: UIImageView, loader: UIActivityIndicatorView? = nil ) {
        DispatchQueue.global(qos: .userInitiated).async {
            let image = NSData(contentsOf: NSURL(string: url) as! URL)
            
            DispatchQueue.main.async {
                view.image = UIImage(data: image as! Data)
                if loader != nil {
                    loader?.isHidden = true
                }
            }
        }
    }

}
