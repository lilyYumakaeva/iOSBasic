//
//  ViewController.swift
//  Lesson15
//
//  Created by Лилия Д. Юмакаева on 18.11.2024.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyAlbumCell.self, forCellReuseIdentifier: "MyAlbumCellID")
        tableView.register(PeopleAndPlacesCell.self, forCellReuseIdentifier: "PeopleAndPlacesCellID")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCellID")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if [0,1].contains(section){
            return 1
        }
        if section == 2 {
            return 9
        }
        if section == 3 {
            return 4
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyAlbumCellID", for: indexPath)
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleAndPlacesCellID", for: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellID", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Мои альбомы"
        }
        if section == 1 {
            return "Люди и места"
        }
        return nil
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return tableView.bounds.height * 0.5
        }
        
        if indexPath.section == 1 {
            return tableView.bounds.height * 0.25
        }
        
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
}
