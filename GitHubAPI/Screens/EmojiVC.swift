//
//  EmojiVC.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit


class EmojiVC: DataLoadingVC {
    
    enum Section{case main}
    
    var collectionView: UICollectionView!
    
    var emojiDict: [String:String] = [:]
    var convertedEmoji: [Emoji]     = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEmojis()
        congifureViewController()
        configureCollectionView()
        configureDataSource()
    }
    
    func congifureViewController(){
        view.backgroundColor = .systemBackground
    }
    
    func getEmojis(){
        showLoadingView()
        NetworkManager.shared.getEmoji(){ [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let emojiDict):
                self.emojiDict      = emojiDict
                self.convertedEmoji = emojiDict.sorted(by: <).map{ emoji in
                    return Emoji(sign: emoji.key, imageUrl: emoji.value)
                }
                self.loadEmojiData(on: self.convertedEmoji)
                print("\(self.convertedEmoji)")
            case .failure(let error):
                self.presentCustomAllertOnMainThred(allertTitle: "Bad Stuff Happend", message: error.rawValue, butonTitle: "Ok")
            }
        }
        
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Emoji>!
    
    
    func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Emoji>(collectionView: collectionView, cellProvider: {(collectionView, indexPath, emoji)-> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojiCell.reuseID, for: indexPath) as! EmojiCell
            cell.set(image: emoji.imageUrl)
            return cell
        })
    }
    
    
    func loadEmojiData(on resultsEmojis: [Emoji]){
        var snapShot = NSDiffableDataSourceSnapshot<Section, Emoji>()
        snapShot.appendSections([.main])
        snapShot.appendItems(resultsEmojis)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
    
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(EmojiCell.self, forCellWithReuseIdentifier: EmojiCell.reuseID)
    }
}


