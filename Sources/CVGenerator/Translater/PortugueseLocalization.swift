//
//  PortugueseLocalization.swift
//  CVapp
//
//  Created by Kostiantyn Bershov on 28.01.2024.
//

import Foundation


class PortugueseLocalization {
    
    static func value(for str: String) -> String {
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
    }
}
