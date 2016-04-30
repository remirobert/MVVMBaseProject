//
//  Storyboards.swift
//  MVVMStarterProject
//
//  Created by Remi Robert on 30/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

enum StoryBoards: String {
    case Main = "Main"
    
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

