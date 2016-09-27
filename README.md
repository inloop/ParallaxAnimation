# ParallaxAnimation

Simple parallax example for Horizontal and Vertical direction using UICollectionViewLayout modification.

![Parallax animation](demo-gif/parallax.gif)

```swift
override class var layoutAttributesClass: AnyClass {
        get {
            return ParallaxLayoutAttributes.classForCoder()
        }
}

override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
}
```

By overriding var and method like above the developer is able to implement these delegate methods and mofify the collectionViewCell however he wants.

```swift
override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?

override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?

override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes)
```

## Requirements
* iOS 9.0+
* Xcode 8.0+
* Swift 3.0+

## Author
MartinPrusa, martin.prusa@inloop.eu

## License
ParallaxAnimation is available under the MIT license. See the LICENSE file for more info.