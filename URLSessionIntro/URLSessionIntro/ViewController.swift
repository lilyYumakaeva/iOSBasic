//
//  ViewController.swift
//  URLSessionIntro
//
//  Created by Лилия Д. Юмакаева on 18.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private weak var networkClient: NetworkClient? = DI.shared.networkClinet

    override func viewDidLoad() {
        super.viewDidLoad()
        networkClient?.request(
            query: "everything?q=tesla&from=2024-12-20&sortBy=publishedAt&apiKey=0e55b40d91464422a4f804d5e0fbc96e",
            method: .get,
            params: [:],
            completionHandler: {(result: Result<Article, Error>) in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let data):
                    for aticle in data.articles {
                        print(aticle)
                    }
                }}
        )
        // Do any additional setup after loading the view.
    }


}

