//
//  SkillCellForCV2.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class SkillCellForCV2: UITableViewCell {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var rateStack: UIStackView!

    var configurator: CVManagerProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    
    private func setUI() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    
    func set(_ model: UserSkillForCV, isCV4: Bool = false, isCV5: Bool = false) {
        rateStack.arrangedSubviews.forEach {
            $0.backgroundColor = configurator.cvColors[isCV4 ? 0 : 2]
            $0.alpha = 0.25
        }
                
        if isCV4 {  mainTitle.font = UIFont.systemFont(ofSize: 20, weight: .semibold) }
        mainTitle.text = model.title
        mainTitle.textColor = configurator.cvColors[isCV4 ? 0 : 2]
        
        if isCV5 {
            mainTitle.font = UIFont(name: "Verdana Bold", size: 20)
            mainTitle.textColor = configurator.cvColors[0]
        }

        
        for i in 0..<model.rate {
            rateStack.arrangedSubviews[i].alpha = 1
        }
    }

}
