//
//  UserSkillForCV.swift


import Foundation


protocol SkillProtocol {
    var title: String? { get set }
    var rate: Int { get set }
}

struct UserSkillForCV: SkillProtocol {
    var title: String?
    var rate: Int
}
