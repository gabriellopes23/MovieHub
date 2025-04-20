
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    private func setupViews() {
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let favoriteVC = FavoriteViewController()
        
        homeVC.setTabBarImage(imageName: "film.fill", title: "Home")
        searchVC.setTabBarImage(imageName: "magnifyingglass", title: "Search")
        favoriteVC.setTabBarImage(imageName: "heart.fill", title: "Favorite")

        let homeNC = UINavigationController(rootViewController: homeVC)
        let searchNC = UINavigationController(rootViewController: searchVC)
        let favoriteNC = UINavigationController(rootViewController: favoriteVC)
        
        UITabBar.appearance().tintColor = .systemRed
        
        let tabBarList = [homeNC, searchNC, favoriteNC]
        
        viewControllers = tabBarList
    }
    
    
}


// MARK: - Classes Temporárias
class SearchViewController: UIViewController {
    override func viewDidLoad() {
    }
}

class FavoriteViewController: UIViewController {
    override func viewDidLoad() {

    }
}
