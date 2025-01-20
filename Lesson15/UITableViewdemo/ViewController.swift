//
//  ViewController.swift
//  UITableViewdemo
//
//  Created by Лилия Д. Юмакаева on 18.11.2024.
//

import UIKit

class ViewController: UIViewController {
     
    

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//numberOfSections, numberOfRowsInSection, cellForRowAt - настраивайте ячейку тут!
//, hightForRowAt, willDisplay

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if [0,1].contains(indexPath.section) {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "CustomCellID",
                for: indexPath
            ) as? CustomTableViewCell else  {
                return tableView.dequeueReusableCell(
                    withIdentifier: "DefaultCellID",
                    for: indexPath
                )
            }
            cell.setup(with: "qwerqwer")
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if [0, 1].contains(section) {
            return "Header"
        }
        
        return nil
    }
}

extension ViewController: UITableViewDelegate {
    
    private func tableView(_ tableView: UITableView, hightForRowAt indexPath: IndexPath) -> CGFloat {
        if [0,1].contains(indexPath) {
            if (indexPath.row == 1) {
                return UITableView.automaticDimension
            }
            return 100
        }
        return  UITableView.automaticDimension
    }
}

