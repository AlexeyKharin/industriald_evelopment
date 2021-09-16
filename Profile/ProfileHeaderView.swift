import iOSIntPackage
import UIKit
import SnapKit

class ProfileHeaderForSectionOne: UITableViewHeaderFooterView {
    
    var profileHeder: PostContent? {
        didSet {
            label.text = profileHeder?.profileName
            labeltwo.text = profileHeder?.profileStatus
            loadImage(image: (profileHeder?.profileImage)!)
        }
    }
    
    var delegate: CellDelegate?
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Lion")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.toAutoLayout()
        return image
    }()
    
    func loadImage(image: UIImage) {
        let processor = ImageProcessor()
        processor.processImage(sourceImage: image, filter: .process) { resultImage in
            self.image.image = resultImage
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hipster cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
    lazy var button: CustomButton = {
        let customButton = CustomButton(title: "Show status", cornerRadius: 4, background: .color(UIColor.blue), titleColor: .white) {
            guard self.textfield.text?.count != 0 else { return self.labeltwo.text = "Waiting for sonething..." }
            self.labeltwo.text = self.textfield.text
        }
        customButton.layer.shadowColor = UIColor.black.cgColor
        customButton.layer.shadowRadius = 4
        customButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        customButton.layer.shadowOpacity = 0.7
        return customButton
    }()
    
    lazy var labeltwo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.toAutoLayout()
        label.backgroundColor = .lightGray
        label.text = "Waiting for sonething..."
        return label
    }()
    
    lazy var textfield: UITextField = {
        let textField = UITextField()
        print("textField \(type(of: self))")
        textField.backgroundColor = .white
        textField.toAutoLayout()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        return textField
    }()
    
    lazy var placeForCollection: UIView = {
        let placeForCollection = UIView()
        placeForCollection.toAutoLayout()
        placeForCollection.backgroundColor = .white
        return placeForCollection
    }()
    
    lazy var collection: CallPfotosCell = {
        let collection = CallPfotosCell()
        collection.toAutoLayout()
        return collection
    }()
    
    lazy var labePhoto: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.toAutoLayout()
        label.backgroundColor = .white
        label.text = "Photos"
        return label
    }()
    
    lazy var backgruond: UIView = {
        let backgruond = UIView()
        backgruond.toAutoLayout()
        backgruond.backgroundColor = .lightGray
        return backgruond
    }()
    
    lazy var buttonPhotos: UIButton = {
        let button = UIButton(type: .system)
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "arrow.right")?.withTintColor(UIColor.systemRed).withRenderingMode(.alwaysOriginal), for:.normal)
        button.addTarget(self, action: #selector(callGallaryPhotos), for: .touchUpInside)
        return button
    }()
    
    @objc func callGallaryPhotos() {
        delegate?.openGallaryPhotosUINavigationController()
    }
    
    private var statusText: String?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(backgruond)
        [image, label, button, labeltwo, textfield, placeForCollection].forEach { backgruond.addSubview($0) }
        placeForCollection.addSubview(labePhoto)
        placeForCollection.addSubview(collection)
        placeForCollection.addSubview(buttonPhotos)
        
        backgroundColor = .lightGray
        
        backgruond.snp.makeConstraints { (make) -> Void  in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
        }
        
        image.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(backgruond).offset(12)
            make.left.equalTo(backgruond).offset(16)
            make.height.equalTo(100)
            make.width.equalTo(100)
        })
        
        label.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(backgruond).offset(27)
            make.left.equalTo(image.snp.right).offset(20)
            make.right.equalTo(backgruond).offset(-16)
            make.height.equalTo(20)
        }
        
        labeltwo.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(label.snp.bottom).offset(8)
            make.left.equalTo(label)
            make.right.equalTo(label)
            make.height.equalTo(25)
        }
        
        textfield.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labeltwo.snp.bottom).offset(8)
            make.left.equalTo(label)
            make.right.equalTo(label)
            make.height.equalTo(40)
        }
        
        button.snp.makeConstraints { (make) -> Void  in
            make.top.equalTo(textfield.snp.bottom).offset(15)
            make.left.equalTo(backgruond).offset(16)
            make.right.equalTo(backgruond).offset(-16)
            make.height.equalTo(50)
        }
        
        
        placeForCollection.snp.makeConstraints { (make) -> Void  in
            make.top.equalTo(button.snp.bottom).offset(10)
            make.left.equalTo(backgruond)
            make.right.equalTo(backgruond)
        }
        
        labePhoto.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(placeForCollection).offset(12)
            make.left.equalTo(placeForCollection).offset(12)
            make.height.equalTo(24)
        }
        
        buttonPhotos.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(labePhoto.snp.centerY)
            make.right.equalTo(placeForCollection.snp.right).offset(-12)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        collection.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labePhoto.snp.bottom).offset(12)
            make.left.equalTo(placeForCollection)
            make.right.equalTo(placeForCollection)
            make.bottom.equalTo(placeForCollection)
        }
        
        placeForCollection.snp.makeConstraints { (make) -> Void  in
            make.bottom.equalTo(backgruond).offset(-8)
        }
        
        backgruond.snp.makeConstraints { (make) -> Void  in
            make.bottom.equalTo(contentView)
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
