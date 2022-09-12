//
//  MainList.swift
//  UsersListTests
//
//  Created by Clarence Montenegro Gallegos on 11/9/22.
//

import Foundation

@testable import UsersList

final class MockMainList {
    
    func mockUsers() -> [UserInfoElement] {
        let user = UserInfoElement(id: 1, name: "John Simons", phone: "89898271", email: "john@gmail.com")

        return [user]
    }
}
