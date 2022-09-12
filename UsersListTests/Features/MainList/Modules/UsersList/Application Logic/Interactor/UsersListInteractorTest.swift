//
//  UsersListInteractorTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UsersListInteractorTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A UsersList Interactor") {
        }
    }


    // MARK: Mock Classes

    private class MockPresenter: UsersListInteractorOutput {
        
        var didRetrieveUsersCount = 0
        var didFailRetrievingUsersCount = 0
        
        func didRetrieveUsers(users: [UserInfoElement]) {
            didRetrieveUsersCount += 1
        }
        
        func didFailRetrievingUsers(title: String, message: String) {
            didFailRetrievingUsersCount += 1
        }
    }
}
