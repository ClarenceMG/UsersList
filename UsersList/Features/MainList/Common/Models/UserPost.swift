//
//  UserPost.swift
//  UsersList
//
//  Created by Clarence Montenegro Gallegos on 11/9/22.
//

import Foundation

// MARK: - UserPost
struct UserPost: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias UserPosts = [UserPost]
