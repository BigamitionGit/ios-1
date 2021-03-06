//
//  ContactLogsTests.swift
//  FiveCalls
//
//  Created by Ben Scheirman on 2/5/17.
//  Copyright © 2017 5calls. All rights reserved.
//

import XCTest
@testable import FiveCalls

class ContactLogsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        ContactLogs.removeData()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadsEmptyContactLogs() {
        let logs = ContactLogs.load()
        let expected: [ContactLog] = []
        XCTAssertEqual(logs.all, expected)
    }
    
    func testSavingLog() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: "1984-01-24")!
        let log = ContactLog(issueId: "issue1", contactId: "contact1", phone: "111-222-3333", outcome: "Left Voicemail", date: date, reported: true)
        var logsToSave = ContactLogs()
        logsToSave.all = [log]
        logsToSave.save()
        
        let loadedLogs: [ContactLog] = ContactLogs.load().all
        XCTAssertEqual([log], loadedLogs)
        
        var logs = ContactLogs()
        logs.add(log: log)
        
        let newlyLoadedLogs = ContactLogs.load()
        XCTAssertEqual(newlyLoadedLogs.all, [log])
    }
    
}
