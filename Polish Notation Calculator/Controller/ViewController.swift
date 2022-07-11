//
//  ViewController.swift
//  Polish Notation Calculator
//
//  Created by Никита Падалко on 10.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel : UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "Calculator"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var inputTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your example here"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    var answerLabel : UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "Answer:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        
        return label
    }()
    
    var answerTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        textField.placeholder = "0"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.isUserInteractionEnabled = false
        
        return textField
    }()
    
    var calculateButton : UIButton = {
        var button = UIButton(type: .roundedRect)
        button.setTitle("Calculate", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var reverseLabel: UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        label.text = "Reversed Notation?"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var reverseSwitch : UISwitch = {
        var switchButton = UISwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        
        return switchButton
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        titleLabelConstraints()
        
        view.addSubview(inputTextField)
        inputConstraints()
        inputTextField.delegate = self
        
        view.addSubview(answerLabel)
        answerLabelConstraints()
        
        view.addSubview(answerTextField)
        answerTextFieldConstraints()
        answerTextField.delegate = self
        
        view.addSubview(calculateButton)
        calculateConstraints()
        
        view.addSubview(reverseLabel)
        
        view.addSubview(reverseSwitch)
        reverseSwitchConstraints()
        reverseLabelConstraints()
        
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
    }
    
    @objc func calculate() {
        guard inputTextField.text?.isEmpty != true else { inputTextField.placeholder = "Enter example here!"; return }
        
        let input = Separator(text: inputTextField.text!).separate()
        
        var resultOfCalculating : Int? = nil
        
        do {
            resultOfCalculating = try? Calculator(input: input).calculate(isReversed: reverseSwitch.isOn)
        } catch Calculator.CalculatingError.WrongInput {
            answerTextField.text = "Wrong input"
        }
        if let answer = resultOfCalculating {
        answerTextField.text = String(answer)
        }
        
    }
    
    
    func titleLabelConstraints() {
        let horizontalConstraint = titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        
        view.addConstraints([horizontalConstraint, verticalConstraint])
    }

    func answerLabelConstraints() {
        let horizontalConstraint = answerLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        let verticalConstraint = answerLabel.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 50)
        let widthConstraint  = answerLabel.widthAnchor.constraint(equalToConstant: 70)
        let heightConstraint = answerLabel.heightAnchor.constraint(equalToConstant: 25)
        
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func answerTextFieldConstraints() {
        let horizontalConstraint = answerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = answerTextField.centerYAnchor.constraint(equalTo: answerLabel.centerYAnchor, constant: 30)
        let widthConstraint = answerTextField.widthAnchor.constraint(equalToConstant: 70)
        let heightConstraint = answerTextField.heightAnchor.constraint(equalToConstant: 30)
        
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func inputConstraints() {
        let leftConstraint = inputTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = inputTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let topConstraint = inputTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50)
        
        view.addConstraints([leftConstraint, rightConstraint, topConstraint])
    }
    
    func calculateConstraints() {
        let leftConstraint = calculateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        let bottomConstraint = calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        let horizontalConstraint = calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let rightConstraint = calculateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)
        
        view.addConstraints([leftConstraint, bottomConstraint, horizontalConstraint, rightConstraint])
    }
    
    func reverseLabelConstraints(){
        let rightConstraint = reverseLabel.rightAnchor.constraint(equalTo: reverseSwitch.leftAnchor, constant: -50)
        let bottomConstraint = reverseLabel.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -20)
        
        view.addConstraints([rightConstraint, bottomConstraint])
    }
    
    func reverseSwitchConstraints() {
        let rightConstraint = reverseSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        let bottomConstraint = reverseSwitch.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -20)
        
        view.addConstraints([rightConstraint, bottomConstraint])
    }

}



extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return false
    }
    
}
