//
//  ExperienceCellForCV1.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class ExperienceCellForCV1: UITableViewCell {
    
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
        self.setColors()
    }
    
    
    private func setColors() {
        self.companyTitle.textColor = configurator.cvColors[0]
        self.dateTitle.textColor = configurator.cvColors[0]
        self.locationTitle.textColor = configurator.cvColors[0]
        self.positionTitle.textColor = configurator.cvColors[0]
        self.infoTitle.textColor = configurator.cvColors[0]
    }
    
    
    func setCV2() {
        self.positionTitle.font = UIFont(name: "Poppins-Bold", size: 20)
        self.infoTitle.font = UIFont(name: "Poppins-Regular", size: 16)
        self.dateTitle.font = UIFont(name: "Poppins-Regular", size: 12)
        self.locationTitle.font = UIFont(name: "Poppins-Regular", size: 12)
        self.setCV2Colors()
    }
    
    
    func setCV4() {
        self.positionTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.infoTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.companyTitle.font = UIFont.italicSystemFont(ofSize: 18)
        self.dateTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.locationTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.setCV2Colors()
    }
    
    
    private func setCV2Colors() {
        self.locationTitle.textColor = configurator.cvColors[1]
        self.companyTitle.textColor = configurator.cvColors[0]
        self.dateTitle.textColor = configurator.cvColors[1]
        self.infoTitle.textColor = configurator.cvColors[1]
        self.positionTitle.textColor = configurator.cvColors[0]
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
