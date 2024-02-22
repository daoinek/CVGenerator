//
//  TitleCellForCV5.swift
//  Using Swift 5
//
//  Created for CVPro on 05.02.2024.
//

import UIKit

class TitleCellForCV5: UITableViewCell {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var titleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }

}
