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
    
    // MARK: - Privat Properties
    private let user = User.getUser()
    
    // MARK: - Life Cycles Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {
            return
        }
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController
                guard let userInfoVC = userInfoVC as? UserInfoViewController else {
                    return
                }
                userInfoVC.user = user
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func logInPressed() {
        guard userNameTF.text == user.login, passwordTF.text == user.password else {
            showReminder(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showReminder(withTitle: "Ooops!!!", andMessage: "Your login is \(user.login) 😘")
        : showReminder(withTitle: "Ooops!!!", andMessage: "Your password is \(user.password) 😘")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - UIAlertController
extension LoginViewController {
    private func showReminder(
        withTitle title: String,
        andMessage message: String,
        textField: UITextField? = nil
    ) {
        let reminder = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        reminder.addAction(okAction)
        present(reminder, animated: true)
    }
}
        

