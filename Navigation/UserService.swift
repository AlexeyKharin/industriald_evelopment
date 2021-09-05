//
//  UserService.swift
//  Navigation
import Foundation
protocol UserService {
    func obtains(nameUser: String) -> User?
}

class CurrentUserService: UserService {
    
    let userNaruto = User(name: "Naruto", status: "Never give up", avatar: #imageLiteral(resourceName: "1536741399_15-3"))
    
    func obtains(nameUser: String) -> User? {
        guard nameUser != userNaruto.name else { return userNaruto }
        return nil
    }
}
class TestUserService: UserService {
    let userNaruto = User(name: "Guy", status: "Power", avatar: #imageLiteral(resourceName: "c6c95964058b5d556223204fdcdaa1a1-6"))
    
    func obtains(nameUser: String) -> User? {
        guard nameUser != userNaruto.name else { return userNaruto }
        return nil
    }
}
