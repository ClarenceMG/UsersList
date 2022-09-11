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
        beforeEach {
        }

        afterEach {
        }

        describe("A UserDetail View") {
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
