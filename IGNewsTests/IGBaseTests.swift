//
//  IGBaseTests.swift
//  IGNewsTests
//
//  Created by subahan on 06/11/21.
//

import XCTest
@testable import IGNews

class IGBaseTests: XCTestCase {

    override func setUp() {
        super.setUp()
        NetworkManager.shared(MockSessionManager())
    }

}
