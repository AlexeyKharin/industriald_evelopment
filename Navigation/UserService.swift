//
//  UserService.swift
//  Navigation
import Foundation
protocol UserService {
    func obtains(nameUser: String) -> User?
}

class CurrentUserService: UserService {
    
    let userNaruto = User(name: "Naruto", status: "Never give up", avatar: #imageLiteral(resourceName: "images-4"))
    
    func obtains(nameUser: String) -> User? {
        guard nameUser != userNaruto.name else { return userNaruto }
        return nil
    }
}
class TestUserService: UserService {
    let userNaruto = User(name: "Guy", status: "Power", avatar: #imageLiteral(resourceName: "c6c95964058b5d556223204fdcdaa1a1-4"))
    
    func obtains(nameUser: String) -> User? {
        guard nameUser != userNaruto.name else { return userNaruto }
        return nil
    }
}
