//
//  ParallaxLayoutAttributes.swift
//  parallax-animation
//
//  Created by Martin Prusa on 22/09/2016.
//  Copyright © 2016 Martin Prusa. All rights reserved.
//

import UIKit

final class ParallaxLayoutAttributes: UICollectionViewLayoutAttributes {
    var parallaxValue: CGFloat = 0.0
    var parallaxDirection: UICollectionViewScrollDirection?
    var parallaxPagingEnabled: Bool = false



    override func copy(with zone: NSZone? = nil) -> Any {
        let copy: ParallaxLayoutAttributes = super.copy(with: zone) as! ParallaxLayoutAttributes
        copy.parallaxValue = self.parallaxValue
        copy.parallaxDirection = self.parallaxDirection
        copy.parallaxPagingEnabled = self.parallaxPagingEnabled
		
        return copy
    }



    override func isEqual(_ object: Any?) -> Bool {
        if (object as AnyObject).isKind(of: ParallaxLayoutAttributes.classForCoder()) == false {
            return false
        }

        let otherObject: ParallaxLayoutAttributes = object as! ParallaxLayoutAttributes

		
        if (self.parallaxValue != otherObject.parallaxValue) {
            return false
        }
		
        return super.isEqual(otherObject);
    }
}
