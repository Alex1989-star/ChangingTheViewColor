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
    
    @IBOutlet weak var opacitySlider: UISlider!
    
    //var delegate: ViewControllerDelegate!
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
        
    }
    
    private func changeColors() {
        meinView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(opacitySlider.value))
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
    
    @IBAction func opacitySliderChangedColor() {
        changeColors()
    }
}

