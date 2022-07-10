//
//  Calculator.swift
//  Polish Notation Calculator
//
//  Created by Никита Падалко on 10.07.2022.
//

import Foundation

class Calculator {
    var separatedInput: [String]
    var numbersStack = Stack<Int>()
    var symbolsStack = Stack<String>()
    
    func calculate() -> Int {
        for symbol in separatedInput.reversed() {
            switch symbol {
            case "+", "-", "*", "/" : symbolsStack.push(symbol)
                switch symbolsStack.pop()! {
                case "+" : numbersStack.push(numbersStack.pop()! + numbersStack.pop()!)
                case "-" : numbersStack.push(numbersStack.pop()! - numbersStack.pop()!)
                case "*" : numbersStack.push(numbersStack.pop()! * numbersStack.pop()!)
                case "/" : numbersStack.push(numbersStack.pop()! / numbersStack.pop()!)
                default : break
                }
            default : numbersStack.push(Int(symbol)!)
                }
        }
        return numbersStack.pop() ?? 0
    }
    init(input: [String]) {
        separatedInput = input
        
    }
    
}
