//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Nikita Uliyanov on 02.10.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var welcomeLabel: UILabel!
    
    // MARK: - Public Properties
    var user: User!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
}
