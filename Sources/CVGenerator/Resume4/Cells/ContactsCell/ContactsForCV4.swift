//
//  ContactsForCV4.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class ContactsForCV4: UITableViewCell {
    
    @IBOutlet weak var mainStack: UIStackView!
    
    @IBOutlet weak var emailStack: UIStackView!
    @IBOutlet weak var phoneStack: UIStackView!
    @IBOutlet weak var locationStack: UIStackView!
    @IBOutlet weak var linkStack: UIStackView!
    
    @IBOutlet weak var emailTitle: UILabel!
    @IBOutlet weak var phoneTitle: UILabel!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var linkTitle: UILabel!
    
    var configurator: CVManagerProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        defaultUI()
        mainStack.arrangedSubviews.forEach {
            $0.viewWithTag(1)?.backgroundColor = .clear
        }
    }
    
    
    private func defaultUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    
    func set(_ model: UserContactsForCV) {
        emailTitle.textColor = configurator.cvColors[0]
        phoneTitle.textColor = configurator.cvColors[0]
        locationTitle.textColor = configurator.cvColors[0]
        linkTitle.textColor = configurator.cvColors[0]
        
        emailStack.isHidden = (model.email == nil)
        phoneStack.isHidden = (model.phone == nil)
        locationStack.isHidden = (model.personLocation == nil)
        linkStack.isHidden = (model.link == nil)
        
        emailTitle.text = model.email
        phoneTitle.text = model.phone
        locationTitle.text = model.personLocation
        linkTitle.text = model.link
    }

}
