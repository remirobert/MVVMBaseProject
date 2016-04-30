//
//  UIViewController+Extension.swift
//  MVVM-Base-Project
//
//  Created by Remi Robert on 30/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

//Add storyboards here, for easy instanciation

extension NSObject {
    static var nameOfClass: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
}

extension UIViewController {
    class func instanceController(storyboard: StoryBoards) -> UIViewController? {
        return storyboard.storyboard().instantiateViewControllerWithIdentifier(self.nameOfClass)
    }
}
