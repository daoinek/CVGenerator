//
//  UserHobbyForCV.swift


import Foundation


public struct UserHobbyForCV {
    public var name: String?
    public var aboutHobby: String?
    
    public init(name: String? = nil, aboutHobby: String? = nil) {
        self.name = name
        self.aboutHobby = aboutHobby
    }
}
