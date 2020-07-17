//
//  ArcTextTableViewCell.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit

class ArcTextTableViewCell: UITableViewCell {

    
    static var nib: UINib? {
        return UINib(nibName: "ArcTextTableViewCell", bundle: nil)
    }
    
    static var registrableReuseIdentifier: String {
        return "ArcTextTableViewCell"
    }
    
    @IBOutlet weak var contentLabel: UILabel!
    
    func configCell(with item: ArcItem) {
        contentLabel.text = item.content
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
