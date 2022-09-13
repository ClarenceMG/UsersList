//
//  UsersListViewTest.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import Nimble
import Quick

@testable import UsersList

final class UsersListViewTest: QuickSpec {

    override func spec() {
        
        var viewController: UsersListViewController!
        var mockMainList: MockMainList!
        var output: MockOutput!
        
        beforeEach {
            let bundle = Bundle(for: UsersListViewController.self)
            let storyBoard = UIStoryboard(name: "Main", bundle: bundle)
            viewController = storyBoard.instantiateViewController(withIdentifier: "UsersListViewController") as? UsersListViewController
            
            output = MockOutput()
            
            viewController.output = output
            mockMainList = MockMainList()
            
            _ = viewController.view
        }

        afterEach {
            viewController = nil
            output = nil
            mockMainList = nil
        }

        describe("A UsersList View") {
            
            context("Life cycle") {
                it ("Should call viewIsReady") {
                    expect(output.viewIsReadyCount).to(equal(1))
                }
                
                it ("Should select user when user did select row") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    let users = mockMainList.mockUsers()
                    
                    let tableView = viewController.tableView

                    viewController.usersList = users
                    viewController.tableView(tableView!, didSelectRowAt: indexPath)

                    expect(output.routeToDetailCount).to(equal(1))
                }
            }
        }
    }


    // MARK: Mock Classes

    private class MockOutput: UsersListViewOutput {

        var viewIsReadyCount = 0
        var routeToDetailCount = 0

        func viewIsReady() {
            viewIsReadyCount += 1
        }
        
        func routeToDetail(user: UserInfoElement) {
            routeToDetailCount += 1
        }
    }
}
