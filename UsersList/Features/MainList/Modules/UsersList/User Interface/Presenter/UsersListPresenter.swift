//
//  UsersListPresenter.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

class UsersListPresenter {

    weak var view: UsersListViewInput!
    var interactor: UsersListInteractorInput!
    var router: UsersListRouterInput!
}


// MARK: UsersListModuleInput methods

extension UsersListPresenter: UsersListModuleInput {

    func initializeModule() {
    }
}


// MARK: UsersListViewOutput methods

extension UsersListPresenter: UsersListViewOutput {

    func viewIsReady() {
        view.setUpInitialState()
        interactor.retrieveUsers()
    }
    
    func routeToDetail(user: UserInfoElement) {
        router.routeToDetail(user: user)
    }
}


// MARK: UsersListInteractorOutput methods

extension UsersListPresenter: UsersListInteractorOutput {
    func didRetrieveUsers(users: [UserInfoElement]) {
        view.updateUsersList(users: users)
    }
    
    func didFailRetrievingUsers(title: String, message: String) {
        view.showError(title: title, message: message)
    }
}
