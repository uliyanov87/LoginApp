//
//  UserBioViewController.swift
//  LoginApp
//
//  Created by Nikita Uliyanov on 09.10.2022.
//

import UIKit

class UserBioViewController: UIViewController {
    
    @IBOutlet var bioTV: UITextView!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        title = "\(user.person.fullName) Bio"
        bioTV.backgroundColor = .clear
        bioTV.textColor = .white
        bioTV.text = user.person.bio
    }
}
