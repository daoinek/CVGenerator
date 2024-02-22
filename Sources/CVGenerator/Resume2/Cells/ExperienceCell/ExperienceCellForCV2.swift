//
//  ExperienceCellForCV2.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class ExperienceCellForCV2: UITableViewCell {
    
    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var positionTitle: UILabel!
    @IBOutlet weak var infoTitle: UILabel!

    var configurator: CVManagerProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    
    func updateColorForResume2() {
        updateColor(dateTitle, color: configurator.cvColors[1])
        updateColor(locationTitle, color: configurator.cvColors[1])
        
        updateColor(companyTitle, color: configurator.cvColors[0])
        updateColor(positionTitle, color: configurator.cvColors[0])
        updateColor(infoTitle, color: configurator.cvColors[0])
    }
    
    
    private func updateColor(_ label: UILabel, color: UIColor) {
        label.textColor = color
    }
    
    
    func setCV4Fonts() {
        companyTitle.font = UIFont.italicSystemFont(ofSize: 18)
        positionTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        infoTitle.font = UIFont.systemFont(ofSize: 15)
        dateTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        locationTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    
    func setCV3Fonts() {
        companyTitle.font = UIFont(name: "Montserrat-Medium", size: 16)
        positionTitle.font = UIFont(name: "Montserrat-Bold", size: 20)
        infoTitle.font = UIFont.systemFont(ofSize: 15)
        dateTitle.font = UIFont(name: "Montserrat-Regular", size: 12)
        locationTitle.font = UIFont(name: "Montserrat-Regular", size: 12)
    }
    
    
    func setCV5Fonts() {
        companyTitle.font = UIFont(name: "Verdana Bold", size: 16)
        positionTitle.font = UIFont(name: "Verdana Bold Italic", size: 20)
        infoTitle.font = UIFont(name: "Verdana Regular", size: 15)
        dateTitle.font = UIFont(name: "Verdana Regular", size: 14)
        locationTitle.font = UIFont(name: "Verdana Regular", size: 14)
    }
    
    
    
    func set(_ model: UserExperienceForCV) {
        dateTitle.isHidden = (model.workPeriod == nil)
        locationTitle.isHidden = (model.workGeo == nil)

        dateTitle.text = model.workPeriod
        locationTitle.text = model.workGeo
        positionTitle.text = model.positionInCompany ?? "Hidden position"
        companyTitle.text = model.companyName ?? "Hidden company"
        infoTitle.text = model.workDetals
    }
    
    
    func set(_ model: UserEducationForCV) {
        companyTitle.isHidden = true
        locationTitle.isHidden = true
        dateTitle.isHidden = (model.educationPeriod == nil)
        
        var text = model.universityTitle ?? ""
        if let description = model.description { text += "\n\n\(description)" }
        
        dateTitle.text = model.educationPeriod
        positionTitle.text = model.diplomaName
        infoTitle.text = text
    }
    
    
    func set(_ model: ProjectInfoForCV) {
        companyTitle.isHidden = true
        locationTitle.isHidden = true
        dateTitle.isHidden = (model.date == nil)
        
        var text = model.description ?? ""
        if let link = model.link { text += "\n\n\(link)" }
        
        dateTitle.text = model.date
        positionTitle.text = model.name ?? "Hidden name"
        infoTitle.text = text
        
    }

}
