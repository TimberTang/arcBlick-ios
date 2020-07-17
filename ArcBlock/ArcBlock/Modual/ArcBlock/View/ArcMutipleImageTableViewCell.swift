//
//  ArcMutipleImageTableViewCell.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit

class ArcMutipleImageTableViewCell: UITableViewCell {

    private var urls: [String] = .init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }
    

    private func setupCollectionView() {
        collectionView.register(ArcMutipleImageCollectionViewCell.nib, forCellWithReuseIdentifier: ArcMutipleImageCollectionViewCell.registrableReuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
//        let padding: CGFloat = 15
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        collectionView.delegate = self
        collectionView.dataSource = self
        let collectionViewLayout =  UICollectionViewFlowLayout.init()
        collectionViewLayout.itemSize = CGSize(width: 128, height: 160)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 15
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func config(cell item: ArcItem) {
        contentLabel.text = item.content
        urls = item.imgUrls ?? []
        collectionView.reloadData()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    static var nib: UINib? {
        return UINib(nibName: "ArcMutipleImageTableViewCell", bundle: nil)
    }
    
    static var registrableReuseIdentifier: String {
        return "ArcMutipleImageTableViewCell"
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension ArcMutipleImageTableViewCell {
    func config(with list: [String]) {
        urls = list
        collectionView.reloadData()
    }
}

// MARK UICollectionViewDelegate, UICollectionViewDataSource
extension ArcMutipleImageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item < urls.count  else { return .init() }
        let imageString = urls[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArcMutipleImageCollectionViewCell.registrableReuseIdentifier, for: indexPath) as? ArcMutipleImageCollectionViewCell else {
            return .init()
        }
        cell.setupImage(imageString)
        return cell
    }
    
}


