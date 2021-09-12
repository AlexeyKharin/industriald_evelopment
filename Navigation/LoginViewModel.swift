import Foundation

protocol ViewModel {
    var onShowProfile: ((UserService, String) -> Void)? { get set }
    var onTapShowProfile: (_ login: String, _ pswd: String) -> Void { get set }
}

class LoginViewModel: ViewModel {
    
    let loginFactory = MyLoginFactory()
    // интерфейс для отправки данных в LoginCoordinator
    var onShowProfile: ((UserService, String) -> Void)?
    
    // интерфейс для приема данных от LoginViewController
    lazy var onTapShowProfile: (_ login: String, _ pswd: String) -> Void = { [weak self] (login, pswd)  in
        if self?.loginFactory.makeLoginInspector().checkLoginAndPswd(login: login, pswd: pswd) == true {
            #if DEBUG
            let testUser = TestUserService()
            self?.onShowProfile?(testUser, login)
            #else
            let currentUser = CurrentUserService()
            self?.onShowProfile?(currentUser, login)
            #endif
        }
    }
}
