//
//  HorizontalCVC.swift
//  parallax-animation
//
//  Created by Martin Prusa on 22/09/2016.
//  Copyright © 2016 Martin Prusa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "horizontal"

class HorizontalCVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView!.register(ParallaxBaseCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.isPagingEnabled = true
        collectionView!.collectionViewLayout = ParallaxBaseFlowLayout.init(direction: .horizontal, itemSize: CGSize.init(width: collectionView!.frame.width, height: collectionView!.frame.height))
    }



    override var prefersStatusBarHidden: Bool {
        return true
    }

}

// MARK: UICollectionViewDataSource
extension HorizontalCVC {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }



    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ParallaxBaseCell

        if let img = UIImage.init(named: "horizontal-\(indexPath.row)") {
            cell.image = img
        }

        return cell
    }
}
