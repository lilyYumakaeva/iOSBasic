//
//  UserDetailsViewController.swift
//  NetworkStarting
//
//  Created by Лилия Д. Юмакаева on 24.02.2025.
//
import UIKit

class UserDetailsViewController: UIViewController {
    
    private let networkLayers = NetworkLayer()
    var user: User?
    
    @IBOutlet private weak var firstName: UILabel!
    @IBOutlet private weak var lastName: UILabel!
    @IBOutlet private weak var gender: UILabel!
    @IBOutlet private weak var email: UILabel!
    @IBOutlet private weak var phone: UILabel!
    @IBOutlet private weak var cell: UILabel!
    @IBOutlet private weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        guard let user else {return}
        firstName.text = "First name: \(user.name.first)"
        lastName.text = "Last name: \(user.name.last)"
        gender.text = "Gender: \(user.gender)"
        email.text = "Email: \(user.email)"
        phone.text = "Phone: \(user.phone)"
        cell.text = "Cell: \(user.cell)"
        
        networkLayers.getImage(urlString: user.picture.large) { result in
            DispatchQueue.main.async{
                switch result {
                case .failure(let wrong):
                    print(wrong)
                case .success(let loadedPicture):
                    self.picture.image = loadedPicture
                    self.reloadInputViews()
                }
            }
        }
    }
    
    
    @IBAction func createUserInNewCompany(_ sender: Any) {
        networkLayers.createUserInNewCompany(user: self.user!) { result in
            DispatchQueue.main.async{
                switch result {
                case .failure(let wrong):
                    print(wrong)
                case .success(let right):
                    print("New user was added to company")
                    print("User name in New company: \(right.name)")
                    print("User job in New company: \(right.job)")
                }
            }
            
        }
        print("createUserInNewCompany was called")
        dismiss(animated: true)
    }
}
