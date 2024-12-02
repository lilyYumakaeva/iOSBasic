//
//  CustomTableViewCell.swift
//  Homework17
//
//  Created by Лилия Д. Юмакаева on 28.11.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet private weak var cellLabel: UILabel!
    
    func setup(with text: String) {
        cellLabel.text = text
    }
}
