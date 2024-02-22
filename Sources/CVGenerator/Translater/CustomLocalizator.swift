//
//  ItalianLocalization.swift
//  CVapp
//
//

import Foundation

enum CustomLocalizeType {
    case ital
    case jap
    case dutch
    case port
    case span
}



class CustomLocalizator {
    
    
    static func getTranslate(for type: CustomLocalizeType, str: String) -> String {
        switch type {
        case .ital:
            switch str {
            case "Software": return "Software"
            case "Contacts": return "Contatti"
            case "Languages": return "Lingue"
            case "Profile": return "Profilo"
            case "Skills": return "Competenze"
            case "Education": return "Educazione"
            case "Experience": return "Esperienza"
            case "Hobbies": return "Passatempi"
            case "Projects": return "Progetti"
            default: return ""
            }
        case .jap:
            switch str {
            case "Experience": return  "経験"
            case "Skills": return "スキル"
            case "Software": return  "ソフトウェア"
            case "Profile": return "プロフィール"
            case "Education": return "学歴"
            case "Languages": return "言語"
            case "Projects": return  "プロジェクト"
            case "Hobbies": return "趣味"
            case "Contacts": return  "連絡先"
            default: return ""
            }
        case .dutch:
            switch str {
            case "Skills": return "Vaardigheden"
            case "Software": return  "Software"
            case "Profile": return "Profiel"
            case "Contacts": return  "Contacten"
            case "Projects": return  "Projecten"
            case "Education": return  "Opleiding"
            case "Experience": return   "Ervaring"
            case "Languages": return  "Talen"
            case "Hobbies": return "Hobby's"
            default: return ""
            }
        case .port:
            switch str {
            case "Hobbies": return "Passatempos"
            case "Contacts": return  "Contactos"
            case "Skills": return "Competências"
            case "Experience": return   "Experiência"
            case "Software": return  "Software"
            case "Profile": return "Perfil"
            case "Education": return  "Educação"
            case "Languages": return  "Idiomas"
            case "Projects": return  "Projetos"
            default: return ""
            }
        case .span:
            switch str {
            case "Experience": return   "Experiencia"
            case "Contacts": return  "Contactos"
            case "Software": return  "Software"
            case "Profile": return "Perfil"
            case "Education": return  "Educación"
            case "Projects": return  "Proyectos"
            case "Languages": return  "Idiomas"
            case "Hobbies": return "Pasatiempos"
            case "Skills": return "Habilidades"
            default: return ""
            }
        }
    }
}
