//
//  HobbyCellForCV1.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class HobbyCellForCV1: UITableViewCell {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var infoText: UILabel!
    
    var configurator: CVManagerProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    
    func set(_ model: UserHobbyForCV) {
        mainTitle.textColor = configurator.cvColors[0]
        infoText.textColor = configurator.cvColors[0]
        
        mainTitle.text = model.name
        infoText.text = model.aboutHobby
    }
    
    
    func setCV3Colors() {
        mainTitle.textColor = configurator.cvColors[3]
        infoText.textColor = configurator.cvColors[3]
        mainTitle.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        infoText.font = UIFont(name: "Montserrat-Regular", size: 15)
    }
    
    
    func setCV5() {
        mainTitle.font = UIFont(name: "Verdana Bold", size: 20)
        infoText.font = UIFont(name: "Verdana Regular", size: 15)
    }
    
    
    func setCV4() {
        mainTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        infoText.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

}
