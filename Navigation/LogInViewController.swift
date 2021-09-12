
import Foundation
import UIKit
import SnapKit

class LogInViewController: UIViewController {
    
    var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.toAutoLayout()
        return image
    }()
    
    lazy var loginButton: LoginButton = {
        let loginButton = LoginButton(tittle: "Log in", cornerRadius: 10, backGroundImage: #imageLiteral(resourceName: "blue_pixel"), titTileColor: .white) { [weak self] in
            guard let logIn = self?.textfieldTwo.text else  { return }
            guard let pswd  = self?.textfieldOne.text else  { return }
            self?.viewModel.onTapShowProfile(logIn, pswd)
        }
        loginButton.layer.masksToBounds = true
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return loginButton
    }()
    
    var stack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.spacing = 0
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.axis = .vertical
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        return stack
    }()
    
    lazy var textfieldOne: MyTextField = {
        let textField = MyTextField()
        textField.toAutoLayout()
        print("textField \(type(of: self))")
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.placeholder = "Password"
        return textField
    }()
    
    lazy var textfieldTwo: MyTextField = {
        let textField = MyTextField()
        textField.toAutoLayout()
        print("textField \(type(of: self))")
        textField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        textField.backgroundColor = .systemGray6
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.placeholder = "Email of phone"
        return textField
    }()
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.toAutoLayout()
        return containerView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.toAutoLayout()
        return sv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        [stack, loginButton, image].forEach { containerView.addSubview($0) }
        stack.addArrangedSubview(textfieldTwo)
        stack.addArrangedSubview(textfieldOne)
        
        scrollView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.right.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        image.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(containerView).offset(120)
            make.centerX.equalTo(containerView)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        stack.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(image.snp.bottom).offset(120)
            make.left.equalTo(containerView).offset(16)
            make.right.equalTo(containerView).offset(-16)
        }
        
        loginButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(stack.snp.bottom).offset(16)
            make.left.equalTo(containerView).offset(16)
            make.right.equalTo(containerView).offset(-16)
            make.height.equalTo(50)
            make.bottom.equalTo(containerView)
        }
    }
    
    /// Keyboard observers
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Keyboard actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

class MyTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10 , dy: 10)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
}


