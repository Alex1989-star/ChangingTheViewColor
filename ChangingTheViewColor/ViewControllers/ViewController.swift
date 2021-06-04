//
//  ViewController.swift
//  ChangingTheViewColor
//
//  Created by Леся on 21.05.2021.
//

import UIKit

class ColorSetupViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var meinView: UIView!
    
    @IBOutlet weak var numberLabelRed: UILabel!
    @IBOutlet weak var numberLabelGreen: UILabel!
    @IBOutlet weak var numberLabelBlue: UILabel!
    
    @IBOutlet weak var opacitySlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    var delegate: ColorSetupViewControllerDelegate!
    var color: UIColor!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meinView.layer.cornerRadius = 10
        
        numberLabelRed.font =
            numberLabelRed.font.withSize(17)
        redSlider.thumbTintColor = .red
        redSlider.maximumTrackTintColor = .opaqueSeparator
        
 
        numberLabelGreen.font = numberLabelGreen.font.withSize(17)
        greenSlider.thumbTintColor = .green
        greenSlider.maximumTrackTintColor = .opaqueSeparator
        
        numberLabelBlue.font = numberLabelBlue.font.withSize(17)
        blueSlider.thumbTintColor = .blue
        blueSlider.maximumTrackTintColor = .opaqueSeparator
        
        opacitySlider.thumbTintColor = .darkGray
        opacitySlider.maximumTrackTintColor = .opaqueSeparator
        opacitySlider.tintColor = .darkGray
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        setValueFromViewColor(color)
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
        //setTextFileds()
    }
    
     func changeColors() {
        meinView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(opacitySlider.value))
    }
    
    @IBAction func redSliderChangedColor() {
        setSliders()
        changeColors()
        setTextFileds()
    }
    
    @IBAction func greenSliderChangedColor() {
        setSliders()
        changeColors()
        setTextFileds()
    }
    
    @IBAction func blieSliderChangedColor() {
        setSliders()
        changeColors()
        setTextFileds()
    }
    
    @IBAction func opacitySliderChangedColor() {
        changeColors()
        setTextFileds()
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate.setupViewColor(meinView.backgroundColor ?? .cyan)
        dismiss(animated: true, completion: nil)
    }
    
    private func setSliders() {
        numberLabelRed.text = String(format: "%.2f", redSlider.value)
        numberLabelGreen.text = String(format: "%.2f", greenSlider.value)
        numberLabelBlue.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setTextFileds() {
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setValueFromViewColor(_ color: UIColor) {
        guard let components = color.cgColor.components else {return}
        print(components)
        redSlider.value = Float(components[0])
        greenSlider.value = Float(components[1])
        blueSlider.value = Float(components[2])
        opacitySlider.value = Float(components[3])
        setSliders()
        setTextFileds()
        changeColors()
    }
}
extension ColorSetupViewController {
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    @objc private func didTapDone() {
        self.view.endEditing(true)
    }
    
    func allertController() {
        let alert = UIAlertController(title: "Wrong format!",
                                      message: "Please enter a number in the range from 0 to 1",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}






