//
//  SpanishLocalization.swift
//  CVapp
//
//  Created by Kostiantyn Bershov on 28.01.2024.
//

import Foundation


class SpanishLocalization {
    
    static func value(for str: String) -> String {
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
