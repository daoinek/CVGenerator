//
//  Resume5.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class Resume5: UIView {

    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var surnameTitle: UILabel!
    @IBOutlet weak var positionTitle: UILabel!
    @IBOutlet weak var positionLineView: UIView!
    
    @IBOutlet weak var contactStack: UIStackView!
    @IBOutlet weak var emailStack: UIStackView!
    @IBOutlet weak var phoneStack: UIStackView!
    @IBOutlet weak var geoStack: UIStackView!
    @IBOutlet weak var linkStack: UIStackView!
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var mainTableView: UITableView!
    
    var manager: CVManagerProtocol!
    let localizator: CVLocalizatorProtocol = LocalizationForCV()

    func generate(_ callback: @escaping(Data?) -> Void) {
        self.frame = CGRect(x: 0, y: 0, width: 1240, height: 1754)
        set(leftTableView)
        set(mainTableView)
        backgroundColor = manager.cvColors[3]
        CellRegistrator.registrate(in: leftTableView, for: 5, isLeft: true)
        CellRegistrator.registrate(in: mainTableView, for: 5, isLeft: false)
        setColors()
        configStacks()
        initContent()
        
        mainTableView.reloadData()
        leftTableView.reloadData()
        
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
        nameTitle.textColor = manager.cvColors[2]
        surnameTitle.textColor = manager.cvColors[2]
        positionTitle.textColor = manager.cvColors[0]
        positionLineView.backgroundColor = manager.cvColors[2]
    }
    
    
    private func configStacks() {
        configureContactStack(emailStack)
        configureContactStack(phoneStack)
        configureContactStack(linkStack)
        configureContactStack(geoStack)
    }
    
    
    private func configureContactStack(_ stack: UIStackView) {
        stack.arrangedSubviews.forEach {
            if $0.tag == 1 {
                $0.backgroundColor = manager.cvColors[2]
                UIViewExtensions.round(view: $0, radius: 13)
            }
            if $0.tag == 2 { ($0 as? UILabel)?.textColor = manager.cvColors[0] }
        }
    }
    
    
    private func initContent() {
        self.nameTitle.text = manager.contacts.contacts.firstName
        self.surnameTitle.text = manager.contacts.contacts.secondName
        self.positionTitle.text = manager.contacts.contacts.positionInCompany
        
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
    
    
    private func getTitle(for section: Int, isLeft: Bool) -> String {
        switch section {
        case 0: return isLeft ? "Profile" : "Experience"
        case 1: return isLeft ? "Skills" : "Projects"
        case 2: return isLeft ? "Languages" : "Education"
        case 3: return isLeft ? "Software" : "Hobbies"
        default: return ""
        }
    }

}


extension Resume5: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView { return getCell(for: section) }
        switch section {
        case 0: return manager.experience.experience.count + 1
        case 1: return manager.experience.projects.count + 1
        case 2: return manager.experience.education.count + 1
        case 3: return manager.experience.hobbies.count + 1
        default: return 0
        }
    }
    
    
    private func getCell(for section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return manager.skills.skills.count + 1
        case 2: return manager.skills.languages.count + 1
        case 3: return manager.skills.software.count + 1
        default: return 0
        }
    }
 
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView { return cell(for: tableView, indexPath: indexPath) }
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellForCV5", for: indexPath) as! TitleCellForCV5
            cell.titleView.backgroundColor = manager.cvColors[2].withAlphaComponent(0.3)
            cell.mainTitle.textColor = manager.cvColors[2]
            cell.mainTitle.text = localizator.localizeFor(getTitle(for: indexPath.section, isLeft: false))
            return cell
        default:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV2", for: indexPath) as! ExperienceCellForCV2
                cell.set(manager.experience.experience[indexPath.row - 1])
                cell.updateColorForResume2()
                cell.setCV5Fonts()
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV2", for: indexPath) as! ExperienceCellForCV2
                cell.set(manager.experience.projects[indexPath.row - 1])
                cell.updateColorForResume2()
                cell.setCV5Fonts()
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV2", for: indexPath) as! ExperienceCellForCV2
                cell.set(manager.experience.education[indexPath.row - 1])
                cell.updateColorForResume2()
                cell.setCV5Fonts()
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCellForCV1", for: indexPath) as! HobbyCellForCV1
                cell.set(manager.experience.hobbies[indexPath.row - 1])
                cell.setCV5()
                return cell
            default: return UITableViewCell()
            }
        }
    }
    
    
    private func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellForCV5", for: indexPath) as! TitleCellForCV5
            cell.titleView.backgroundColor = manager.cvColors[2].withAlphaComponent(0.3)
            cell.mainTitle.textColor = manager.cvColors[2]
            cell.mainTitle.text = localizator.localizeFor(getTitle(for: indexPath.section, isLeft: true))
            return cell
        default:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCellForCV1", for: indexPath) as! TextCellForCV1
                cell.mainTitle.textColor = manager.cvColors[0]
                cell.mainTitle.text = manager.contacts.contacts.personDescription
                cell.mainTitle.font = UIFont(name: "Verdana Regular", size: 15)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
                cell.set(manager.skills.skills[indexPath.row - 1], isCV5: true)
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
                cell.set(manager.skills.languages[indexPath.row - 1], isCV5: true)
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
                cell.set(manager.skills.software[indexPath.row - 1], isCV5: true)
                return cell
            default: return UITableViewCell()
            }
        }
    }
    
    
}
