import UIKit
import iOSIntPackage
import SnapKit

class ProfileViewController: UIViewController {
        
//    lazy var pofVc = ProfileHeaderView()
        var userService: UserService
        var nameUser: String
    
    init(userService: UserService, nameUser: String) {
        self.userService = userService
        self.nameUser = nameUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.toAutoLayout()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(ProfileHeaderForSectionOne.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderForSectionOne.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        loadImage(image: pofVc.image.image ?? UIImage())

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
}
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Strotage.collection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Strotage.collection[section].imageContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: PostTableViewCell.self),
            for: indexPath) as! PostTableViewCell
        
        cell.content =  Strotage.collection[indexPath.section].imageContent[indexPath.row]
        
        return cell
    }
}
// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderForSectionOne.self)) as! ProfileHeaderForSectionOne
        
        if let userServiceSafety = userService.obtains(nameUser: nameUser) {
        
            Strotage.collection[0].profileName = userServiceSafety.name
            Strotage.collection[0].profileStatus = userServiceSafety.status
            Strotage.collection[0].profileImage = userServiceSafety.avatar
        }
        
        headerView.profileHeder = Strotage.collection[section]
        
       
        headerView.collection.delegate = self
        headerView.delegate = self
        return headerView
    }
}

//MARK:- Call GallaryPhotosUINavigationController
protocol CellDelegate {
    func openGallaryPhotosUINavigationController()
}

extension ProfileViewController: CellDelegate {
    func openGallaryPhotosUINavigationController() {
        let vc = GallaryPhotosUINavigationController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
