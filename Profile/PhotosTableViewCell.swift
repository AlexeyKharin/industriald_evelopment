import UIKit
import SnapKit
class PhotosTableViewCell:  UICollectionViewCell {
   
    var photo: Photo? {
        didSet {
            photoFromGallary.image = photo?.image
            print("Фото загружено")
        }
    }

    private let photoFromGallary: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.toAutoLayout()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(photoFromGallary)
        photoFromGallary.snp.makeConstraints { (make) -> Void  in
            make.top.equalTo(contentView)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
    }
}
