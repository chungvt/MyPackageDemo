//
//  File.swift
//  
//
//  Created by Vuong Chung on 14/04/2022.
//

import Foundation
class ContactHelper {
    static func appendLabel2Param(input1 : String, input2 : String) -> String {
        if !input1.isEmpty, input2.isEmpty {
            return input1
        } else if input1.isEmpty, !input2.isEmpty {
            return input2
        } else if !input1.isEmpty, !input2.isEmpty {
            return "\(input1) - \(input2)"
        } else {
            return ""
        }
    }
    
    static func getLastCharacter(input : String) -> String {
        let splits = input.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
        if let lastItem = splits.last, let char = lastItem.first {
            let result = String(char)
            return result.uppercased()
        }
        return ""
    }
    
    /// get name from space last
    static func secondWord(value: String) -> String {
        // Find index of space.
        if let space = value.lastIndex(of: " ") {
            return String(value[value.index(after: space)..<value.endIndex])
        }
        return ""
    }
}
