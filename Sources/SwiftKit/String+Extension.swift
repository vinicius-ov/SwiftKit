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

import Foundation

extension String {
    /**
     String that's not empty will be true
     */
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    /**
     Return nil if string is empty
     */
    public var nonEmpty: String? {
        guard count > 0 else {
            return nil
        }
        
        return self
    }
    
    /**
     Add identation in front of string
     
     Example
     ```
     let name = "Wendy Liga"
     let nameWithIdentation = "Wendy Liga".withPrefixIdentation()
     
     print(nameWithIdentation) -> "    Wendy Liga"
     ```
     - Parameters:
     - count: number of identation
     
     - Returns: String with prefix Identation
     */
    public func withPrefixIdentation(count: Int = 1) -> String {
        guard count > 0 else {
            return self
        }
        
        let defaultIdentation = "    "
        
        return (0..<count)
            .map { [defaultIdentation] _ in defaultIdentation}
            .joined() + self
    }
    
    /**
     Separate two text with spesific offset
     
     This function will create table like string
     
     Example:
     ```
     String         an collection of characters
     Int            containing number
     Double         bigger than Int
     ```
     
     - Parameters:
     - with: right side text
     - offset: how many offset from left side
     
     - Returns: String with separation, look Example for mode detail
     */
    public func separate(with rightSide: String, offset: Int) -> String {
        let debtCount = offset - self.count
        
        guard debtCount > 0 else {
            return self + " " + rightSide
        }
        
        let fillerSpace = (0..<debtCount).map{_ in " "}.joined()
        
        return self + fillerSpace  + rightSide
    }
    
    /**
     remove prefix on string
     
     Example:
     ```
     let string = "$10.000"
     let stringWithoutPrefix = string.withoutPrefix("$") -> "10.000"
     
     or
     
     let string = "~/document"
     let stringWithoutPrefix = string.withoutPrefix(".") -> "~/document"
     ```
     
     - Parameters:
     - prefix: text you want to remove
     - replaceWith: if you want to replace with spesific string
     
     - Returns: String with remove prefix
     */
    public func withoutPrefix(_ prefix: String, replaceWith newString: String = "") -> String {
        guard hasPrefix(prefix) else {
            return self
        }
        
        let endIndex = index(startIndex, offsetBy: prefix.count)
        return replacingCharacters(in: startIndex..<endIndex, with: newString)
    }
    
    /**
     remove suffix on string
     
     Example:
     ```
     let string = "10.000."
     let stringWithoutPrefix = string.withoutPrefix(".") -> "10.000"
     
     or
     
     let string = "~/document"
     let stringWithoutPrefix = string.withoutPrefix(".") -> "~/document"
     ```
     
     - Parameters:
     - suffix: text you want to remove
     - replaceWith: if you want to replace with spesific string
     
     - Returns: String with remove suffix
     */
    public func withoutSuffix(_ suffix: String, replaceWith newString: String = "") -> String {
        guard hasSuffix(suffix) else {
            return self
        }
        
        let startIndex = index(endIndex, offsetBy: -suffix.count)
        return replacingCharacters(in: startIndex..<endIndex, with: newString)
    }
    
    /**
     remote white space inside `String`
     */
    public func removeWhiteSpace() -> String{
        return self.replacingOccurrences(of: " ", with: "")
    }
}

extension Array where Element == String {
    /**
     Get String value from array of String
     
     Example:
     ```
     let array = ["Apple", "Banana", "Orange"]
     
     array.getFormattedValue() -> Apple, Banana, Orange
     ```
     
     Returns: String value with comma separated
     */
    public func stringValue() -> String {
        var result = ""
        
        enumerated().forEach { (index,element) in
            if index == startIndex {
                result += element
                
                return
            }
            
            result += ", " + element
        }
        
        return result
    }
}
