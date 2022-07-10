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
        
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
    }
    
    @objc func calculate() {
        guard inputTextField.text?.isEmpty != true else { inputTextField.placeholder = "Enter example here!"; return }
        
        let input = Separator(text: inputTextField.text!).separate()
        let answer = Calculator(input: input).calculate()
        
        answerTextField.text = String(answer)
        
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
        let bottomConstraint = calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        let horizontalConstraint = calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let rightConstraint = calculateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100)
        
        view.addConstraints([leftConstraint, bottomConstraint, horizontalConstraint, rightConstraint])
    }

}



extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return false
    }
    
}
