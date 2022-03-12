//
//  UserViewController.swift
//  LoginApp
//
//  Created by Iliya Mayasov on 12.03.2022.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    
    var name = ""
    var surname = ""
    var hobby = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        surnameLabel.text = surname
        hobbyLabel.text = hobby
    }

}
