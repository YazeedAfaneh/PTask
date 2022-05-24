//
//  PhotosCollectionViewCell.swift
//  PenguininTask
//
//  Created by Yazeed Afaneh on 24/05/2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotosCollectionViewCell"
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var portfolioLink: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        portfolioLink.isUserInteractionEnabled = true
        portfolioLink.addGestureRecognizer(tap)
        
    }
    func configure(with model : Result) {
        self.titleLabel.text = model.altDescription ?? "Unkown Title"
        self.descriptionLabel.text = ((model.sponsorship?.sponsor.name ?? model.altDescription) ?? "" )
        self.portfolioLink.text = model.sponsorship?.sponsor.portfolioURL ?? ""
        self.imageView.loadFrom(URLAddress: model.urls.small)
    }

}


extension PhotosCollectionViewCell {
    
  @objc func didTap(){
      if !portfolioLink.text!.isEmpty {
          if let url = URL(string: portfolioLink.text!) {
              UIApplication.shared.open(url)
          }
      }
      print("TAPPED YA YAZEEED")
        
    }
}


extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
