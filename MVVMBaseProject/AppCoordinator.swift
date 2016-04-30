//
//  AppCoordinator.swift
//  MVVM-Base-Project
//
//  Created by Remi Robert on 30/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

//Handles the transition between UIViewControllers, and new instanciation

class AppCoordinator {

    private var window: UIWindow
    
    private var rootController: UIViewController! {
        didSet {
            self.window.rootViewController = self.rootController
        }
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        self.instanceMainController()
    }
}

extension AppCoordinator {

    private func instanceMainController() {
        guard let vc = MainViewController.instanceController(StoryBoards.Main) as? MainViewController else {
            return
        }
        //setup view model with some data from previous UIViewController
        vc.viewmodel = MainViewModel()
        vc.start()
        self.rootController = UINavigationController(rootViewController: vc)
    }
}
