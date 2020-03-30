//
//  GalleryCollectionView.swift
//  VKNewsLite
//
//  Created by Виктор on 30.03.2020.
//  Copyright © 2020 SwiftViktor. All rights reserved.
//

import UIKit

final class GalleryCollectionView: UICollectionView {
    
    var photos = [FeedCellPhotoAttachementViewModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        register(GalleryCollcetionViewCell.self, forCellWithReuseIdentifier: GalleryCollcetionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(photos: [FeedCellPhotoAttachementViewModel]) {
        self.photos = photos
        reloadData()
    }
}


extension GalleryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollcetionViewCell.reuseId, for: indexPath) as! GalleryCollcetionViewCell
        cell.set(imageUrl: photos[indexPath.row].photoUrlString)
        return cell
    }
}
