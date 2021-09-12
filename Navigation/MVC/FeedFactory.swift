import Foundation
protocol ControllerFactory {
    func makeFeed() -> (viewModel: ModelCheck , controller: FeedViewController)
}

class FeedFactory: ControllerFactory {
    
    func makeFeed() -> (viewModel: ModelCheck, controller: FeedViewController) {
        let model = Model()
        let feedController = FeedViewController(model: model)
        return (model, feedController)
    }
}
