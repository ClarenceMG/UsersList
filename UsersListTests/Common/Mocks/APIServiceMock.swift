//
//  APIServiceMock.swift
//  UsersListTests
//
//  Created by Clarence Montenegro Gallegos on 12/9/22.
//

import Foundation

@testable import UsersList

final class APIServiceMock: APIServiceProvider {
    
    var retrieveUsersCount = 0
    var retrievePostsCount = 0
    
    var mockMainList = MockMainList()
    var kindOfTest: KindOfTest = .success
    
    func retrieveUsers(completion: @escaping (UserInfo?) -> ()) {
        retrieveUsersCount += 1
        
        if kindOfTest == .success {
            completion(mockMainList.mockUsers())
        } else {
            completion(nil)
        }
    }
    
    func retrievePosts(id: Int, completion: @escaping (UserPosts?) -> ()) {
        retrievePostsCount += 1
        
        if kindOfTest == .success {
            completion(mockMainList.mockPosts())
        } else {
            completion(nil)
        }
    }
}
