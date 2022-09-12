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
        
        var presenter: UsersListPresenter!
        var view: MockView!
        var interactor: MockInteractor!
        var router: MockRouter!
        
        beforeEach {
            presenter = UsersListPresenter()
            view = MockView()
            interactor = MockInteractor()
            router = MockRouter()
            
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

        describe("A UsersList Presenter") {
            
            it("View is ready") {
                presenter.viewIsReady()
                
                expect(view.showLoadingIndicatorCount).to(equal(1))
                expect(view.setUpInitialStateCount).to(equal(1))
                expect(interactor.retrieveUsersCount).to(equal(1))
            }
            
            it("Should route to detail") {
                let user = UserInfoElement(id: 1, name: "Test", phone: "89898", email: "test@gmail.com")
                presenter.routeToDetail(user: user)
                
                expect(router.routeToDetailCount).to(equal(1))
            }
            
            it("Should call didRetrieveUsers") {
                let user = UserInfoElement(id: 1, name: "Test", phone: "89898", email: "test@gmail.com")
                presenter.didRetrieveUsers(users: [user])
                
                expect(view.updateUsersListCount).to(equal(1))
                expect(view.hideLoadingIndicatorCount).to(equal(1))
            }
            
            it("Should call didFailRetrievingUsers") {
                presenter.didFailRetrievingUsers(title: "Error", message: "Error retrieving")
                
                expect(view.showErrorCount).to(equal(1))
                expect(view.hideLoadingIndicatorCount).to(equal(1))
            }
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
