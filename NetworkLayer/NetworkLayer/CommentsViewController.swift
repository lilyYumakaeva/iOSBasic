//
//  CommentsViewController.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController {
    var postId: Int = 0
    
    private let networlkLayer = NetworkLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networlkLayer.getAllComments(postId: postId) { result in
            print (result)
        }
    }
    
}
