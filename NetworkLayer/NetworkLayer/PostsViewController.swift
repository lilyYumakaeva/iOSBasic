//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
 
    private let networkLayers = NetworkLayer()
    private var posts: [Post] = []
    private var selectedPost: Post? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkLayers.requestAllPosts { result in
            DispatchQueue.main.async{
                switch result {
                case .failure(let wrong):
                    print(wrong)
                case .success(let loadedPosts):
                    self.posts = loadedPosts
                    self.table.reloadData()
                }
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.titleLabel.text = posts[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPost = posts[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "comments" {
            let controller = segue.destination as! CommentsViewController
            controller.postId = selectedPost?.id ?? 1
        }
    }

}

