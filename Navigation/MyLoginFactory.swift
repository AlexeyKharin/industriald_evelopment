
import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginViewControllerDelegate
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginViewControllerDelegate {
        return LoginInspector.shared
    }
}
