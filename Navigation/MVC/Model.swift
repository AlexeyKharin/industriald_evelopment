
import Foundation
protocol ModelCheck {
    func check(password: String)
    var response: ((Bool) -> Void)? { get set }
}
class Model: ModelCheck {
    
    var response: ((Bool) -> Void)?
    
   private let password: String = "Naruto"
    
    func check(password: String) {
        if password == self.password {
            response?(true)
        } else {
            response?(false)
        }
    }
    
}
