//
//  ViewController.swift
//  LoginApp
//
//  Created by Iliya Mayasov on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
        userNameTF.tag = 0
        passwordTF.tag = 1
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        userNameTF.enablesReturnKeyAutomatically = true
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeValue = userNameTF.text
    }
    
    @IBAction func logInButton() {
        if userNameTF.text == "User" && passwordTF.text == "Password" {
            performSegue(withIdentifier: "SegueID1", sender: nil)
        }
        showAlert(title: "Invalid login or password",
                  message: "Please, enter correct login and password!")
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Oops!", message: "Your name is User 😤")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Oops!", message: "Your password is Password 😤")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(
            textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            logInButton()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
}

