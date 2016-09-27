//
//  ParallaxBaseFlowLayout.swift
//  parallax-animation
//
//  Created by Martin Prusa on 22/09/2016.
//  Copyright © 2016 Martin Prusa. All rights reserved.
//

import UIKit

class ParallaxBaseFlowLayout: UICollectionViewFlowLayout {
    
    override class var layoutAttributesClass: AnyClass {
        get {
            return ParallaxLayoutAttributes.classForCoder()
        }
    }
    
    
    convenience init(direction: UICollectionViewScrollDirection, itemSize: CGSize?) {
        self.init()
        
        if let size = itemSize {
            self.itemSize = size
        }

        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = direction
    }



    override init() {
        super.init()
    }



    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ParallaxBaseFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }



    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attrs:[ParallaxLayoutAttributes]? = super.layoutAttributesForElements(in: rect) as? [ParallaxLayoutAttributes]
        
        if let attrsNotNil = attrs {
            for attributes: ParallaxLayoutAttributes in attrsNotNil {
                update(attributes: attributes)
            }
        }
        
        return attrs
    }



    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs:ParallaxLayoutAttributes? = super.layoutAttributesForItem(at: indexPath) as? ParallaxLayoutAttributes
        
        if let attrsNotNil = attrs {
            update(attributes: attrsNotNil)
        }
        
        return attrs
    }



    private func update(attributes: ParallaxLayoutAttributes) {
        attributes.parallaxValue = parallaxValue(forAttributes: attributes, direction: scrollDirection)
        attributes.parallaxDirection = scrollDirection
        attributes.parallaxPagingEnabled = collectionView!.isPagingEnabled
    }



    private func parallaxValue(forAttributes attributes: ParallaxLayoutAttributes, direction: UICollectionViewScrollDirection) -> CGFloat {
        let position: CGFloat = direction == .vertical ? collectionView!.contentOffset.y + 64 : collectionView!.contentOffset.x
        let final: CGFloat = direction == .vertical ? attributes.frame.minY : attributes.frame.minX

        let missing: CGFloat = final - position
        let parallaxValue: CGFloat = missing / (direction == .vertical ? collectionView!.frame.size.height : collectionView!.frame.size.width)

        return parallaxValue
    }
}
