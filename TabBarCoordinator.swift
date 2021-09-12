//
//  TabBarCoordinator.swift
//  Navigation
//
//  Created by Alexey Kharin on 12.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class tabBarCoordinator: NSObject, Coordinator {
    
    private let feedFactory = FeedFactory()
    
    var coordinators: [Coordinator] = []
    
    @IBOutlet weak var tabBarController: UITabBarController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let feedCoordinator = configureFeed()
        tabBarController.viewControllers?.append(feedCoordinator.navigationController)
        coordinators.append(feedCoordinator)
        feedCoordinator.start()
    }
    
    private func configureFeed() -> FeedCoordinator {
        
        let navigationFeed = UINavigationController()
        navigationFeed.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor.systemGray4).withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor.systemRed).withRenderingMode(.alwaysOriginal))
        let coordinator = FeedCoordinator(
            navigation: navigationFeed,
            factory: feedFactory)
        
        return coordinator
    }
}
