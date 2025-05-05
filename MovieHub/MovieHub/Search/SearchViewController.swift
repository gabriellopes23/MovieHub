
import UIKit

class SearchViewController: UIViewController {
    
    private let items: [SearchCellModel] = [
        SearchCellModel(image: "filme", title: "Filme1"),
        SearchCellModel(image: "filme", title: "Filme2"),
        SearchCellModel(image: "filme", title: "Filme3"),
        SearchCellModel(image: "filme", title: "Filme4"),
        SearchCellModel(image: "filme", title: "Filme5"),
        SearchCellModel(image: "filme", title: "Filme6"),
        SearchCellModel(image: "filme", title: "Filme1"),
        SearchCellModel(image: "filme", title: "Filme2"),
        SearchCellModel(image: "filme", title: "Filme3"),
        SearchCellModel(image: "filme", title: "Filme4"),
        SearchCellModel(image: "filme", title: "Filme5"),
        SearchCellModel(image: "filme", title: "Filme6"),
        SearchCellModel(image: "filme", title: "Filme1"),
        SearchCellModel(image: "filme", title: "Filme2"),
        SearchCellModel(image: "filme", title: "Filme3"),
        SearchCellModel(image: "filme", title: "Filme4"),
        SearchCellModel(image: "filme", title: "Filme5"),
        SearchCellModel(image: "filme", title: "Filme6"),
    ]
    
    let searchTextFieldView = SearchTextFieldView()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        setupCollectionView()
    }
}

extension SearchViewController {
    func style() {
        searchTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        view.addSubview(searchTextFieldView)
        
        NSLayoutConstraint.activate([
            searchTextFieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextFieldView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchTextFieldView.trailingAnchor, multiplier: 1)
        ])
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.bounds.width / 3.5) - 3, height: (view.bounds.height / 6.5) - 3)
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 4
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SearchItemCell.self, forCellWithReuseIdentifier: SearchItemCell.reuseID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: searchTextFieldView.bottomAnchor, multiplier: 2),
            collectionView.leadingAnchor.constraint(equalTo: searchTextFieldView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: searchTextFieldView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchItemCell.reuseID, for: indexPath) as? SearchItemCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: items[indexPath.item])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
