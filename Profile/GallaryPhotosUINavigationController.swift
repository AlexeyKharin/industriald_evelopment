
import UIKit
import iOSIntPackage

class GallaryPhotosUINavigationController: UIViewController {
    
    var images: [UIImage] = []
    
    var collectiomImages: [UIImage] = []
    
    let imagePublisherFacade = ImagePublisherFacade()
    
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.toAutoLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            PhotoForGalleryCell.self,
            forCellWithReuseIdentifier: String(describing: PhotoForGalleryCell.self)
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Galery"
        view.backgroundColor = .white
        layout.scrollDirection = .vertical
        view.addSubview(collectionView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collectionView.frame = CGRect(
            x: .zero,
            y: view.safeAreaInsets.top,
            width: view.bounds.width,
            height: view.bounds.height - view.safeAreaInsets.top
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Gallary.gallary[0].repository.forEach { images.append($0.image)}
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 1, repeat: 20, userImages: images)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        imagePublisherFacade.removeSubscription(for: self)
    }
}

extension GallaryPhotosUINavigationController: UICollectionViewDataSource, ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        self.collectiomImages = images
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectiomImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoInGallary = collectiomImages[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: PhotoForGalleryCell.self),
            for: indexPath) as! PhotoForGalleryCell
        cell.photo = photoInGallary
        
        return cell
    }
}

extension GallaryPhotosUINavigationController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (collectionView.bounds.width - 8 * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: 8, bottom: 20, right: 8)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}

