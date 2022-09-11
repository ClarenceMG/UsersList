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
    }

    private class MockRouter: UsersListRouterInput {
    }

    private class MockView: UsersListViewInput {

        func setUpInitialState() {
        }

        func moduleInput() -> UsersListModuleInput {

            return UsersListPresenter()
	    }
    }
}
