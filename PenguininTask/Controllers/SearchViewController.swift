//
//  SearchViewController.swift
//  PenguininTask
//
//  Created by Yazeed Afaneh on 24/05/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: PhotosCollectionViewCell.identifier, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: collectionView.frame.width / (1.5) , height: collectionView.frame.height)
            layout.minimumLineSpacing = 15
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 15
            layout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var searchKey = ""
    var photos: [Result] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search : \(searchKey)"
        fetchData()
    }
  
    
    private func fetchData(){
        
        APIManager.shared.request(endpoint: UnsplashEndpoint.search(query: searchKey)) { response in
            switch response {
            case .success(let resp):
                self.photos = resp.results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                let alert = UIAlertController(title: "Failer", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    
}
extension SearchViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        
        let photo = self.photos[indexPath.row]
        cell.configure(with: photo)
        return cell
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//            return CGSize(width:self.collectionView.bounds.width  , height: self.collectionView.frame.height)
//
//
//    }
    
    
    
}

