import Foundation
import UIKit

class User {
    var name: String
    var status: String
    var avatar: UIImage
    
    init(name: String, status: String, avatar: UIImage) {
        self.avatar = avatar
        self.name = name
        self.status = status
    }
}


