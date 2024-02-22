//
//  SkillView6.swift
//  CVPro
//
//

import UIKit


class SkillView6: UIView {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var stackItems: UIStackView!
    
    var configurator: CVManagerProtocol!
    
    func config(for model: UserSkillForCV) {
        stackItems.arrangedSubviews.forEach {
            $0.backgroundColor = configurator.cvColors[2]
            $0.alpha = 0.3
        }
        
        mainTitle.text = model.title
        mainTitle.textColor = configurator.cvColors[0]
        for i in 0..<model.rate {
            stackItems.arrangedSubviews[i].alpha = 1
        }
    }

}
