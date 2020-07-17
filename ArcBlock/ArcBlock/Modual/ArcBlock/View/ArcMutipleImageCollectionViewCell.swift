//
//  ArcMutipleImageCollectionViewCell.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit

class ArcMutipleImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    static var nib: UINib? {
        return UINib(nibName: "ArcMutipleImageCollectionViewCell", bundle: nil)
    }
    
    static var registrableReuseIdentifier: String {
        return "ArcMutipleImageCollectionViewCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupImage(_ image: String) {
        contentImageView.setImage(with: image)
    }

}
