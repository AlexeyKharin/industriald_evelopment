
import Foundation
import UIKit
enum ButtonBackground {
    case color(UIColor)
    case image(UIImage)
}

final class CustomButton: UIButton {
    
    var onTap: (() -> Void)?
    
    init(title: String, cornerRadius: CGFloat, background: ButtonBackground, titleColor: UIColor, onTap: (() -> Void)?) {
        
        self.onTap = onTap
        super.init(frame: .zero)
        
        switch background {
        case .color(let color):
            self.backgroundColor = color
        case .image(let image):
            self.setBackgroundImage(image.alpha(1), for: .normal)
            self.setBackgroundImage(image.alpha(0.8), for: .disabled)
            self.setBackgroundImage(image.alpha(0.6), for: .selected)
            self.setBackgroundImage(image.alpha(0.4), for: .highlighted)
        }
    
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = cornerRadius
        
        self.setTitleColor(titleColor, for: .normal)
        
        toAutoLayout()
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapped() {
        onTap?()
    }
}
