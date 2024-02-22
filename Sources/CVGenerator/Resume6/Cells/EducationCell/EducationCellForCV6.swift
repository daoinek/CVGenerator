//
//  EducationCellForCV6.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit

class EducationCellForCV6: UITableViewCell {

    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var positionTitle: UILabel!
    @IBOutlet weak var infoTitle: UILabel!

    var configurator: CVManagerProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        setDefaultUI()
        updateColor()
    }
    
    
    private func setDefaultUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    
    private func updateColor() {
        infoTitle.textColor = configurator.cvColors[1]
        dateTitle.textColor = configurator.cvColors[0]
        
        companyTitle.textColor = configurator.cvColors[0]
        positionTitle.textColor = configurator.cvColors[0]
        
        locationTitle.textColor = configurator.cvColors[0]
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
        locationTitle.isHidden = true
        dateTitle.isHidden = (model.educationPeriod == nil)
        companyTitle.isHidden = (model.universityTitle == nil)
        infoTitle.isHidden = (model.description == nil)
        positionTitle.isHidden = (model.diplomaName == nil)

        dateTitle.text = model.educationPeriod
        companyTitle.text = model.universityTitle
        positionTitle.text = model.diplomaName
        infoTitle.text = model.description
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
