


import UIKit
class ProfileViewController: UIViewController {
    var pofVc = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pofVc.toAutoLayout()
        view.addSubview(pofVc)
        
        let constraints = [
            pofVc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pofVc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pofVc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

