//
//  DetailViewViewController.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit

class DetailViewViewController: UIViewController {

    fileprivate var item: ArcItem!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        setupUI()
        displayItem()
    }
    
    convenience init(with arcItem: ArcItem) {
        self.init(nibName: "DetailViewViewController", bundle: nil)
        self.item = arcItem
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
fileprivate extension DetailViewViewController {
    func setupUI() {
        collectionView.register(ArcMutipleImageCollectionViewCell.nib, forCellWithReuseIdentifier: ArcMutipleImageCollectionViewCell.registrableReuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        let collectionViewLayout =  UICollectionViewFlowLayout.init()
        collectionViewLayout.itemSize = CGSize(width: self.view.frame.size.width, height: 120)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 15
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func displayItem () {
        contentLabel.text = self.item.content
        if item.imgUrls != nil {
            collectionView.reloadData()
        } else {
            collectionView.isHidden = true
        }
    }
}



// MARK UICollectionViewDelegate, UICollectionViewDataSource
extension DetailViewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.imgUrls?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item < item.imgUrls?.count ?? 0  else { return .init() }
        let imageString = item.imgUrls![indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArcMutipleImageCollectionViewCell.registrableReuseIdentifier, for: indexPath) as? ArcMutipleImageCollectionViewCell else {
            return .init()
        }
        cell.setupImage(imageString)
        return cell
    }
    
}



