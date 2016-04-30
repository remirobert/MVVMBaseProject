//
//  protocol UIViewControllerCoordinable {     func start() } UIViewControllerCoordinable.swift
//  MVVC-Base-Project
//
//  Created by Remi Robert on 30/04/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol Coordinable {
    associatedtype ViewModel
    var viewmodel: ViewModel? {get set}
    func start()
}
