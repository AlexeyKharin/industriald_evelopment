import Foundation
protocol ControllerFactory {
    func makeFeed() -> (viewModel: ModelCheck , controller: FeedViewController)
    func makeLogin() -> (viewModel: ViewModel, controller: LogInViewController)
}

class FeedAndLoginFactory: ControllerFactory {
    
    func makeFeed() -> (viewModel: ModelCheck, controller: FeedViewController) {
        let model = Model()
        let feedController = FeedViewController(model: model)
        return (model, feedController)
    }
    
    func makeLogin() -> (viewModel: ViewModel, controller: LogInViewController) {
        let model = LoginViewModel()
        let loginController = LogInViewController(viewModel: model)
        return (model, loginController)
    }
}
