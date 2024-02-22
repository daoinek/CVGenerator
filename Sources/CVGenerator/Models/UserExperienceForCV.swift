//
//  UserExperienceForCV.swift


import Foundation


public struct UserExperienceForCV {
    public var positionInCompany: String?
    public var companyName: String?
    public var workPeriod: String?
    public var workGeo: String?
    public var workDetals: String?
    
    public init(positionInCompany: String? = nil, companyName: String? = nil, workPeriod: String? = nil, workGeo: String? = nil, workDetals: String? = nil) {
        self.positionInCompany = positionInCompany
        self.companyName = companyName
        self.workPeriod = workPeriod
        self.workGeo = workGeo
        self.workDetals = workDetals
    }
}
