//
//  ViewController.swift
//  NetworkStarting
//
//  Created by Лилия Д. Юмакаева on 27.01.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var userTable: UITableView!
    
    private let networkLayers = NetworkLayer()
    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkLayers.requestUser { result in
            DispatchQueue.main.async{
                switch result {
                case .failure(let wrong):
                    print(wrong)
                case .success(let loadedUsers):
                    self.users = loadedUsers
                    print(loadedUsers)
                    self.userTable.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ToUserDataSegueID" else { return }
        guard let destination = segue.destination as? UserDetailsViewController else { return }
        guard let indexPath = userTable.indexPathForSelectedRow else { return }
        destination.user = users[indexPath.row]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.userInfoLabel.text = users[indexPath.row].getFullName()
        
        return cell
    }


   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Random users"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToUserDataSegueID", sender: nil)
    }
}
