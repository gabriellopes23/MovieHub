
import UIKit

class SearchTextFieldView: UIView {
    
    let stackView = UIStackView()
    let searchTextField = UITextField()
    let searchImage = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchTextFieldView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search for your movie"
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.backgroundColor = .secondarySystemBackground
        stackView.layer.cornerRadius = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.contentMode = .scaleAspectFit
        searchImage.tintColor = .systemGray
    }
    
    func layout() {
        stackView.addArrangedSubview(searchImage)
        stackView.addArrangedSubview(searchTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchImage.heightAnchor.constraint(equalToConstant: 24),
            searchImage.widthAnchor.constraint(equalToConstant: 24),
            
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
