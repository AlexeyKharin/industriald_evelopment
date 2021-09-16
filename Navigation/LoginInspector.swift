
import Foundation

protocol LoginViewControllerDelegate {
    func checkLoginAndPswd(login: String, pswd: String) -> Bool
}

class LoginInspector: LoginViewControllerDelegate {
    
    let checker = Checker.shared
    
    func checkLoginAndPswd(login: String, pswd: String) -> Bool {
        let result = checker.check(login: login, pswd: pswd)
        guard result else { return false }
        return true
    }
}

