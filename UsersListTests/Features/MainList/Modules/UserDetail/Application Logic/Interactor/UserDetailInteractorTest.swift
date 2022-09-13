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
        
        var interactor: UserDetailInteractor!
        var presenter: MockPresenter!
        var mockAPIService: APIServiceMock!
        
        beforeEach {
            interactor = UserDetailInteractor()
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

        describe("A UserDetail Interactor") {
            it("Should retrieve posts") {

                interactor.retrievePosts(id: 1)
                
                expect(presenter.didRetrievePostsCount).to(equal(1))
                expect(presenter.posts).notTo(beNil())
            }
            
            it("Should fail retrieving posts") {

                let expectedMessage = "Hubo un problema obteniendo la lista de posts"
                mockAPIService.kindOfTest = .failure
                interactor.retrievePosts(id: 1)
                
                expect(presenter.didFailRetrievingPostsCount).to(equal(1))
                expect(presenter.title).to(equal(MainList.Common.error))
                expect(presenter.message).to(equal(expectedMessage))
            }
        }
    }


    // MARK: Mock Classes

    private class MockPresenter: UserDetailInteractorOutput {
        
        var didRetrievePostsCount = 0
        var didFailRetrievingPostsCount = 0
        
        var posts: [UserPost]?
        var title: String?
        var message: String?
        
        func didRetrievePosts(posts: [UserPost]) {
            self.posts = posts
            didRetrievePostsCount += 1
        }
        
        func didFailRetrievingPosts(title: String, message: String) {
            self.title = title
            self.message = message
            didFailRetrievingPostsCount += 1
        }
    }
}
