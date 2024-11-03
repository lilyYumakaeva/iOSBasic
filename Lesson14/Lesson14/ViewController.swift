//
//  ViewController.swift
//  Lesson14
//
//  Created by Лилия Д. Юмакаева on 03.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFullNameDisplayed = true

    @IBOutlet private weak var lastNameLabel: UILabel!
    @IBOutlet private weak var sureNameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    @IBOutlet private weak var changeNameShowingButton: UIButton!
    @IBOutlet private weak var copyAddressButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        changeNameShowingButton.layer.cornerRadius = 4
    }

    @IBAction func didTapChangeNameShowingButton(_ sender: UIButton) {
        isFullNameDisplayed = !isFullNameDisplayed
        if (isFullNameDisplayed){
            changeNameShowingButton.setTitle("Покажи только Имя", for: UIControl.State.normal)
            lastNameLabel.isHidden = false
            sureNameLabel.isHidden = false
        } else {
            changeNameShowingButton.setTitle("Покажи ФИО", for: UIControl.State.normal)
            lastNameLabel.isHidden = true
            sureNameLabel.isHidden = true
        }
    }
    
    @IBAction func didTapCopyAddress(_ sender: UIButton) {
        UIPasteboard.general.string = addressLabel.text
    }
}

