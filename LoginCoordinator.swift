//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Alexey Kharin on 12.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
 
    
    var coordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    private let factory: ControllerFactory
    
    private lazy var loginModuleNavigation = {
        factory.makeLogin()
    }()
    
    init(navigation: UINavigationController,
         factory: ControllerFactory) {
        self.navigationController = navigation
        self.factory = factory
    }
    
    func start() {
        loginModuleNavigation.viewModel.onShowProfile = { [weak self] (user, login) in
            let vc = ProfileViewController(userService: user, nameUser: login)
            self?.navigationController.pushViewController(vc, animated: true)
        }
        navigationController.pushViewController(loginModuleNavigation.controller, animated: true)
    }
}
