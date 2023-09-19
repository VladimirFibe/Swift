import UIKit

class AppsViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, App>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, App>


    let sections = Bundle.main.decode([Section].self, from: "appstore.json")
    var collectionView: UICollectionView!
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

