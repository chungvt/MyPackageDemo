//
//  File.swift
//  
//
//  Created by Vuong Chung on 13/04/2022.
//

import Foundation

public struct Common {
    public init(){}
    public func sayHello() {
        print("Hello world")
    }
}
extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var classObjectName: String {
      return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
}
