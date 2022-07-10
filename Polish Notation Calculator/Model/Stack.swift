

import Foundation

struct Stack<Element> {
    var stack = [Element]()
    
    mutating func push(_ item : Element) {
        stack.append(item)
    }
    
    mutating func pop() -> Element? {
        return stack.popLast()
    }
    func peek() -> Element? {
        return stack.last
    }
}
