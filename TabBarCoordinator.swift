import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    private let factory = FeedAndLoginFactory()
    
    var coordinators: [Coordinator] = []
    
    let tabBarController: TabBarController
    
    init() {
        tabBarController = TabBarController()
        let feedCoordinator = configureFeed()
        let loginCoordinator = configureLogin()
        
        tabBarController.viewControllers = [feedCoordinator.navigationController, loginCoordinator.navigationController]
        
        coordinators.append(loginCoordinator)
        coordinators.append(feedCoordinator)
        
        feedCoordinator.start()
        loginCoordinator.start()
    }
    
    private func configureLogin() -> LoginCoordinator {
        
        let navigationFeed = UINavigationController()
        navigationFeed.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.fill"),
            selectedImage: nil)
        let coordinator = LoginCoordinator(
            navigation: navigationFeed,
            factory: factory)
        
        return coordinator
    }
    
    private func configureFeed() -> FeedCoordinator {
        
        let navigationFeed = UINavigationController()
        navigationFeed.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor.systemGray4).withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor.systemRed).withRenderingMode(.alwaysOriginal))
        let coordinator = FeedCoordinator(
            navigation: navigationFeed,
            factory: factory)
        
        return coordinator
    }
}
