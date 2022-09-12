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
        
        var interactor: UsersListInteractor!
        var presenter: MockPresenter!
        var mockAPIService: APIServiceMock!
        
        beforeEach {
            interactor = UsersListInteractor()
            presenter = MockPresenter()
            mockAPIService = APIServiceMock()
            
            interactor.output = presenter
            interactor.apiService = mockAPIService
        }

        afterEach {
            presenter = nil
            interactor = nil
            mockAPIService = nil
        }

        describe("A UsersList Interactor") {
            

        }
    }


    // MARK: Mock Classes

    private class MockPresenter: UsersListInteractorOutput {
        
        var didRetrieveUsersCount = 0
        var didFailRetrievingUsersCount = 0
        
        var users: [UserInfoElement]?
        var title: String?
        var message: String?
        
        func didRetrieveUsers(users: [UserInfoElement]) {
            self.users = users
            didRetrieveUsersCount += 1
        }
        
        func didFailRetrievingUsers(title: String, message: String) {
            self.title = title
            self.message = message
            didFailRetrievingUsersCount += 1
        }
    }
}
