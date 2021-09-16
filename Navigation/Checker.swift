
import Foundation

struct Checker {
    private var login: String
    
    private var pswd: String
    
    public static let shared: Checker = .init()
    
    private init() {
        self.login = "Guy"
        self.pswd = "Mayto"
    }
    
    func check(login: String, pswd: String) -> Bool {
        if login == self.login && pswd == self.pswd {
            return true
        } else {
            return false
        }
    }
}
