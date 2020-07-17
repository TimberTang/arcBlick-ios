//
//  ArcImageTableViewCell.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit

class ArcImageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var nib: UINib? {
        return UINib(nibName: "ArcImageTableViewCell", bundle: nil)
    }
    
    static var registrableReuseIdentifier: String {
        return "ArcImageTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
