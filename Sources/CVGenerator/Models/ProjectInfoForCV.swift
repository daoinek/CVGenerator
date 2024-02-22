//
//  Project.swift


import Foundation


public struct ProjectInfoForCV {
    public var date: String?
    public var name: String?
    public var link: String?
    public var description: String?
    
    public init(date: String? = nil, name: String? = nil, link: String? = nil, description: String? = nil) {
        self.date = date
        self.name = name
        self.link = link
        self.description = description
    }
}
