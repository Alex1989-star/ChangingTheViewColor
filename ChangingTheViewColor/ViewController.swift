//
//  ViewController.swift
//  ChangingTheViewColor
//
//  Created by Леся on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var meinView: UIView!
    
    @IBOutlet weak var numberLabelRed: UILabel!

    @IBOutlet weak var numberLabelGreen: UILabel!

    @IBOutlet weak var numberLabelBlue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meinView.layer.cornerRadius = 10
        
        
        redSlider.maximumValue = 1
        redSlider.minimumValue = 0
        numberLabelRed.font =
            numberLabelRed.font.withSize(17)
        
        
        greenSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        numberLabelGreen.font = numberLabelGreen.font.withSize(17)
        
        blueSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        numberLabelBlue.font = numberLabelBlue.font.withSize(17)
        
        
        
    }
    
    func changeColors() {
        meinView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    

    @IBAction func redSliderChangedColor() {
        numberLabelRed.text = String(format: "%.2f", redSlider.value)
        
        changeColors()
        
        
    }
    
    @IBAction func greenSliderChangedColor() {
        numberLabelGreen.text = String(format: "%.2f", greenSlider.value)
        changeColors()
    }
    
    
    @IBAction func blieSliderChangedColor() {
        numberLabelBlue.text = String(format: "%.2f", blueSlider.value)
        changeColors()
        
        
    }
    
}

