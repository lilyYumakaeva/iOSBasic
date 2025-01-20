//
//  ViewController.swift
//  testUIViewController
//
//  Created by Лилия Д. Юмакаева on 02.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
    }
    
    override func loadView() {
        super.loadView()
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, view.bounds.size)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function, view.bounds.size)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }


}

