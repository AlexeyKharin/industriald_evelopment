import Foundation
import UIKit

final class CustomButton: UIButton {
    
    var onTap: (() -> Void)?
    
    init(tittle: String, cornerRadius: CGFloat, backgroundColor: UIColor, titTileColor: UIColor, onTap: (() -> Void)?) {
        self.onTap = onTap
        
        super.init(frame: .zero)
        
        self.setTitle(tittle, for: .normal)
        self.layer.cornerRadius = cornerRadius
        
        self.setTitleColor(titTileColor, for: .normal)
        
        self.backgroundColor = backgroundColor
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
