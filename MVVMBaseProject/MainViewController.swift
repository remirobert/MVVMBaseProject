//
//  ViewController.swift
//  MVVC-Base-Project
//
//  Created by Remi Robert on 30/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Coordinable {

    typealias ViewModel = MainViewModel
    var viewmodel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup views
        
        print("current url : \(SERVER_URL)")
    }
    
    func start() {
        //setup buisiness
    }
}
