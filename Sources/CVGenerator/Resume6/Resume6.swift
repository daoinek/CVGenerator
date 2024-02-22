//
//  Resume6.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class Resume6: UIView {
    
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var contactStack: UIStackView!
    @IBOutlet weak var emailStack: UIStackView!
    @IBOutlet weak var phoneStack: UIStackView!
    @IBOutlet weak var geoStack: UIStackView!
    @IBOutlet weak var linkStack: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    var manager: CVManagerProtocol!
    let localizator: CVLocalizatorProtocol = LocalizationForCV()
    
    func generate(_ callback: @escaping(Data?) -> Void) {
        self.frame = CGRect(x: 0, y: 0, width: 1240, height: 1754)
        self.set(tableView)
        
        CellRegistrator.registrate(in: tableView, for: 6, isLeft: true)
        setColors()
        initContent()
        tableView.reloadData()
    
        let data = self.generatePDFFromCurrentView()
        callback(data)
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
        configStacks()
    }
    
    
    private func configStacks() {
        configureContactStack(emailStack)
        configureContactStack(phoneStack)
        configureContactStack(linkStack)
        configureContactStack(geoStack)
    }
    
    
    private func configureContactStack(_ stack: UIStackView) {
        stack.arrangedSubviews.forEach {
            if $0.tag == 2 { ($0 as? UILabel)?.textColor = manager.cvColors[0] }
        }
    }
    
    
    private func initContent() {
        self.nameTitle.text = "\(manager.contacts.contacts.firstName ?? "") \(manager.contacts.contacts.secondName ?? "")"
        
        emailStack.isHidden = (manager.contacts.contacts.email == nil)
        phoneStack.isHidden = (manager.contacts.contacts.phone == nil)
        linkStack.isHidden = (manager.contacts.contacts.link == nil)
        geoStack.isHidden = (manager.contacts.contacts.personLocation == nil)

        emailStack.arrangedSubviews.forEach {
            if $0.tag == 2 { ($0 as? UILabel)?.text = manager.contacts.contacts.email }
        }
        phoneStack.arrangedSubviews.forEach {
            if $0.tag == 2 { ($0 as? UILabel)?.text = manager.contacts.contacts.phone }
        }
        linkStack.arrangedSubviews.forEach {
            if $0.tag == 2 { ($0 as? UILabel)?.text = manager.contacts.contacts.link }
        }
        geoStack.arrangedSubviews.forEach {
            if $0.tag == 2 { ($0 as? UILabel)?.text = manager.contacts.contacts.personLocation }
        }
    }
    
    
    private func getTitle(for section: Int) -> String {
        switch section {
        case 0: return "Profile"
        case 1: return "Education"
        case 2: return "Experience"
        case 3: return "Projects"
        case 5: return "Hobbies"
        default: return ""
        }
    }

}


extension Resume6: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return manager.experience.education.count + 1
        case 2: return manager.experience.experience.count + 1
        case 3: return manager.experience.projects.count + 1
        case 4: return 1
        case 5: return manager.experience.hobbies.count + 1
        default: return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 4 { return UITableView.automaticDimension }
        
        switch indexPath.row {
        case 0: return 80
        default: return UITableView.automaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV6", for: indexPath) as! SkillCellForCV6
            cell.configurator = manager
            cell.set(skills: manager.skills.skills, software: manager.skills.software, languages: manager.skills.languages)
            return cell
        }
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellForCV5", for: indexPath) as! TitleCellForCV5
            cell.titleView.backgroundColor = manager.cvColors[2].withAlphaComponent(0.3)
            cell.mainTitle.textColor = manager.cvColors[2]
            cell.mainTitle.text = localizator.localizeFor(getTitle(for: indexPath.section))
            cell.mainTitle.font = UIFont(name: "Georgia Bold", size: 32.0)
        default:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCellForCV1", for: indexPath) as! TextCellForCV1
                cell.mainTitle.textColor = manager.cvColors[0]
                cell.mainTitle.text = manager.contacts.contacts.personDescription
                cell.mainTitle.font = UIFont(name: "Helvetica", size: 16)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "EducationCellForCV6", for: indexPath) as! EducationCellForCV6
                cell.configurator = manager
                cell.set(manager.experience.education[indexPath.row - 1])
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "EducationCellForCV6", for: indexPath) as! EducationCellForCV6
                cell.configurator = manager
                cell.set(manager.experience.experience[indexPath.row - 1])
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "EducationCellForCV6", for: indexPath) as! EducationCellForCV6
                cell.configurator = manager
                cell.set(manager.experience.projects[indexPath.row - 1])
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV6", for: indexPath) as! SkillCellForCV6
                cell.configurator = manager
                cell.set(skills: manager.skills.skills, software: manager.skills.software, languages: manager.skills.languages)
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCellForCV1", for: indexPath) as! HobbyCellForCV1
                cell.configurator = manager
                cell.set(manager.experience.hobbies[indexPath.row - 1])
                cell.mainTitle.font = UIFont(name: "Helvetica Bold", size: 24)
                cell.infoText.font = UIFont(name: "Helvetica", size: 16)
                return cell
            default: break
            }
        }
        return UITableViewCell()
    }
    
}
