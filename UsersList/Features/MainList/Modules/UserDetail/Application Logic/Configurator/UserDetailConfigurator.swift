//
//  UserDetailConfigurator.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

class UserDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? UserDetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: UserDetailViewController) {

        let router = UserDetailRouter()

        let presenter = UserDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = UserDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
