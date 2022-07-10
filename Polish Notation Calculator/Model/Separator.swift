

import Foundation

class Separator {
    var userInput: String?
    
    func separate() -> [String] {
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
        return separatedInput
    }
    init(text: String) {
        userInput = text
    }
}
