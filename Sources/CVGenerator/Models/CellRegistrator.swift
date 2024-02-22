//
//  CellRegistrator.swift
//  CVPro
//
//  Created by Kostiantyn Bershov on 22.02.2024.
//

import UIKit


class CellRegistrator {
    
    static func registrate(in tableView: UITableView, for cv: Int, isLeft: Bool) {
        if isLeft {
            switch cv {
            case 1:
                tableView.register(UINib(nibName: "TitleCellForCV1", bundle: nil), forCellReuseIdentifier: "TitleCellForCV1")
                tableView.register(UINib(nibName: "ContactsCellForCV1", bundle: nil), forCellReuseIdentifier: "ContactsCellForCV1")
                tableView.register(UINib(nibName: "SkillCellForCV1", bundle: nil), forCellReuseIdentifier: "SkillCellForCV1")
            case 2:
                tableView.register(UINib(nibName: "TitleCellForCV1", bundle: nil), forCellReuseIdentifier: "TitleCellForCV1")
                tableView.register(UINib(nibName: "SkillCellForCV2", bundle: nil), forCellReuseIdentifier: "SkillCellForCV2")
                tableView.register(UINib(nibName: "HobbyCellForCV1", bundle: nil), forCellReuseIdentifier: "HobbyCellForCV1")
            case 3:
                tableView.register(UINib(nibName: "TitleCellForCV1", bundle: nil), forCellReuseIdentifier: "TitleCellForCV1")
                tableView.register(UINib(nibName: "SkillCellForCV1", bundle: nil), forCellReuseIdentifier: "SkillCellForCV1")
                tableView.register(UINib(nibName: "HobbyCellForCV1", bundle: nil), forCellReuseIdentifier: "HobbyCellForCV1")
            case 4:
                tableView.register(UINib(nibName: "TitleCellForCV4", bundle: nil), forCellReuseIdentifier: "TitleCellForCV4")
                tableView.register(UINib(nibName: "ContactsForCV4", bundle: nil), forCellReuseIdentifier: "ContactsForCV4")
                tableView.register(UINib(nibName: "SkillCellForCV2", bundle: nil), forCellReuseIdentifier: "SkillCellForCV2")
                tableView.register(UINib(nibName: "TextCellForCV1", bundle: nil), forCellReuseIdentifier: "TextCellForCV1")
            case 5:
                tableView.register(UINib(nibName: "TitleCellForCV5", bundle: nil), forCellReuseIdentifier: "TitleCellForCV5")
                tableView.register(UINib(nibName: "TextCellForCV1", bundle: nil), forCellReuseIdentifier: "TextCellForCV1")
                tableView.register(UINib(nibName: "SkillCellForCV2", bundle: nil), forCellReuseIdentifier: "SkillCellForCV2")
            case 6:
                tableView.register(UINib(nibName: "TitleCellForCV5", bundle: nil), forCellReuseIdentifier: "TitleCellForCV5")
                tableView.register(UINib(nibName: "TextCellForCV1", bundle: nil), forCellReuseIdentifier: "TextCellForCV1")
                tableView.register(UINib(nibName: "EducationCellForCV6", bundle: nil), forCellReuseIdentifier: "EducationCellForCV6")
                tableView.register(UINib(nibName: "SkillCellForCV6", bundle: nil), forCellReuseIdentifier: "SkillCellForCV6")
                tableView.register(UINib(nibName: "HobbyCellForCV1", bundle: nil), forCellReuseIdentifier: "HobbyCellForCV1")
            default: break
            }
        }
        
        switch cv {
        case 1:
            tableView.register(UINib(nibName: "TitleCellForCV1", bundle: nil), forCellReuseIdentifier: "TitleCellForCV1")
            tableView.register(UINib(nibName: "TextCellForCV1", bundle: nil), forCellReuseIdentifier: "TextCellForCV1")
            tableView.register(UINib(nibName: "ExperienceCellForCV1", bundle: nil), forCellReuseIdentifier: "ExperienceCellForCV1")
            tableView.register(UINib(nibName: "HobbyCellForCV1", bundle: nil), forCellReuseIdentifier: "HobbyCellForCV1")
        case 2:
            tableView.register(UINib(nibName: "TitleCellForCV1", bundle: nil), forCellReuseIdentifier: "TitleCellForCV1")
            tableView.register(UINib(nibName: "TextCellForCV1", bundle: nil), forCellReuseIdentifier: "TextCellForCV1")
            tableView.register(UINib(nibName: "ExperienceCellForCV1", bundle: nil), forCellReuseIdentifier: "ExperienceCellForCV1")
            tableView.register(UINib(nibName: "ExperienceCellForCV2", bundle: nil), forCellReuseIdentifier: "ExperienceCellForCV2")
        case 3:
            tableView.register(UINib(nibName: "TitleCellForCV1", bundle: nil), forCellReuseIdentifier: "TitleCellForCV1")
            tableView.register(UINib(nibName: "TextCellForCV1", bundle: nil), forCellReuseIdentifier: "TextCellForCV1")
            tableView.register(UINib(nibName: "ExperienceCellForCV2", bundle: nil), forCellReuseIdentifier: "ExperienceCellForCV2")
        case 4:
            tableView.register(UINib(nibName: "TitleCellForCV4", bundle: nil), forCellReuseIdentifier: "TitleCellForCV4")
            tableView.register(UINib(nibName: "ExperienceCellForCV1", bundle: nil), forCellReuseIdentifier: "ExperienceCellForCV1")
            tableView.register(UINib(nibName: "ExperienceCellForCV2", bundle: nil), forCellReuseIdentifier: "ExperienceCellForCV2")
            tableView.register(UINib(nibName: "HobbyCellForCV1", bundle: nil), forCellReuseIdentifier: "HobbyCellForCV1")
        case 5:
            tableView.register(UINib(nibName: "TitleCellForCV5", bundle: nil), forCellReuseIdentifier: "TitleCellForCV5")
            tableView.register(UINib(nibName: "ExperienceCellForCV2", bundle: nil), forCellReuseIdentifier: "ExperienceCellForCV2")
            tableView.register(UINib(nibName: "HobbyCellForCV1", bundle: nil), forCellReuseIdentifier: "HobbyCellForCV1")
        default: break
        }
    }
}
