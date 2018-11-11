//
//  ViewController.swift
//  SquareFlowLayout
//
//  Created by Taras Chernyshenko on 11/11/18.
//  Copyright © 2018 Taras Chernyshenko. All rights reserved.
//

import UIKit
import SquareFlowLayout

class ViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    private var photos: [Int : UIImage] = [:]
    
    private let layoutValues: [Bool] = [
        true, false, false,
        false, false, false,
        false, false, false,
        false, true, false,
        true, false, false,
        false, true, false,
        false, false, false,
        false, false, true,
        false, false, false,
        false, true, false,
        false, false, false,
        true, false, false,
        false, false, false,
        false, true, false,
        false, false, false,
        false, false, false,
        true, false, false,
        false, false, false,
        false, false, true,
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        let flowLayout = SquareFlowLayout()
        flowLayout.flowDelegate = self
        self.collectionView.collectionViewLayout = flowLayout
        
        self.collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
        for i in 0..<self.layoutValues.count {
            self.photos[i] = UIImage()
            ImageLoader.load(from: self.url(at: i + 1)) { image in
                self.photos[i] = image
                self.collectionView.reloadItems(at: [IndexPath(row: i, section: 0)])
            }
        }
        self.collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let flowLayout = self.collectionView.collectionViewLayout as? SquareFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    private func url(at index: Int) -> URL {
        return URL(string: "https://randomfox.ca/images/\(index).jpg")!
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.photos.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = self.photos[indexPath.row]
        return cell
    }
}

extension ViewController: SquareFlowLayoutDelegate {
    func shouldExpandItem(at indexPath: IndexPath) -> Bool {
        return self.layoutValues[indexPath.row]
    }
}
