//
//  Extension.swift
//  ChangingTheViewColor
//
//  Created by Леся on 04.06.2021.
//

import UIKit

extension ColorSetupViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 4
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.first == "." {
            textField.text = "0."
        }
        if text == "0" {
            textField.text = "0."
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            dataTransmision(from: redTextField, to: redSlider, to: numberLabelRed)
        case greenTextField:
            dataTransmision(from: greenTextField, to: greenSlider, to: numberLabelGreen)
        case blueTextField:
            dataTransmision(from: blueTextField, to: blueSlider, to: numberLabelBlue)
        default:
            return
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    //реализация кнопки Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func dataTransmision(from textField: UITextField, to slider: UISlider, to label: UILabel) {
        guard let textInput = textField.text else { return }
        guard let value = Float(textInput) else {
            allertController()
            return
        }
        if value >= 0 && value <= 1 {
            slider.value = value
            label.text = String(value)
            changeColors()
        } else {
            allertController()
        }
    }
}




