//
//  ViewController.swift
//  LoginApp
//
//  Created by Iliya Mayasov on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    private let user = User("User", "Password", "Ilya", "Myasov", "Running")
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
        guard let mainTabBarController =  segue.destination as? MainTabBarController else { return }
        mainTabBarController.name = user.person.name
        mainTabBarController.surname = user.person.surname
        mainTabBarController.hobby = user.person.hobby
        }
    
    @IBAction func logInButtonPressed() {
        guard userNameTF.text == user.userName, passwordTF.text == user.userPassword else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password!"
            )
            passwordTF.text = ""
            return
        }
        performSegue(withIdentifier: "SegueID1", sender: nil)
    }
    
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is User 😤")
        : showAlert(title: "Oops!", message: "Your password is Password 😤")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Alert Controller
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
}

//MARK: - Keyboard
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

