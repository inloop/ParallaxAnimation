//
//  ParallaxBaseCell.swift
//  parallax-animation
//
//  Created by Martin Prusa on 22/09/2016.
//  Copyright © 2016 Martin Prusa. All rights reserved.
//


import UIKit

let maxHorizontalParallax: CGFloat = 150
let maxVerticalParallax: CGFloat = 1.2 //number of percent of which is image scaled up

class ParallaxBaseCell: UICollectionViewCell {
    private var _image: UIImage!
    private var imageView: UIImageView!
    var _parallaxValue: CGFloat = 0
    var parallaxDirection: UICollectionViewScrollDirection?
    var topImgView: NSLayoutConstraint!
    var leftImgView: NSLayoutConstraint!

    var image: UIImage {
        get {
            return _image
        }

        set (newValue) {
            _image = newValue
            imageView.image = image
        }
    }



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }



    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }



    private func setupView() {
        clipsToBounds = true
        imageView = UIImageView.init()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        topImgView = NSLayoutConstraint.init(item: imageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0)
        leftImgView = NSLayoutConstraint.init(item: imageView, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0)
        let widthImgView = NSLayoutConstraint.init(item: imageView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: 0)
        let heightImgView = NSLayoutConstraint.init(item: imageView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1.0, constant: 0)

        imageView.contentMode = UIViewContentMode.scaleAspectFill
        contentView.insertSubview(imageView, at: 0)
        contentView.addConstraints([topImgView, leftImgView, widthImgView, heightImgView])
    }



    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        let attributes: ParallaxLayoutAttributes = layoutAttributes as! ParallaxLayoutAttributes
        parallaxDirection = attributes.parallaxDirection

        if attributes.parallaxDirection == .horizontal {
            if attributes.parallaxPagingEnabled == true {
                leftImgView.constant = -1*(attributes.parallaxValue*maxHorizontalParallax)
            } else if attributes.parallaxPagingEnabled == false {
                leftImgView.constant = -1*(maxHorizontalParallax + attributes.parallaxValue*maxHorizontalParallax)
            }

        } else if attributes.parallaxDirection == .vertical {
            let numberOfPercent = maxVerticalParallax-1
            topImgView.constant = -1*(attributes.parallaxValue * bounds.size.height * numberOfPercent)
        }
    }
}
