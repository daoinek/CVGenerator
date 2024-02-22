//
//  File.swift
//  
//
//

import UIKit


public class ContactsManager {
    
    public var contacts: UserContactsForCV = UserContactsForCV()
    public var new_contacts: UserContactsForCV
    
    
    init() {
        new_contacts = contacts
    }
    
    
    public func saveProfile() {
        self.contacts.profilePhoto = self.new_contacts.profilePhoto
        self.contacts.firstName = self.new_contacts.firstName
        self.contacts.secondName = self.new_contacts.secondName
        self.contacts.positionInCompany = self.new_contacts.positionInCompany
        self.contacts.personLocation = self.new_contacts.personLocation
        self.contacts.personDescription = self.new_contacts.personDescription
    }
    
    
    public func saveContacts() {
        self.contacts.phone = self.new_contacts.phone
        self.contacts.email = self.new_contacts.email
        self.contacts.link = self.new_contacts.link
    }
    
    
    public func updateProfile(text: String?, tag: Int) {
        switch tag {
        case 1:
            let names: [String?] = text?.components(separatedBy: " ") ?? [text]
            self.new_contacts.firstName = (names.count > 0) ? names[0] : nil
            self.new_contacts.secondName = (names.count > 1) ? names[1] : nil
        case 2: self.new_contacts.positionInCompany = text
        case 3: self.new_contacts.personLocation = text
        case 4: self.new_contacts.personDescription = text
        default: break
        }
    }
    
    
    public func updateContacts(text: String?, tag: Int) {
        switch tag {
        case 0: self.new_contacts.email = text
        case 1: self.new_contacts.phone = text
        case 2: self.new_contacts.link = text
        default: break
        }
    }
    
}


public class SkillsManager {
    
    public var skills: [UserSkillForCV] = []
    public var languages: [UserSkillForCV] = []
    public var software: [UserSkillForCV] = []

    public var new_skills: [UserSkillForCV]!
    public var new_languages: [UserSkillForCV]!
    public var new_software: [UserSkillForCV]!
    
    init() {
        new_skills = skills
        new_languages = languages
        new_software = software
    }
    
    
    public func saveSkills() {
        self.skills = self.new_skills
    }
    
    
    public func saveLanguages() {
        self.languages = self.new_languages
    }
    
    
    public func saveSoftware() {
        self.software = self.new_software
    }
    
    
    public func updateSkills(type: rateType, title: String, rate: Int, needRemove: Bool = false) {
        func updateSkillsList(list: inout [UserSkillForCV], title: String, rate: Int) {
            if let index = list.firstIndex(where: { $0.title?.contains(title) ?? false }) {
                list.remove(at: index)
            }
            if !needRemove {
                list.append(UserSkillForCV(title: title, rate: rate))
            }
        }

        switch type {
        case .isSkill:
            updateSkillsList(list: &new_skills, title: title, rate: rate)
        case .isSoftware:
            updateSkillsList(list: &new_software, title: title, rate: rate)
        case .isLanguage:
            updateSkillsList(list: &new_languages, title: title, rate: rate)
        }
    }
    
}


public class ExperienceManager {
    
    public var experience: [UserExperienceForCV] = []
    public var projects: [ProjectInfoForCV] = []
    public var education: [UserEducationForCV] = []
    public var hobbies: [UserHobbyForCV] = []
    
    public var new_experience: [UserExperienceForCV]!
    public var new_projects: [ProjectInfoForCV]!
    public var new_education: [UserEducationForCV]!
    public var new_hobbies: [UserHobbyForCV]!
    
    
    init() {
        new_experience = experience
        new_projects = projects
        new_education = education
        new_hobbies = hobbies
    }
    
    
    public func saveExperience() {
        self.experience = self.new_experience
    }
    
    
    public func saveProjects() {
        self.projects = self.new_projects
    }
    
    
    public func saveEducation() {
        self.education = self.new_education
    }
    
    
    public func saveHobbies() {
        self.hobbies = self.new_hobbies
    }
    
    
    public func update(type: CVItemCategoryType, indexPath: IndexPath, text: String?) {
        switch type {
        case .Experience: updateItem(for: indexPath, text: text, in: &new_experience)
        case .Education: updateItem(for: indexPath, text: text, in: &new_education)
        case .Project: updateItem(for: indexPath, text: text, in: &new_projects)
        case .Hobby: updateItem(for: indexPath, text: text, in: &new_hobbies)
        }
    }
    
    
    public func updateItem<T: UpdatableItem>(for indexPath: IndexPath, text: String?, in items: inout [T]) {
        guard indexPath.section < items.count else { return }

        switch indexPath.row {
        case 1: items[indexPath.section].updateCompanyUniversityName(text)
        case 2: items[indexPath.section].updatePositionDiploma(text)
        case 3: items[indexPath.section].updateDate(text)
        case 4: items[indexPath.section].updateGeo(text)
        case 5: items[indexPath.section].updateDescription(text)
        default: break
        }
    }
    
}


