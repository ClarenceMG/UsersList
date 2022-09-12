//
//  UserInfo.swift
//  UsersList
//
//  Created by Clarence Montenegro Gallegos on 11/9/22.
//

import Foundation
import RealmSwift

// MARK: - UserInfoElement
struct UserInfoElement: Codable {
    let id: Int
    let name: String
    let phone: String
    let email: String
}

typealias UserInfo = [UserInfoElement]


// MARK: Realm objects
class UserInformation: Object {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var phone: String
    @Persisted var email: String
}
