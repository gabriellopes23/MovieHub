
import UIKit

class FavoriteViewController: UIViewController {
    
    private let items: [FavoriteCellModel] = [
        FavoriteCellModel(imageView: "filme", title: "Filme1"),
        FavoriteCellModel(imageView: "filme", title: "Filme2"),
        FavoriteCellModel(imageView: "filme", title: "Filme3"),
        FavoriteCellModel(imageView: "filme", title: "Filme4"),
        FavoriteCellModel(imageView: "filme", title: "Filme5"),
        FavoriteCellModel(imageView: "filme", title: "Filme6"),
    ]
    
    let favoriteTitleLabel = UILabel()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
        setupCollectionView()
    }
}

extension FavoriteViewController {
    func setupLabel() {
        favoriteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteTitleLabel.text = "Favorite"
        favoriteTitleLabel.font = .systemFont(ofSize: 39, weight: .bold)
        
        view.addSubview(favoriteTitleLabel)
        
        NSLayoutConstraint.activate([
            favoriteTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
        ])
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.bounds.width / 2) - 3, height: (view.bounds.height / 4) - 3)
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 4
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FavoriteItemCell.self, forCellWithReuseIdentifier: FavoriteItemCell.reusedID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: favoriteTitleLabel.bottomAnchor, multiplier: 2),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteItemCell.reusedID, for: indexPath) as? FavoriteItemCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: items[indexPath.item])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension FavoriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
