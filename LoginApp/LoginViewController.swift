//
//  ViewController.swift
//  LoginApp
//
//  Created by Nikita Uliyanov on 01.10.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Life Cycles Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userNameTF.text == "User", passwordTF.text == "123" {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = userNameTF.text
        } else {
            showReminder(withTitle: "Ooops", andMessage: "Wrong user name or password")
        }
    }
    
    // MARK: - IB Actions
    @IBAction func forgotNameButtonDidTapped() {
        showReminder(withTitle: "Ooops!!!", andMessage: "Your name is User😘")
    }
    @IBAction func forgotPasswordButtonDidTapped() {
        showReminder(withTitle: "Ooops!!!", andMessage: "Your password is 123😘")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Extensions
extension LoginViewController {
    private func showReminder(withTitle title: String, andMessage message: String) {
        let reminder = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        reminder.addAction(okAction)
        present(reminder, animated: true)
    }
}

