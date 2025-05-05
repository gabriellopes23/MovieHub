
import UIKit

class HomeViewController: UIViewController {
    
    // Request Model
    var filmes: [FilmeModel] = []
    
    // View Models
    var homeItemCell: [HomeItemCell.CustomCellModel] = []
    
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
        fetchDataAndLoadViews()
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
        return homeItemCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.reuseID, for: indexPath) as? HomeItemCell else {
            return UICollectionViewCell()
        }
        
        let filmes = homeItemCell[indexPath.row]
        cell.configure(with: filmes)
        
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}

// MARK: - Networking
extension HomeViewController {
    private func fetchDataAndLoadViews() {
        
        fetchFilme { result in
            switch result {
            case .success(let filmes):
                self.filmes = filmes
                self.configureCollectionCells(with: filmes)
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureCollectionCells(with filmes: [FilmeModel]) {
        let baseImageURL = "https://image.tmdb.org/t/p/w500"
        
        homeItemCell = filmes.map {
            let fullImageURL = baseImageURL + ($0.posterPath ?? "")
            return HomeItemCell.CustomCellModel(image: fullImageURL, title: $0.title, score: "\($0.voteAverage)")
        }
    }
}
