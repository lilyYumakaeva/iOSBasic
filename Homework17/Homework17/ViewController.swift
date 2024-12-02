//
//  ViewController.swift
//  Homework17
//
//  Created by Лилия Д. Юмакаева on 28.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let persons: [PersonData] = [
        .init(name: "Иван", surname: "Иванов", patronymic: "Иванович", address: "ыава", position: "менеджер"),
        .init(name: "Петр", surname: "Петров", patronymic: "Петрович", address: "ыава", position: "разработчик"),
        .init(name: "Александр", surname: "Александров", patronymic: "Александрович", address: "фывава", position: "тестировщик"),
        .init(name: "Анна", surname: "Волкова", patronymic: "Михайловна", address: "цукук", position: "дизайнер"),
    ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ToPersonDataSegueID" else { return }
        guard let destination = segue.destination as? ViewControllerPerson else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        destination.person = persons[indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "CustomCellID",
            for: indexPath
         ) as? CustomTableViewCell else {
             let cell = tableView.dequeueReusableCell(
                withIdentifier: "CustomCellID",
                for: indexPath
             )
             cell.accessoryType = .disclosureIndicator
             return cell
         }
         cell.setup(with: persons[indexPath.item].fullName())
         cell.accessoryType = .disclosureIndicator
         return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Сотрудники"
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToPersonDataSegueID", sender: nil)
    }
}
