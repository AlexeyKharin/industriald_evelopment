


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
    
    var pofVc = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage(image: pofVc.image.image ?? UIImage())

        pofVc.toAutoLayout()
        view.addSubview(pofVc)
       
        pofVc.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

