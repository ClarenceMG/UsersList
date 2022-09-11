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
        
        var retrievePostsCount = 0
        
        func retrievePosts(id: Int) {
            retrievePostsCount += 1
        }
    }

    private class MockRouter: UserDetailRouterInput {
    }

    private class MockView: UserDetailViewInput {
        
        var setUpInitialStateCount = 0
        var updatePostsCount = 0

        func moduleInput() -> UserDetailModuleInput {

            return UserDetailPresenter()
	    }
        
        func setUpInitialState(user: UserInfoElement) {
            setUpInitialStateCount += 1
        }
        
        func updatePosts(posts: [UserPost]) {
            updatePostsCount += 1
        }
    }
}
