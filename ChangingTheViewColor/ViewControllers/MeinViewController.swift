//
//  MeinViewController.swift
//  ChangingTheViewColor
//
//  Created by Леся on 04.06.2021.
//

import UIKit

class MeinViewController: UIViewController,  ColorSetupViewControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSetupViewController = segue.destination as? ColorSetupViewController
        colorSetupViewController?.delegate = self
        colorSetupViewController?.color = view.backgroundColor
    }
    
    func setupViewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
    
}
