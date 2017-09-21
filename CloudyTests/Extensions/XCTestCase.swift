//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by Fomin Nickolai on 20.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    /// Load Stub Data From JSON File (Dummy Weather Data)
    ///
    /// - Parameters:
    ///   - name: File Name
    ///   - fileExtension: File Extension
    /// - Returns: Data
    func loadStubFromBundle(withName name: String, fileExtension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: fileExtension)
        return try! Data(contentsOf: url!)
    }
}
