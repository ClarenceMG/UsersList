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
    
    var user: UserInfoElement!
}


// MARK: UserDetailModuleInput methods

extension UserDetailPresenter: UserDetailModuleInput {

    func initializeModule(user: UserInfoElement) {
        self.user = user
    }
}


// MARK: UserDetailViewOutput methods

extension UserDetailPresenter: UserDetailViewOutput {

    func viewIsReady() {
        view.setUpInitialState(user: user)
        interactor.retrievePosts(id: user.id)
    }
}


// MARK: UserDetailInteractorOutput methods

extension UserDetailPresenter: UserDetailInteractorOutput {
    func didRetrievePosts(posts: [UserPost]) {
        view.updatePosts(posts: posts)
    }
    
    func didFailRetrievingPosts(title: String, message: String) {
        view.showError(title: title, message: message)
    }
}
