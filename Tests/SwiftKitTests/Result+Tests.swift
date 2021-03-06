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

internal final class ResultTests: XCTestCase {
    internal static var allTests = [
        ("test_nonSuccessResult_onSuccessResult", test_nonSuccessResult_onSuccessResult),
        ("test_nonSuccessResult_onFailureResult", test_nonSuccessResult_onFailureResult),
        ("test_nonFailureResult_onSuccessResult", test_nonFailureResult_onSuccessResult),
        ("test_nonFailureResult_onFailureResult", test_nonFailureResult_onFailureResult),
        ("test_value_onSuccessResult", test_value_onSuccessResult),
    ]
    
    internal func dummySuccessResult() -> Result<Int, GeneralError> {
        return .success(0)
    }
    
    internal func dummyFailureResult() -> Result<Int, GeneralError> {
        return .failure(GeneralError.unidentifiedError)
    }
    
    internal func test_nonSuccessResult_onSuccessResult() {
        XCTAssertEqual(dummySuccessResult().nonSuccessResult, nil)
    }
    
    internal func test_nonSuccessResult_onFailureResult() {
        XCTAssertEqual(dummyFailureResult().nonSuccessResult, dummyFailureResult())
    }
    
    internal func test_nonFailureResult_onSuccessResult() {
        XCTAssertEqual(dummySuccessResult().nonFailureResult, dummySuccessResult())
    }
    
    internal func test_nonFailureResult_onFailureResult() {
        XCTAssertEqual(dummyFailureResult().nonFailureResult, nil)
    }
    
    internal func test_value_onSuccessResult() {
        XCTAssertEqual(dummySuccessResult().value, 0)
    }
}
