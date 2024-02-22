//
//  Resume4.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class Resume4: UIView {

    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var surnameTitle: UILabel!
    @IBOutlet weak var positionTitle: UILabel!
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var mainTableView: UITableView!
    
    var manager: CVManagerProtocol!
    let localizator: CVLocalizatorProtocol = LocalizationForCV()

    func generate(_ callback: @escaping(Data?) -> Void) {
        self.frame = CGRect(x: 0, y: 0, width: 1240, height: 1754)
        UIViewExtensions.round(view: profileIMG, radius: 22)
        set(leftTableView)
        set(mainTableView)
        CellRegistrator.registrate(in: leftTableView, for: 4, isLeft: true)
        CellRegistrator.registrate(in: mainTableView, for: 4, isLeft: false)
        
        backgroundColor = manager.cvColors[3]
        nameTitle.textColor = manager.cvColors[0]
        surnameTitle.textColor = manager.cvColors[0]
        positionTitle.textColor = manager.cvColors[2]
        
        initContent()
        
        leftTableView.reloadData()
        mainTableView.reloadData()
        
        let data = generatePDFFromCurrentView()
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
    
    
    private func initContent() {
        self.nameTitle.text = manager.contacts.contacts.firstName
        self.surnameTitle.text = manager.contacts.contacts.secondName
        self.positionTitle.text = manager.contacts.contacts.positionInCompany
        self.profileIMG.image = manager.contacts.contacts.profilePhoto ?? UIImage(named: "profilePhotoTemplate")
    }
    
    
    private func getTitle(for section: Int, isLeft: Bool) -> String {
        switch section {
        case 0: return isLeft ? "Profile" : "Experience"
        case 1: return isLeft ? "Contacts" : "Education"
        case 2: return isLeft ? "Skills" : "Projects"
        case 3: return isLeft ? "Software" : "Hobbies"
        case 4: return isLeft ? "Languages" : ""
        default: return ""
        }
    }

}


extension Resume4: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (tableView == leftTableView) ? 5 : 4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView { return getCellCount(for: section) }
        switch section {
        case 0: return manager.experience.experience.count + 1
        case 1: return manager.experience.education.count + 1
        case 2: return manager.experience.projects.count + 1
        case 3: return manager.experience.hobbies.count + 1
        default: return 0
        }
    }
    
    
    private func getCellCount(for section: Int) -> Int {
        switch section {
        case 0,1: return 2
        case 2: return manager.skills.skills.count + 1
        case 3: return manager.skills.software.count + 1
        case 4: return manager.skills.languages.count + 1
        default: return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 72 }
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellForCV4", for: indexPath) as! TitleCellForCV4
            cell.mainTitle.text = localizator.localizeFor(getTitle(for: indexPath.section,
                                                                   isLeft: (tableView == leftTableView))).localize()
            return cell
        }
        
        
        if tableView == leftTableView { return getLeftCell(for: tableView, indexPath: indexPath) }
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV1", for: indexPath) as! ExperienceCellForCV1
            cell.setCV4()
            cell.set(manager.experience.experience[indexPath.row - 1])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV1", for: indexPath) as! ExperienceCellForCV1
            cell.setCV4()
            cell.set(manager.experience.education[indexPath.row - 1])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCellForCV2", for: indexPath) as! ExperienceCellForCV2
            cell.set(manager.experience.projects[indexPath.row - 1])
            cell.updateColorForResume2()
            cell.setCV4Fonts()
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCellForCV1", for: indexPath) as! HobbyCellForCV1
            cell.set(manager.experience.hobbies[indexPath.row - 1])
            cell.setCV4()
            return cell
        default: return UITableViewCell()
        }
    }
    
    
    private func getLeftCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCellForCV1", for: indexPath) as! TextCellForCV1
            cell.mainTitle.font = UIFont.systemFont(ofSize: 14)
            cell.mainTitle.textColor = manager.cvColors[0]
            cell.mainTitle.text = manager.contacts.contacts.personDescription
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsForCV4", for: indexPath) as! ContactsForCV4
            cell.set(manager.contacts.contacts)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
            cell.set(manager.skills.skills[indexPath.row - 1], isCV4: true)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
            cell.set(manager.skills.software[indexPath.row - 1], isCV4: true)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCellForCV2", for: indexPath) as! SkillCellForCV2
            cell.set(manager.skills.languages[indexPath.row - 1], isCV4: true)
            return cell
        default: break
        }
        return UITableViewCell()
    }
    
}


extension String {
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    
    func underline() -> NSMutableAttributedString {
        let attr: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Poppins-Regular", size: 13)!,
                                                   .foregroundColor: UIColor.darkGray.cgColor,
                                                   .underlineStyle: NSUnderlineStyle.single.rawValue]
        return NSMutableAttributedString(string: self, attributes: attr)
    }
}
