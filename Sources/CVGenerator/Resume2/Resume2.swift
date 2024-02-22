//
//  Resume2.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class Resume2: UIView {
    
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var positionTitle: UILabel!
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
        UIViewExtensions.round(view: profileIMG, radius: 159)
        setUI()
        leftTableView.reloadData()
        mainTableView.reloadData()
        let data = self.generatePDFFromCurrentView()
        callback(data)
    }
    
    
    private func setUI() {
        set(leftTableView)
        set(mainTableView)
        CellRegistrator.registrate(in: leftTableView, for: 2, isLeft: true)
        CellRegistrator.registrate(in: mainTableView, for: 2, isLeft: false)
        setColors()
        initContent()
    }
    
    
    private func generateString(weight: String = "random") -> String {
        return ""
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
        nameTitle.textColor = manager.cvColors[0]
        positionTitle.textColor = manager.cvColors[2]
        
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
        self.nameTitle.text = "\(manager.contacts.contacts.firstName ?? "") \(manager.contacts.contacts.secondName ?? "")"
        self.positionTitle.text = manager.contacts.contacts.positionInCompany
        self.profileIMG.image = manager.contacts.contacts.profilePhoto ?? UIImage(named: "profilePhotoTemplate")
        
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
        case 0: return isLeft ? "Skills" : "Profile"
        case 1: return isLeft ? "Languages" : "Education"
        case 2: return isLeft ? "Software" : "Experience"
        case 3: return isLeft ? "Hobbies" : "Projects"
        default: return ""
        }
    }
    
}


extension Resume2: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainTableView { return getLeftRowsCount(for: section) }
        return getRightRowsCount(for: section)
    }
    
    
    private func getLeftRowsCount(for section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return manager.experience.education.count + 1
        case 2: return manager.experience.experience.count + 1
        case 3: return manager.experience.projects.count + 1
        default: return 0
        }
    }
    
    
    private func getRightRowsCount(for section: Int) -> Int {
        switch section {
        case 0: return manager.skills.skills.count + 1
        case 1: return manager.skills.languages.count + 1
        case 2: return manager.skills.software.count + 1
        case 3: return manager.experience.hobbies.count + 1
        default: return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return TitleCellForCV1.height + 32 }
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellForCV1", for: indexPath) as! TitleCellForCV1
            cell.configurator = manager
            cell.set(title: localizator.localizeFor(getTitle(for: indexPath.section, isLeft: (tableView == leftTableView))),
                     isLeft: true, uppercased: false)
            cell.mainTitle.font = UIFont(name: "Poppins-Bold", size: 36)
            return cell
        }
        return (tableView == leftTableView) ?
        getLeftCells(for: tableView, indexPath: indexPath) : getMainCells(for: tableView, indexPath: indexPath)
    }
    
    
    private func getLeftCells(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
            cell.configurator = manager
            cell.set(manager.skills.skills[indexPath.row - 1])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
            cell.configurator = manager
            cell.set(manager.skills.languages[indexPath.row - 1])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
            cell.configurator = manager
            cell.set(manager.skills.software[indexPath.row - 1])
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCellForCV1", for: indexPath) as! HobbyCellForCV1
            cell.configurator = manager
            cell.set(manager.experience.hobbies[indexPath.row - 1])
            return cell
        default: break
        }
        return UITableViewCell()
    }
    
    
    private func getMainCells(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCellForCV1", for: indexPath) as! TextCellForCV1
            cell.mainTitle.font = UIFont(name: "Poppins-Regular", size: 16)
            cell.mainTitle.textColor = manager.cvColors[0]
            cell.mainTitle.text = manager.contacts.contacts.personDescription
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV1", for: indexPath) as! ExperienceCellForCV1
            cell.configurator = manager
            cell.setCV2()
            cell.set(manager.experience.education[indexPath.row - 1])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV2", for: indexPath) as! ExperienceCellForCV2
            cell.configurator = manager
            cell.updateColorForResume2()
            cell.set(manager.experience.experience[indexPath.row - 1])
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV2", for: indexPath) as! ExperienceCellForCV2
            cell.configurator = manager
            cell.updateColorForResume2()
            cell.set(manager.experience.projects[indexPath.row - 1])
            return cell
        default: break
        }
        return UITableViewCell()
    }

    
}



