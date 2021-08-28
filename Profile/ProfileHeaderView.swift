
import UIKit
import SnapKit
class ProfileHeaderView: UIView {
    
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
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hipster cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
     lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        print("button \(type(of: self))")
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.toAutoLayout()
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed() {
        guard textfield.text?.count != 0 else { return labeltwo.text = "Waiting for sonething..." }
        labeltwo.text = textfield.text
    }
    
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
    
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        [image, label, labeltwo, textfield, button].forEach { addSubview($0) }
        
        
//        buttonTitle.snp.makeConstraints { (make) -> Void in
//            make.left.equalTo(view.safeAreaLayoutGuide).offset(12)
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-12)
//            make.right.equalTo(view.safeAreaLayoutGuide).offset(-12)
//        }
        
        image.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(self).offset(12)
            make.left.equalTo(self).offset(16)
            make.height.equalTo(100)
            make.width.equalTo(100)
        })
        
        label.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(27)
            make.left.equalTo(image.snp.right).offset(20)
            make.right.equalTo(self).offset(-16)
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
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.height.equalTo(50)
            make.bottom.equalTo(self).offset(-27)
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
