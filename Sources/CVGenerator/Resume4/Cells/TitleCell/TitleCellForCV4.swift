//
//  TitleCellForCV4.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class TitleCellForCV4: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainTitle: UILabel!
    
    var configurator: CVManagerProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        UIViewExtensions.round(view: mainView, radius: 5)
        mainView.backgroundColor = configurator.cvColors[2]
        mainTitle.textColor = configurator.cvColors[3]
    }
 

}
