//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Iliya Mayasov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemCyan.cgColor,
            UIColor.systemOrange.cgColor
        ]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        welcomeLabel.text = "Welcome, \(welcomeValue ?? "User")."
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
    }
}
