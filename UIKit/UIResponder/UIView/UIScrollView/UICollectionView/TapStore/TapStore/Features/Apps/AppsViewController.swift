import UIKit

class AppsViewController: UIViewController {

    let sections = Bundle.main.decode([Section].self, from: "appstore.json")
    var dataSource: DataSource!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}
