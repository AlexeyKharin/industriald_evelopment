import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    private let factory: ControllerFactory
    
    private lazy var feedModuleNavigation = {
        factory.makeFeed()
    }()
    
    init(navigation: UINavigationController,
         factory: ControllerFactory) {
        self.navigationController = navigation
        self.factory = factory
    }
    
    func start() {
        feedModuleNavigation.controller.showNewComtroller = { [weak self] in
            let controller = GallaryPhotosUINavigationController()
            self?.navigationController.pushViewController(controller, animated: true)
        }

        navigationController.pushViewController(feedModuleNavigation.controller, animated: true)
    }
}
