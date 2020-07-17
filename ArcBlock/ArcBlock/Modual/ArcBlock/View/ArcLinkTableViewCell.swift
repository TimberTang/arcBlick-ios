//
//  ArcLinkTableViewCell.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit
import ActiveLabel

class ArcLinkTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        linkLabel.handleURLTap { [weak self] (url) in
            guard let self = self else { return }
            self.jumpToWeb(url.absoluteString)
        }
    }
    
    func jumpToWeb(_ link: String) {
        let webVC = WebViewViewController(link, webTitle: "")
        topViewController?.navigationController?.pushViewController(webVC, animated: true)
    }
    
    static var nib: UINib? {
        return UINib(nibName: "ArcLinkTableViewCell", bundle: nil)
    }
    
    static var registrableReuseIdentifier: String {
        return "ArcLinkTableViewCell"
    }
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var linkLabel: ActiveLabel!
    
    func configCell(with item: ArcItem) {
        contentLabel.text = item.content
        linkLabel.text = item.link
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
