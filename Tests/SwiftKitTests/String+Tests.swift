/**
 SwiftKit
 
 Copyright (c) 2020 Wendy Liga. Licensed under the MIT license, as follows:
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import XCTest

@testable import SwiftKit

internal final class StringTests: XCTestCase {
    internal static var allTests = [
        ("test_withPrefixIdentation_withValidIdentation", test_withPrefixIdentation_withValidIdentation),
        ("test_withPrefixIdentation_withNonValidIdentation", test_withPrefixIdentation_withNonValidIdentation),
        ("test_separate", test_separate),
        ("test_string_nonEmptyArray", test_string_nonEmptyArray),
        ("test_string_emptyArray", test_string_emptyArray),
        ("test_withoutPrefix_withValidString", test_withoutPrefix_withValidString),
        ("test_withoutPrefix_withEmptyString", test_withoutPrefix_withEmptyString),
        ("test_withoutSuffix_withValidString", test_withoutSuffix_withValidString),
        ("test_withoutSuffix_withEmptyString", test_withoutSuffix_withEmptyString),
    ]
    
    internal func test_withPrefixIdentation_withValidIdentation() {
        let string = "Hello World"
        
        XCTAssertEqual(string.withPrefixIdentation(count: 1), "    Hello World")
    }
    
    internal func test_withPrefixIdentation_withNonValidIdentation() {
        let string = "Hello World"
        
        XCTAssertEqual(string.withPrefixIdentation(count: -1), "Hello World")
    }
    
    internal func test_separate() {
        let string = "Hello"
        
        XCTAssertEqual(string.separate(with: "World", offset: 6), "Hello World")
    }
    
    internal func test_string_nonEmptyArray() {
        let array = ["Apple", "Banana", "Orange"]
        
        XCTAssertEqual(array.stringValue(), "Apple, Banana, Orange")
    }
    
    internal func test_string_emptyArray() {
        let array: [String] = []
        
        XCTAssertEqual(array.stringValue(), "")
    }
    
    internal func test_withoutPrefix_withValidString() {
        let string = "$10.000"
        
        XCTAssertEqual(string.withoutPrefix("$"), "10.000")
        XCTAssertEqual(string.withoutPrefix("$10"), ".000")
        XCTAssertEqual(string.withoutPrefix("#"), "$10.000")
        XCTAssertEqual(string.withoutPrefix("$", replaceWith: "Rp"), "Rp10.000")
    }
    
    internal func test_withoutPrefix_withEmptyString() {
        let string = ""
        
        XCTAssertEqual(string.withoutPrefix("$"), "")
        XCTAssertEqual(string.withoutPrefix("$10"), "")
        XCTAssertEqual(string.withoutPrefix("#"), "")
        XCTAssertEqual(string.withoutPrefix("$", replaceWith: "Rp"), "")
    }
    
    internal func test_withoutSuffix_withValidString() {
        let string = "at last..."
        
        XCTAssertEqual(string.withoutSuffix("."), "at last..")
        XCTAssertEqual(string.withoutSuffix("t..."), "at las")
        XCTAssertEqual(string.withoutSuffix("#"), "at last...")
        XCTAssertEqual(string.withoutSuffix("...", replaceWith: "___"), "at last___")
    }
    
    internal func test_withoutSuffix_withEmptyString() {
        let string = ""
        
        XCTAssertEqual(string.withoutSuffix("$"), "")
        XCTAssertEqual(string.withoutSuffix("$10"), "")
        XCTAssertEqual(string.withoutSuffix("#"), "")
        XCTAssertEqual(string.withoutSuffix("...", replaceWith: "___"), "")
    }
}
