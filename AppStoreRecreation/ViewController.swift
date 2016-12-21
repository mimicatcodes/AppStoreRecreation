//
//  ViewController.swift
//  AppStoreRecreation
//
//  Created by Mirim An on 12/21/16.
//  Copyright © 2016 Mimicatcodes. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        
        // Register cell class
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId , for: indexPath) as! CategoryCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }



}

class CategoryCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        backgroundColor = UIColor.red
        
    }
}

