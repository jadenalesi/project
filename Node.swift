//
//  Node.swift
//  FE_Rebuild
//
//  Created by Jaden Alesi on 4/1/24.
//

import Foundation

public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    public var exercise: Exercise?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
