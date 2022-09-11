//
//  UserDetailInteractorOutput.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

protocol UserDetailInteractorOutput: AnyObject {
    
    func didRetrievePosts(posts: [UserPost])
    func didFailRetrievingPosts(title: String, message: String)
}
