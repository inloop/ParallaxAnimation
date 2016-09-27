//
//  VerticalCVC.swift
//  parallax-animation
//
//  Created by Martin Prusa on 22/09/2016.
//  Copyright © 2016 Martin Prusa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "vertical"

class VerticalCVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView!.register(ParallaxBaseCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.collectionViewLayout = ParallaxBaseFlowLayout.init(direction: .vertical, itemSize: CGSize.init(width: collectionView!.frame.width, height: 180))
    }



    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: UICollectionViewDataSource
extension VerticalCVC {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }



    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ParallaxBaseCell

        if let img = UIImage.init(named: "vertical-\(indexPath.row)") {
            cell.image = img
        }

        return cell
    }
}
