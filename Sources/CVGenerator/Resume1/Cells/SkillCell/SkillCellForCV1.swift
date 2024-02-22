//
//  SkillCellForCV1.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class SkillCellForCV1: UITableViewCell {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var valueCNSTR: NSLayoutConstraint!
    
    var configurator: CVManagerProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        defaultParams()
        UIViewExtensions.round(view: mainView, radius: 5)
        UIViewExtensions.round(view: lineView, radius: 5)
    }
    
    
    private func defaultParams() {
        contentView.backgroundColor = .clear
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    
    func set(_ model: UserSkillForCV) {
        mainTitle.textColor = configurator.cvColors[0]
        lineView.backgroundColor = configurator.cvColors[2]
        mainTitle.text = model.title
        
        let fullWidth = mainView.frame.width
        let score = (model.rate * 2)
        let finalValue = 10 - score
        let procents = Float(finalValue) / 10.0
        valueCNSTR.constant = fullWidth * CGFloat(procents)
        lineView.layoutIfNeeded()
    }
    
    
    func setCV3Colors() {
        mainTitle.textColor = configurator.cvColors[3]
        lineView.backgroundColor = configurator.cvColors[2]
        mainTitle.font = UIFont(name: "Montserrat-SemiBold", size: 20)
    }

}
