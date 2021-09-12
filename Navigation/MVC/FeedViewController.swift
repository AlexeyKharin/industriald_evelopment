import UIKit
final class FeedViewController: UIViewController {

    var showNewComtroller: (() -> Void)?
    
    var model: ModelCheck
    
    init(model: ModelCheck) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var customButton: CustomButton = {
        let loginButton = CustomButton(tittle: "Check", cornerRadius: 5, backgroundColor: .yellow, titTileColor: .green) { [weak self] in
            guard let intermediateSafety = self?.intermediate else { return }
            self?.model.check(password: intermediateSafety)
        }
        return loginButton
    }()
    
    var intermediate: String?
        
    lazy var resultOfCheck: UIView = {
        let resultOfCheck = UIView()
        resultOfCheck.toAutoLayout()
        resultOfCheck.backgroundColor = .white
        return resultOfCheck
    }()
    
    lazy var customTextField: CustomTextField = {
        
        let textField = CustomTextField(placeholder: "CheckPassword") { [weak self] text in
            self?.intermediate = text
        }
        
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("Show NewController", for: .normal)
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
        showNewComtroller?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(customButton)
        view.addSubview(customTextField)
        view.addSubview(resultOfCheck)
        view.addSubview(button)
        
        model.response = {[weak self] bool in
            switch bool {
            case true:
                self?.resultOfCheck.backgroundColor = .green
            case false:
                self?.resultOfCheck.backgroundColor = .red
            }
        }
        
        let constraints = [
            customButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            customButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            customButton.widthAnchor.constraint(equalToConstant: 200),
            customButton.heightAnchor.constraint(equalToConstant: 40),
            
            customTextField.centerXAnchor.constraint(equalTo: customButton.centerXAnchor),
            customTextField.widthAnchor.constraint(equalToConstant: 200),
            customTextField.heightAnchor.constraint(equalToConstant: 40),
            customTextField.bottomAnchor.constraint(equalTo: customButton.topAnchor, constant: -20),
            
            resultOfCheck.centerXAnchor.constraint(equalTo: customButton.centerXAnchor),
            resultOfCheck.widthAnchor.constraint(equalToConstant: 200),
            resultOfCheck.heightAnchor.constraint(equalToConstant: 100),
            resultOfCheck.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            button.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 40),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.centerXAnchor.constraint(equalTo: customButton.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
