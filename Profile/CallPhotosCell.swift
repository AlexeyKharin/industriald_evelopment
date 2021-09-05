
import UIKit
import SnapKit
final class CallPfotosCell: UIView,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var delegate: CellDelegate?
    
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.toAutoLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            PhotosTableViewCell.self,
            forCellWithReuseIdentifier: "PhotosTableViewCell")
        return collectionView
    }()
    //    MARK:- UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let x = Gallary.gallary.count
        print(x)
        return x
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let x = 9
        print(x)
        return x
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let slidePhoto = Gallary.gallary[indexPath.section].repository[0...9]
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PhotosTableViewCell",
            for: indexPath) as! PhotosTableViewCell
        cell.photo = slidePhoto[indexPath.item]
        return cell
    }
    //    MARK:- UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 99
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.bounds.width - (8 * 3) - (12*2)) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: 12, bottom: .zero, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.openGallaryPhotosUINavigationController()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout.scrollDirection = .horizontal
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



