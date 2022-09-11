//
//  UsersListPresenterTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UsersListPresenterTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A UsersList Presenter") {
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: UsersListInteractorInput {
        
        var retrieveUsersCount = 0
        
        func retrieveUsers() {
            retrieveUsersCount += 1
        }
    }

    private class MockRouter: UsersListRouterInput {
        
        var routeToDetailCount = 0
        
        func routeToDetail(user: UserInfoElement) {
            routeToDetailCount += 1
        }
    }

    private class MockView: UsersListViewInput {

        var setUpInitialStateCount = 0
        var updateUsersListCount = 0
        var showErrorCount = 0
        var showLoadingIndicatorCount = 0
        var hideLoadingIndicatorCount = 0
        
        func setUpInitialState() {
            setUpInitialStateCount += 1
        }

        func moduleInput() -> UsersListModuleInput {

            return UsersListPresenter()
	    }
        
        func updateUsersList(users: [UserInfoElement]) {
            updateUsersListCount += 1
        }
        
        func showError(title: String, message: String) {
            showErrorCount += 1
        }
        
        func showLoadingIndicator() {
            showLoadingIndicatorCount += 1
        }
        
        func hideLoadingIndicator() {
            hideLoadingIndicatorCount += 1
        }
    }
}
