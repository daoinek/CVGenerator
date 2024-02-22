//
//  TitleCellForCV1.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit


class TitleCellForCV1: UITableViewCell {
    
    static let height: CGFloat = 54
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var topConstr: NSLayoutConstraint!
    
    var configurator: CVManagerProtocol!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    
    func set(title: String, isLeft: Bool = false, uppercased: Bool = true) {
        UIViewExtensions.round(view: mainView, radius: 15)
        mainView.backgroundColor = isLeft ? .clear : configurator.cvColors[2]
        mainTitle.textColor = isLeft ? configurator.cvColors[2] : configurator.cvColors[0]
        
        mainTitle.textAlignment = isLeft ? .left : .center
        let title = uppercased ? title.localize().uppercased() : title.localize()
        mainTitle.text = title
    }

}
