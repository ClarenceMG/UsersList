//
//  UserDetailViewTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UserDetailViewTest: QuickSpec {

    override func spec() {
        
        var viewController: UserDetailViewController!
        var output: MockOutput!
        
        beforeEach {
            viewController = UserDetailViewController()
            output = MockOutput()
            
            viewController.output = output
        }

        afterEach {
            viewController = nil
            output = nil
        }

        describe("A UserDetail View") {
            
            context("Life cycle") {
                it ("Should call viewIsReady") {
                    viewController.viewDidLoad()
                    expect(output.viewIsReadyCount).to(equal(1))
                }
            }
        }
    }


    // MARK: Mock Classes

    private class MockOutput: UserDetailViewOutput {

        var viewIsReadyCount = 0

        func viewIsReady() {
            viewIsReadyCount += 1
        }
    }
}
