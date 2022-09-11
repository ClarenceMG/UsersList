//
//  APIService.swift
//  UsersList
//
//  Created by Clarence Montenegro Gallegos on 11/9/22.
//

import Foundation
import Alamofire

class APIService: NSObject {
    
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
}
