//
//  LocalizationForCV.swift


import Foundation


enum LanguagesResumeType: String {
    case English
    case Italian
    case France
    case Spanish
    case Japanese
    case Portuguese
    case Dutch
    case Chinese
}


protocol CVLocalizatorProtocol {
    func localizeFor(_ str: String) -> String
    func update(_ lang: LanguagesResumeType)
}


class LocalizationForCV: CVLocalizatorProtocol {
    
    
    init() {
        selected = .English
    }
    
    private var selected: LanguagesResumeType
    
    
    func localizeFor(_ str: String) -> String {
        switch selected {
        case .Japanese: return CustomLocalizator.getTranslate(for: .jap, str: str)
        case .Italian: return CustomLocalizator.getTranslate(for: .ital, str: str)
        case .France:
            switch str {
            case "Software": return  "Logiciels"
            case "Contacts": return  "Contacts"
            case "Languages": return "Langues"
            case "Skills": return "Compétences"
            case "Projects": return  "Projets"
            case "Profile": return "Profil"
            case "Education": return "Éducation"
            case "Hobbies": return "Loisirs"
            case "Experience": return  "Expérience"
            default: return ""
            }
        case .Spanish: return CustomLocalizator.getTranslate(for: .span, str: str)
        case .Portuguese: return CustomLocalizator.getTranslate(for: .port, str: str)
        case .Dutch: return CustomLocalizator.getTranslate(for: .dutch, str: str)
        case .Chinese:
            switch str {
            case "Languages": return  "语言"
            case "Contacts": return  "联系方式"
            case "Skills": return "技能"
            case "Profile": return "个人资料"
            case "Projects": return  "项目"
            case "Experience": return   "工作经验"
            case "Hobbies": return "爱好"
            case "Software": return  "软件"
            case "Education": return  "教育"
            default: return ""
            }
        case .English:
            switch str {
            case "Skills": return "Skills"
            case "Profile": return "Profile"
            case "Contacts": return "Contacts"
            case "Software": return "Software"
            case "Languages": return "Languages"
            case "Education": return "Education"
            case "Experience": return "Experience"
            case "Hobbies": return "Hobbies"
            case "Projects": return "Projects"
            default: return ""
            }
        }
    }
    
    
    func update(_ lang: LanguagesResumeType) {
        selected = lang
    }
}
