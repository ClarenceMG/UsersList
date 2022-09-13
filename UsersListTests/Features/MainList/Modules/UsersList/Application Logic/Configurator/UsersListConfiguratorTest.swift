//
//  UsersListConfiguratorTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UsersListModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: UsersListViewControllerMock!
        var configurator: UsersListModuleConfigurator!

        beforeEach {
            viewController = UsersListViewControllerMock()

            configurator = UsersListModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A UsersListModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(UsersListPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? UsersListPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(UsersListViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(UsersListRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(UsersListInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? UsersListPresenter
                let interactor = presenter?.interactor as? UsersListInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(UsersListPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class UsersListViewControllerMock: UsersListViewController {
    }
}
