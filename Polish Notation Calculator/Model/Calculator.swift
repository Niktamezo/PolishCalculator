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
    
    enum CalculatingError: Error {
        case WrongInput
    }
    
    func calculate(isReversed: Bool) throws -> Int {
        var input = [String]()
        input = isReversed ? separatedInput : separatedInput.reversed()
        for symbol in input {
            switch symbol {
            case "+", "-", "*", "/" : symbolsStack.push(symbol)
                switch symbolsStack.pop()! {
                case "+" : numbersStack.push(numbersStack.pop()! + numbersStack.pop()!)
                case "-" : numbersStack.push(numbersStack.pop()! - numbersStack.pop()!)
                case "*" : numbersStack.push(numbersStack.pop()! * numbersStack.pop()!)
                case "/" : numbersStack.push(numbersStack.pop()! / numbersStack.pop()!)
                default : throw CalculatingError.WrongInput
                }
            case "0"..."9" : numbersStack.push(Int(symbol)!)
            default : throw CalculatingError.WrongInput
                }
        }
        return numbersStack.pop() ?? 0
    }
    init(input: [String]) {
        separatedInput = input
        
    }
    
}
