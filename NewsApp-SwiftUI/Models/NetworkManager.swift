//
//  NetworkManager.swift
//  NewsApp-SwiftUI
//
//  Created by Maruf Khan on 17/11/23.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var postsAvailable = false
    
    
    func fetchData(){
        if let  url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if  error != nil {
                    print(error?.localizedDescription ?? "")
                }else {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                                self.postsAvailable = true
                            }
                        } catch {
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume()
        }
    }
}
