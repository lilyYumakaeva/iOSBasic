//
//  CustomTableViewCell.swift
//  UITableViewdemo
//
//  Created by Лилия Д. Юмакаева on 19.11.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet private weak var customLabel: UILabel!
    
    func setup(with text: String) {
        customLabel.text = text
        customLabel.numberOfLines = 0
    }
    
}
