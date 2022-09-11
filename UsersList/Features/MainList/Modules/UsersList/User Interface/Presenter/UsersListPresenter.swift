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
    }
}


// MARK: UsersListInteractorOutput methods

extension UsersListPresenter: UsersListInteractorOutput {
}