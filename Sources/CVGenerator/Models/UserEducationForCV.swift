//
//  UserEducationForCV.swift


import Foundation


public struct UserEducationForCV {
    public var educationPeriod: String?
    public var diplomaName: String?
    public var universityTitle: String?
    public var universityGeo: String?
    public var description: String?
    
    public init(educationPeriod: String? = nil, diplomaName: String? = nil, universityTitle: String? = nil, universityGeo: String? = nil, description: String? = nil) {
        self.educationPeriod = educationPeriod
        self.diplomaName = diplomaName
        self.universityTitle = universityTitle
        self.universityGeo = universityGeo
        self.description = description
    }
}
