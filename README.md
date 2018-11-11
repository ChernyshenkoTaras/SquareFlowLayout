# SquareFlowLayout

 Makes your `UICollectionView` to looks like Instagram explore has never been so easy before. 

 `SquareFlowLayout` provide dynamic layout generation by defining which IndexPath should be expanded.

<img src="https://github.com/ChernyshenkoTaras/SquareFlowLayout/blob/master/SquareFlowLayout/Screenshots/SquareFlowLayout-2.png" alt="Flow layout" width="300px" height="560px"/> 
<img src="https://github.com/ChernyshenkoTaras/SquareFlowLayout/blob/master/SquareFlowLayout/Screenshots/SquareFlowLayout-3.png" alt="Flow layout" width="300px" height="560px"/>
## Installation

#### CocoaPods

`pod 'SquareFlowLayout'`

#### Manually

1. Download and drop ```Classes``` folder into your project.
2. Congratulations!

## Usage

1. Set `SquareFlowLayout` to your UICollectionView and set it `flowDelegate`

```
    let flowLayout = SquareFlowLayout()
    flowLayout.flowDelegate = self
    self.collectionView.collectionViewLayout = flowLayout
```

2. Make your class conform to `SquareFlowLayoutDelegate` and use `shouldExpandItem(at: ) -> Bool` to decide which cell to expand
3. Design your cells
3. Populate your collectionView with data

## Contributing to this project

If you like this tool, show your support by tell me how do u use it.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
