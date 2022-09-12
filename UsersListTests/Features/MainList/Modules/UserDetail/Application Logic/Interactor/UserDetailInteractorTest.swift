//
//  UserDetailInteractorTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UserDetailInteractorTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A UserDetail Interactor") {
        }
    }


    // MARK: Mock Classes

    private class MockPresenter: UserDetailInteractorOutput {
        
        var didRetrievePostsCount = 0
        var didFailRetrievingPostsCount = 0
        
        func didRetrievePosts(posts: [UserPost]) {
            didRetrievePostsCount += 1
        }
        
        func didFailRetrievingPosts(title: String, message: String) {
            didFailRetrievingPostsCount += 1
        }
    }
}
