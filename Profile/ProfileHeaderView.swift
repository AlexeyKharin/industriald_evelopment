
import UIKit

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
        let constraints = [
        
            image.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            labeltwo.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            labeltwo.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            labeltwo.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            labeltwo.heightAnchor.constraint(equalToConstant: 25),
            
            textfield.topAnchor.constraint(equalTo: labeltwo.bottomAnchor, constant: 8),
            textfield.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            textfield.heightAnchor.constraint(equalToConstant: 40),
            
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27)
        ]
        
        NSLayoutConstraint.activate(constraints)
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
