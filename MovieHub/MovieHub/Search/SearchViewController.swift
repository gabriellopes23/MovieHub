
import UIKit

class SearchViewController: UIViewController {
    
    let searchTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension SearchViewController {
    func style() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.text = "Search for your movie"
        searchTextField.backgroundColor = .secondarySystemBackground
        searchTextField.layer.cornerRadius = 12
        searchTextField.searchImageTextField()
    }
    
    func layout() {
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchTextField.trailingAnchor, multiplier: 1),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Extensions
extension UITextField {
    func searchImageTextField() {
        let imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        
        leftView = imageView
        leftViewMode = .always
    }
}
