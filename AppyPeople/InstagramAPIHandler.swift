//
//  InstagramAPIHandler.swift
//  AppyPeople
//
//  Created by Jeremiah Chienda on 2017/01/07.
//  Copyright © 2017 Jeremiah Chienda. All rights reserved.
//

import Foundation

class InstagramAPIHandler {
    
    private struct Errors {
        static let URL_ERROR = "Could not Process URL, something wrong with the API Settings?"
        static let NET_ERROR = "Could not fetch Data.  Network Setting Perhaps?"
        static let RES_ERROR = "Could not fetch Response"
        static let JSN_ERROR = "Could not fetch JSON Object"
        static let SER_ERROR = "Something happened while tying to serialize JSON Object"
    }
    
    private struct Config {
        static let token = "331244240.cdaab77.88fc7cfb425c4f0493ca3ef3f0f59bb7"
        static let recent = "https://api.instagram.com/v1/users/self/media/recent/?"
    }
    
    let requestTypes = [
        "recent": Config.recent
    ]

    public func fetch(request: String, with callback: @escaping (([String : Any]?, String?)->Void)) {
        
        guard let url = URL(string: "\(requestTypes[request]!)access_token=\(Config.token)") else {
            callback(nil,Errors.URL_ERROR)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                callback(nil,Errors.NET_ERROR)
                return
            }
            
            guard let responseData = data else {
                callback(nil,Errors.RES_ERROR)
                return
            }
            
            do {
                guard let response = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                    callback(nil,Errors.JSN_ERROR)
                    return
                }
                
                callback(response,nil)
                
                
            } catch {
                callback(nil,Errors.SER_ERROR)
                return
            }
        }
        
        task.resume()
    }
}
