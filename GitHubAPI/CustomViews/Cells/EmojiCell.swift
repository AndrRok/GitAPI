//
//  EmojiCell.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit

class EmojiCell: UICollectionViewCell {
    
    static let reuseID = "EmojiCell"
    
    let imageImageView = ImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDefaultImage(){
        imageImageView.image = Images.placeholder
    }
    
    func set(image: String){
        NetworkManager.shared.downloadImage(from: image) { [weak self] image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {self.imageImageView.image = image}
        }
    }
    
    
    
    private func configure(){
        addSubview(imageImageView)
    
        imageImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageImageView.heightAnchor.constraint(equalToConstant: 50),
            imageImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
