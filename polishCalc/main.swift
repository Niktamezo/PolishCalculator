
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

var numbersStack = Stack<Int>()
var symbolsStack = Stack<String>()

print("Введите пример для вычисления в Польской Нотации")
var userInput = readLine()
var separatedInput = [String]()

if let input = userInput {
    var temp = ""
    for symbol in input {
        if symbol != " " {
            temp += String(symbol)
        }
        if symbol == " " {
            separatedInput.append(temp)
            temp = ""
        }
    }
    separatedInput.append(temp)
}
print(separatedInput)
func calculate(_ : String?) {
    for symbol in separatedInput.reversed() {
        // print(symbol)
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
    print("Результат вычислений : \(numbersStack.pop()!)")
}

calculate(userInput)


//
