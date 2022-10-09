//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Nikita Uliyanov on 09.10.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet var photoImage: UIImageView! {
        didSet {
            photoImage.layer.cornerRadius = photoImage.frame.height / 2
        }
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        photoImage.image = UIImage(named: user.person.photo)
        title = user.person.fullName
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        jobLabel.text = user.person.workingPosition
        departmentLabel.text = user.person.department
        companyLabel.text = user.person.company
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? UserBioViewController else {return}
        bioVC.user = user
    }
}
