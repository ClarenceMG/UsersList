//
//  UserDetailPresenter.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

class UserDetailPresenter {

    weak var view: UserDetailViewInput!
    var interactor: UserDetailInteractorInput!
    var router: UserDetailRouterInput!
}


// MARK: UserDetailModuleInput methods

extension UserDetailPresenter: UserDetailModuleInput {

    func initializeModule() {
    }
}


// MARK: UserDetailViewOutput methods

extension UserDetailPresenter: UserDetailViewOutput {

    func viewIsReady() {
    }
}


// MARK: UserDetailInteractorOutput methods

extension UserDetailPresenter: UserDetailInteractorOutput {
}
