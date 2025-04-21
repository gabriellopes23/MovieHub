
import UIKit

class HomeViewController: UIViewController {
    
    private let items: [CustomCellModel] = [
        CustomCellModel(image: "filme", title: "Filme1", score: "4.3"),
        CustomCellModel(image: "filme", title: "Filme2", score: "4.3"),
        CustomCellModel(image: "filme", title: "Filme3", score: "4.3"),
        CustomCellModel(image: "filme", title: "Filme4", score: "4.3"),
        CustomCellModel(image: "filme", title: "Filme5", score: "4.3"),
        CustomCellModel(image: "filme", title: "Filme6", score: "4.3"),
    ]
    
    let homeTitleLabel = UILabel()
    let subtitleLable = UILabel()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Extensions
extension HomeViewController {
    func setup() {
        setupLabels()
        setupCollectionView()
    }
    
    func setupLabels() {
        homeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTitleLabel.text = "Home"
        homeTitleLabel.font = .systemFont(ofSize: 39, weight: .bold)
        
        subtitleLable.translatesAutoresizingMaskIntoConstraints = false
        subtitleLable.text = "Popular Movies"
        subtitleLable.font = .systemFont(ofSize: 28, weight: .bold)
        
        view.addSubview(homeTitleLabel)
        view.addSubview(subtitleLable)
        
        NSLayoutConstraint.activate([
            homeTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            subtitleLable.topAnchor.constraint(equalToSystemSpacingBelow: homeTitleLabel.bottomAnchor, multiplier: 4),
            subtitleLable.leadingAnchor.constraint(equalTo: homeTitleLabel.leadingAnchor)
            ])
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.bounds.width / 2) - 3, height: (view.bounds.height / 4) - 3)
        layout.minimumLineSpacing = 100
        layout.minimumInteritemSpacing = 4
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: HomeItemCell.reuseID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: subtitleLable.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.reuseID, for: indexPath) as? HomeItemCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: items[indexPath.item])
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
