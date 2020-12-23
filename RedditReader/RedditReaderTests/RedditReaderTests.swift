//
//  RedditReaderTests.swift
//  RedditReaderTests
//
//  Created by Kenneth Wieschhoff on 12/21/20.
//

import XCTest
@testable import RedditReader

class RedditReaderTests: XCTestCase {
    
    var vc = RedditTableViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        vc.loadViewIfNeeded()
        vc.tableView.scrollToRow(at: IndexPath(row: 24, section: 0), at: .bottom, animated: false)
    }
}
