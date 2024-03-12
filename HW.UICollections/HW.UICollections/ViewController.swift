//
//  ViewController.swift
//  HW.UICollections
//
//  Created by Anastasia on 12/03/24.
//

import UIKit

class ViewController: UIViewController {
   
    var model: [String] = [
        "airpodsmax",
        "airpods",
        "applewatch",
        "homepodmini.and.appletv",
        "ipad.gen2",
        "macbook",
        "magsafe.batterypack.fill",
        "macpro.gen3",
        "tv.and.hifispeaker.fill",
        "visionpro"
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 70)

        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        
    }


}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        let image = model[indexPath.row]
        cell.imageView.image = UIImage(systemName: image)
        cell.imageView.tintColor = .black
        return cell
    }
}

