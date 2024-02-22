//
//  Resume1.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class Resume1: UIView {

    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var positionSubtitle: UILabel!
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var mainTableView: UITableView!
    
    var manager: CVManagerProtocol!
    let localizator: CVLocalizatorProtocol = LocalizationForCV()

    
    func generate(_ callback: @escaping(Data?) -> Void) {
        self.frame = CGRect(x: 0, y: 0, width: 1240, height: 1754)
        UIViewExtensions.round(view: profileIMG, radius: 46)
        setUI()
        leftTableView.reloadData()
        mainTableView.reloadData()
        let data = self.generatePDFFromCurrentView()
        callback(data)
    }
    
    
    private func setUI() {
        set(leftTableView)
        set(mainTableView)
        CellRegistrator.registrate(in: leftTableView, for: 1, isLeft: true)
        CellRegistrator.registrate(in: mainTableView, for: 1, isLeft: false)
        setColors()
        initContent()
    }
    
    
    private func set(_ tableView: UITableView) {
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func setColors() {
        backgroundColor = manager.cvColors[3]
        nameTitle.textColor = manager.cvColors[2]
        positionSubtitle.textColor = manager.cvColors[0]
    }
    
    
    private func initContent() {
        self.nameTitle.text = "\(manager.contacts.contacts.firstName ?? "") \(manager.contacts.contacts.secondName ?? "")"
        self.positionSubtitle.text = manager.contacts.contacts.positionInCompany
        self.profileIMG.image = manager.contacts.contacts.profilePhoto ?? UIImage(named: "profilePhotoTemplate")
    }
    
    
    private func getTitle(for section: Int, isLeft: Bool) -> String {
        switch section {
        case 0: return isLeft ? "Contacts" : "Profile"
        case 1: return isLeft ? "Skills" : "Education"
        case 2: return isLeft ? "Languages" : "Experience"
        case 3: return isLeft ? "Software" : "Projects"
        case 4: return "Hobbies"
        default: return ""
        }
    }

}


extension Resume1: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView == leftTableView ? 4 : 5
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            switch section {
            case 0: return 2
            case 1: return manager.skills.skills.count + 1
            case 2: return manager.skills.languages.count + 1
            case 3: return manager.skills.software.count + 1
            default: return 0
            }
        }
        switch section {
        case 0: return 2
        case 1: return manager.experience.education.count + 1
        case 2: return manager.experience.experience.count + 1
        case 3: return manager.experience.projects.count + 1
        case 4: return manager.experience.hobbies.count + 1
        default: return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row == 0) ? TitleCellForCV1.height : UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellForCV1", for: indexPath) as! TitleCellForCV1
            cell.configurator = manager
            cell.set(title: localizator.localizeFor(getTitle(for: indexPath.section, isLeft: (tableView == leftTableView))),
                     isLeft: (tableView == leftTableView))
            return cell
        }
        
        if tableView == leftTableView {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCellForCV1", for: indexPath) as! ContactsCellForCV1
                cell.configurator = manager
                cell.set(manager.contacts.contacts)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV1", for: indexPath) as! SkillCellForCV1
                cell.configurator = manager
                cell.set(manager.skills.skills[indexPath.row - 1])
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV1", for: indexPath) as! SkillCellForCV1
                cell.configurator = manager
                cell.set(manager.skills.languages[indexPath.row - 1])
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV1", for: indexPath) as! SkillCellForCV1
                cell.configurator = manager
                cell.set(manager.skills.software[indexPath.row - 1])
                return cell
            default: break
            }
        } else {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCellForCV1", for: indexPath) as! TextCellForCV1
                cell.mainTitle.textColor = manager.cvColors[0]
                cell.mainTitle.text = manager.contacts.contacts.personDescription
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV1", for: indexPath) as! ExperienceCellForCV1
                cell.configurator = manager
                cell.set(manager.experience.education[indexPath.row - 1])
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV1", for: indexPath) as! ExperienceCellForCV1
                cell.configurator = manager
                cell.set(manager.experience.experience[indexPath.row - 1])
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV1", for: indexPath) as! ExperienceCellForCV1
                cell.configurator = manager
                cell.set(manager.experience.projects[indexPath.row - 1])
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCellForCV1", for: indexPath) as! HobbyCellForCV1
                cell.configurator = manager
                cell.set(manager.experience.hobbies[indexPath.row - 1])
                return cell
            default: break
            }
        }
        return UITableViewCell()
    }
    
}
