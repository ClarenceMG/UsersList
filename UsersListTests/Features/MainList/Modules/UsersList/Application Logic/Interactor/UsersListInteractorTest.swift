//
//  UsersListInteractorTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import Nimble
import Quick
import RealmSwift

@testable import UsersList

final class UsersListInteractorTest: QuickSpec {

    override func spec() {
        
        var interactor: UsersListInteractor!
        var presenter: MockPresenter!
        var mockAPIService: APIServiceMock!
        var localRealm: Realm!
        
        beforeEach {
            interactor = UsersListInteractor()
            presenter = MockPresenter()
            mockAPIService = APIServiceMock()
            localRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "users"))
            
            interactor.output = presenter
            interactor.apiService = mockAPIService
            interactor.localRealm = localRealm
        }

        afterEach {
            presenter = nil
            interactor = nil
            mockAPIService = nil
            localRealm = nil
        }

        describe("A UsersList Interactor") {
            
            it("Should retrieve users from services") {

                interactor.retrieveUsers()
                
                expect(presenter.didRetrieveUsersCount).to(equal(1))
                expect(presenter.users).notTo(beNil())
                expect(localRealm.objects(UserInformation.self).count).to(beGreaterThan(0))
            }
            
            it("Should retrieve users from local storage") {

                let userInformation = UserInformation()
                userInformation.id = 1
                userInformation.name = "Carlos Diaz"
                userInformation.phone = "898989"
                userInformation.email = "carlos@gmail.com"
                
                try! localRealm.write {
                    localRealm.add(userInformation)
                }
                
                interactor.retrieveUsers()
                
                expect(presenter.didRetrieveUsersCount).to(equal(1))
                expect(presenter.users).notTo(beNil())
                expect(localRealm.objects(UserInformation.self).count).to(beGreaterThan(0))
            }
            
            it("Should fail retrieving users from services") {

                let expectedMessage = "Hubo un problema obteniendo la lista de usuarios"
                mockAPIService.kindOfTest = .failure
                interactor.retrieveUsers()

                expect(presenter.didFailRetrievingUsersCount).to(equal(1))
                expect(localRealm.objects(UserInformation.self).count).to(equal(0))
                expect(presenter.title).to(equal(MainList.Common.error))
                expect(presenter.message).to(equal(expectedMessage))
            }
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
