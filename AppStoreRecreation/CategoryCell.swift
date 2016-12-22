//
//  CategoryCell.swift
//  AppStoreRecreation
//
//  Created by Luna An on 12/21/16.
//  Copyright © 2016 Mimicatcodes. All rights reserved.
//

import Foundation
import UIKit
 
class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "appCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Initialize a collection view
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let dividerLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpViews(){
        backgroundColor = UIColor.clear
        
        // Add the collection view 
        addSubview(nameLabel)
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: [], metrics: nil, views: ["v0":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: [], metrics: nil, views: ["v0":dividerLineView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: [], metrics: nil, views: ["v0":appsCollectionView, "v1":dividerLineView, "nameLabel":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":appsCollectionView]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 30)
        // frame property is available in cell
        // minused 30 due to the name label above
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}

class AppCell:UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView:UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "luna_icon")
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 16
        imgView.layer.masksToBounds = true

        return imgView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Luna, the Lunar Calendar"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Lifestyle"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$2.99"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    func setUpViews(){
        //backgroundColor = UIColor.black
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width) // 1:1 ratio for an icon
        titleLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
    }
    
}
