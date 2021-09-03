
import Foundation

protocol LoginViewControllerDelegate {
    func checkLoginAndPswd(login: String, pswd: String) -> Bool
}

class LoginInspector: LoginViewControllerDelegate {
    
    var login: String
    
    var pswd: String
    
    public static let shared: LoginInspector = .init()
    
    private init() {
        self.login = "Guy"
        self.pswd = "Mayto"
    }
    
    func checkLoginAndPswd(login: String, pswd: String) -> Bool {
        if login == self.login && pswd == self.pswd {
            return true
        } else {
            return false
        }
    }
}
