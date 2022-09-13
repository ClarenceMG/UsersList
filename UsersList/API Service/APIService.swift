//
//  APIService.swift
//  UsersList
//
//  Created by Clarence Montenegro Gallegos on 11/9/22.
//

import Foundation
import Alamofire

protocol APIServiceProvider {
    
    func retrieveUsers(completion: @escaping (UserInfo?) -> ())
    func retrievePosts(id: Int, completion: @escaping (UserPosts?) -> ())
}

final class APIService: APIServiceProvider {
    
    let baseUrl = "https://jsonplaceholder.typicode.com"
    
    func retrieveUsers(completion: @escaping (UserInfo?) -> ()) {
        
        let request = AF.request("\(baseUrl)/users")
        
        request.responseDecodable(of: UserInfo.self) { response in
            
            if response.error != nil {
                completion(nil)
                return
            }
            
            guard let users = response.value else { return }
            completion(users)
        }
    }
    
    func retrievePosts(id: Int, completion: @escaping (UserPosts?) -> ()) {
        
        let request = AF.request("\(baseUrl)/posts", parameters: ["userId": id])
        
        request.responseDecodable(of: UserPosts.self) { response in
            
            if response.error != nil {
                completion(nil)
                return
            }
            
            guard let posts = response.value else { return }
            completion(posts)
        }
    }
}
