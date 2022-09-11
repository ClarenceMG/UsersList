//
//  UserDetailConfiguratorTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UserDetailModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: UserDetailViewControllerMock!
        var configurator: UserDetailModuleConfigurator!

        beforeEach {
            viewController = UserDetailViewControllerMock()

            configurator = UserDetailModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A UserDetailModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(UserDetailPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? UserDetailPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(UserDetailViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(UserDetailRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(UserDetailInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? UserDetailPresenter
                let interactor = presenter?.interactor as? UserDetailInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(UserDetailPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class UserDetailViewControllerMock: UserDetailViewController {
    }
}
