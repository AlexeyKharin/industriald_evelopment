


import UIKit
import iOSIntPackage
import SnapKit

class ProfileViewController: UIViewController {
    
    func loadImage(image: UIImage) {
        let processor = ImageProcessor()
        processor.processImage(sourceImage: image, filter: .noir) { resultImage in
            pofVc.image.image = resultImage
        }
    }
    
    lazy var pofVc = ProfileHeaderView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       
        
        loadImage(image: pofVc.image.image ?? UIImage())

        pofVc.toAutoLayout()
        view.addSubview(pofVc)
        pofVc.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
        }
        if let userServiceSafety = userService.obtains(nameUser: nameUser) {
            pofVc.label.text = userServiceSafety.name
            pofVc.labeltwo.text = userServiceSafety.status
            pofVc.image.image = userServiceSafety.avatar
    }
}
}

