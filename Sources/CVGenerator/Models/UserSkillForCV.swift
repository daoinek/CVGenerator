//
//  UserSkillForCV.swift


import Foundation


public protocol SkillProtocol {
    var title: String? { get set }
    var rate: Int { get set }
    
}

public struct UserSkillForCV: SkillProtocol {
    public var title: String?
    public var rate: Int
    
    
    public init(title: String? = nil, rate: Int) {
        self.title = title
        self.rate = rate
    }
 
}
