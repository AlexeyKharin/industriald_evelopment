
import Foundation
import UIKit

final class LoginButton: UIButton {
    
    var onTap: (() -> Void)?
    
    init(tittle: String, cornerRadius: CGFloat, backGroundImage: UIImage, titTileColor: UIColor, onTap: (() -> Void)?) {
        self.onTap = onTap
        super.init(frame: .zero)
        
        self.setTitle(tittle, for: .normal)
        self.layer.cornerRadius = cornerRadius
        
        setTitleColor(titTileColor, for: .normal)
        
        setBackgroundImage(backGroundImage.alpha(1), for: .normal)
        setBackgroundImage(backGroundImage.alpha(0.8), for: .disabled)
        setBackgroundImage(backGroundImage.alpha(0.6), for: .selected)
        setBackgroundImage(backGroundImage.alpha(0.4), for: .highlighted)
        
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
