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
        
        var presenter: UserDetailPresenter!
        var view: MockView!
        var interactor: MockInteractor!
        var router: MockRouter!
        
        beforeEach {
            presenter = UserDetailPresenter()
            view = MockView()
            interactor = MockInteractor()
            router = MockRouter()
            
            presenter.user = UserInfoElement(id: 1, name: "Jose Gomez", phone: "897887", email: "jose@gmail.com")
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
        }

        afterEach {
            presenter = nil
            view = nil
            interactor = nil
            router = nil
        }

        describe("A UserDetail Presenter") {
            
            it("View is ready") {
                presenter.viewIsReady()
                
                expect(view.setUpInitialStateCount).to(equal(1))
                expect(interactor.retrievePostsCount).to(equal(1))
            }
            
            it("Should call didRetrieveUsers") {
                let post = UserPost(userID: 1, id: 2, title: "Title", body: "My post")
                presenter.didRetrievePosts(posts: [post])
                
                expect(view.updatePostsCount).to(equal(1))
            }
            
            it("Should call didFailRetrievingPosts") {
                presenter.didFailRetrievingPosts(title: "Error", message: "Error retrieving")
                
                expect(view.showErrorCount).to(equal(1))
            }
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
        var showErrorCount = 0

        func moduleInput() -> UserDetailModuleInput {

            return UserDetailPresenter()
	    }
        
        func setUpInitialState(user: UserInfoElement) {
            setUpInitialStateCount += 1
        }
        
        func updatePosts(posts: [UserPost]) {
            updatePostsCount += 1
        }
        
        func showError(title: String, message: String) {
            showErrorCount += 1
        }
    }
}
