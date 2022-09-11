//
//  UserDetailPresenterTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UserDetailPresenterTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A UserDetail Presenter") {
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: UserDetailInteractorInput {
    }

    private class MockRouter: UserDetailRouterInput {
    }

    private class MockView: UserDetailViewInput {

        func setUpInitialState() {
        }

        func moduleInput() -> UserDetailModuleInput {

            return UserDetailPresenter()
	    }
    }
}