public protocol UpdatableItem {
    mutating func updateCompanyUniversityName(_ text: String?)
    mutating func updatePositionDiploma(_ text: String?)
    mutating func updateDate(_ text: String?)
    mutating func updateGeo(_ text: String?)
    mutating func updateDescription(_ text: String?)
}


extension UserExperienceForCV: UpdatableItem {
    public mutating func updateCompanyUniversityName(_ text: String?) {
        companyName = text
    }

    mutating public func updatePositionDiploma(_ text: String?) {
        positionInCompany = text
    }

    mutating public func updateDate(_ text: String?) {
        workPeriod = text
    }

    mutating public func updateGeo(_ text: String?) {
        workGeo = text
    }

    mutating public func updateDescription(_ text: String?) {
        workDetals = text
    }
}

extension UserEducationForCV: UpdatableItem {
    mutating public func updateCompanyUniversityName(_ text: String?) {
        universityTitle = text
    }

    mutating public func updatePositionDiploma(_ text: String?) {
        diplomaName = text
    }

    mutating public func updateDate(_ text: String?) {
        educationPeriod = text
    }

    mutating public func updateGeo(_ text: String?) {
        universityGeo = text
    }

    mutating public func updateDescription(_ text: String?) {
        description = text
    }
}

extension ProjectInfoForCV: UpdatableItem {
    mutating public func updateCompanyUniversityName(_ text: String?) {
        name = text
    }

    mutating public func updatePositionDiploma(_ text: String?) {
        link = text
    }

    mutating public func updateDate(_ text: String?) {
        date = text
    }

    mutating public func updateGeo(_ text: String?) {
        description = text
    }

    mutating public func updateDescription(_ text: String?) {
        description = text
    }
}


extension UserHobbyForCV: UpdatableItem {
    mutating public func updateCompanyUniversityName(_ text: String?) {
        name = text
    }

    mutating public func updatePositionDiploma(_ text: String?) {
        aboutHobby = text
    }

    mutating public func updateDate(_ text: String?) {
        // No date property for HobbyItem
    }

    mutating public func updateGeo(_ text: String?) {
        // No geo property for HobbyItem
    }

    mutating public func updateDescription(_ text: String?) {
        aboutHobby = text
    }
}


public protocol CVManagerProtocol {
    var contacts: ContactsManager! { get set }
    var skills: SkillsManager! { get set }
    var experience: ExperienceManager! { get set }
    var cvColors: [UIColor] { get set }
    
    func initMainInfo()
    func initColors(for cv: Int)
     
}



public class CVConfigurator: CVManagerProtocol {
    
    public var contacts: ContactsManager!
    public var skills: SkillsManager!
    public var experience: ExperienceManager!
    public var cvColors: [UIColor] = []

    
    init() {
        initMainInfo()
    }
    
    
    public func initColors(for cv: Int) {
        switch cv {
        case 0: cvColors = [UIColor(hex: "FFFFFF"), UIColor(hex: "5A5A5A"), UIColor(hex: "4AA7AB"), UIColor(hex: "434346")]
        case 1: cvColors = [UIColor(hex: "2D2A2F"), UIColor(hex: "545454"), UIColor(hex: "50405A"), UIColor(hex: "FFFFFF")]
        case 2: cvColors = [UIColor(hex: "454645"), UIColor(hex: "D7D7D7"), UIColor(hex: "FF9052"), UIColor(hex: "FFFFFF")]
        case 3: cvColors = [UIColor(hex: "2B2B2B"), UIColor(hex: "818181"), UIColor(hex: "6187EA"), UIColor(hex: "FFFFFF")]
        case 4: cvColors = [UIColor(hex: "FFFFFF"), UIColor(hex: "E1E1E1"), UIColor(hex: "CBABF4"), UIColor(hex: "403F41")]
        case 5: cvColors = [UIColor(hex: "1E231D"), UIColor(hex: "959595"), UIColor(hex: "12420E"), UIColor(hex: "FFFFFF")]
        default: break
        }
    }
    
    
    public func initMainInfo() {
        contacts = ContactsManager()
        skills = SkillsManager()
        experience = ExperienceManager()
    }
    
}


extension UIColor {
    convenience init(hex hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
