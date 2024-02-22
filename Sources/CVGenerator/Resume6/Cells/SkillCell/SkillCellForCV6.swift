//
//  SkillCellForCV6.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


enum ScoreCategoryType {
    case skillScore
    case skillSoftware
    case skillLanguages
}

class SkillCellForCV6: UITableViewCell {
    
    @IBOutlet weak var skillStack: UIStackView!
    @IBOutlet weak var softwareStack: UIStackView!
    @IBOutlet weak var languagesStack: UIStackView!
    
    @IBOutlet weak var skillTitle: UILabel!
    @IBOutlet weak var skillLine: UIView!
    
    @IBOutlet weak var softwareTitle: UILabel!
    @IBOutlet weak var softwareLine: UIView!
    
    @IBOutlet weak var langTitle: UILabel!
    @IBOutlet weak var langLine: UIView!
    
    private var localizator: CVLocalizatorProtocol = LocalizationForCV()
    var configurator: CVManagerProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.configureColorsForTitles()
        self.configureColorsForLines()
        self.softwareTitle.text = localizator.localizeFor("Software")
        self.skillTitle.text = localizator.localizeFor("Skills")
        self.langTitle.text = localizator.localizeFor("Languages")
    }
    
    
    private func configureColorsForTitles() {
        skillTitle.textColor = configurator.cvColors[2]
        langTitle.textColor = configurator.cvColors[2]
        softwareTitle.textColor = configurator.cvColors[2]
    }
    
    
    private func configureColorsForLines() {
        softwareLine.backgroundColor = configurator.cvColors[2]
        skillLine.backgroundColor = configurator.cvColors[2]
        langLine.backgroundColor = configurator.cvColors[2]
    }
    
    
    func set(skills: [UserSkillForCV], software: [UserSkillForCV], languages: [UserSkillForCV]) {
        if skillStack.arrangedSubviews.count > 1 {
            for i in 0..<skillStack.arrangedSubviews.count {
                let view = skillStack.arrangedSubviews[i]
                skillStack.removeAllSubviewsFrom(view: view)
            }
        }
        for score in skills {
            let skill = SkillView6().fromXib() as! SkillView6
            skill.config(for: score)
            skillStack.addArrangedSubview(skill)
        }
        
        
        if softwareStack.arrangedSubviews.count > 1 {
            for i in 0..<softwareStack.arrangedSubviews.count {
                let view = softwareStack.arrangedSubviews[i]
                softwareStack.removeAllSubviewsFrom(view: view)
            }
        }
        for score in software {
            let skill = SkillView6().fromXib() as! SkillView6
            skill.config(for: score)
            softwareStack.addArrangedSubview(skill)
        }
        
        if languagesStack.arrangedSubviews.count > 1 {
            for i in 0..<languagesStack.arrangedSubviews.count {
                let view = languagesStack.arrangedSubviews[i]
                languagesStack.removeAllSubviewsFrom(view: view)
            }
        }
        for score in languages {
            let skill = SkillView6().fromXib() as! SkillView6
            skill.config(for: score)
            languagesStack.addArrangedSubview(skill)
        }
        
        self.layoutIfNeeded()
    }

}


extension UIStackView {
    
    func removeAllSubviewsFrom(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
}
