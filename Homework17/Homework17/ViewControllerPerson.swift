//
//  ViewControllerPerson.swift
//  Homework17
//
//  Created by Лилия Д. Юмакаева on 02.12.2024.
//

import UIKit

class ViewControllerPerson: ViewController {
    
    var person: PersonData = .init(name: "", surname: "", patronymic: "", address: "", position: "")
    private var isFullNameDisplayed = true
    
    @IBOutlet private weak var sureName: UILabel!
    @IBOutlet private weak var firstName: UILabel!
    @IBOutlet private weak var patronicName: UILabel!
    @IBOutlet private weak var changeNameShowingButton: UIButton!
    
    @IBOutlet private weak var jobTitle: UILabel!
    @IBOutlet private weak var address: UILabel!
    @IBOutlet private weak var copyAddressButton: UIButton!
    
    @IBAction func didTapChangeNameShowingButton(_ sender: UIButton) {
        isFullNameDisplayed = !isFullNameDisplayed
        if (isFullNameDisplayed){
            changeNameShowingButton.setTitle("Покажи только Имя", for: UIControl.State.normal)
            sureName.isHidden = false
            patronicName.isHidden = false
        } else {
            changeNameShowingButton.setTitle("Покажи ФИО", for: UIControl.State.normal)
            sureName.isHidden = true
            patronicName.isHidden = true
        }
    }
    
    @IBAction func didTapCopyAddress(_ sender: UIButton) {
        UIPasteboard.general.string = person.address
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
 
    
    private func setupView() {
        changeNameShowingButton.layer.cornerRadius = 4
        sureName.text = "Фамилия: " + person.surname
        firstName.text = "Имя: " + person.name
        patronicName.text = "Отчество: " + person.patronymic
        jobTitle.text = "Должность: " + person.position
        address.text = "Адрес: " + person.address
    }
}
