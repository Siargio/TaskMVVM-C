import UIKit

final class HousesView: UIView {

    // MARK: - UIElements

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = true
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private let locationButton: UIButton = {
        let button = UIButton()
        let image = R.Image.Home.locationButtonImage
        button.setImage(image, for: .normal)
        button.setTitle(R.Text.Home.locationButtonTitle, for: .normal)
        button.setTitleColor(CommonColor.textColorSearchBarPlaceholder, for: .normal)
        button.titleLabel?.font = UIFont.montserratRegular14()
        button.imageEdgeInsets.left = +75
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCategories.self, forCellWithReuseIdentifier: CollectionViewCategories.identifier)
        collectionView.register(CollectionViewLatest.self, forCellWithReuseIdentifier: CollectionViewLatest.identifier)
        collectionView.register(CollectionViewFlashSale.self, forCellWithReuseIdentifier: CollectionViewFlashSale.identifier)
        collectionView.register(CollectionViewBrands.self, forCellWithReuseIdentifier: CollectionViewBrands.identifier)
        collectionView.register(HeaderCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Init

    init() {
        super.init(frame: .zero)
        backgroundColor = CommonColor.backgroundColor

        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

        func searchText(to searchBar: UISearchBar, placeHolderText: String) {

            let searchTextField: UITextField = searchBar.value(forKey: R.Text.Home.searchTextFieldKey) as? UITextField ?? UITextField()

            let image = R.Image.Home.magnifyingGlass
            let imageView = UIImageView.init(image: image)
            imageView.tintColor = .gray
            searchTextField.leftView = nil
            searchTextField.font = .montserratLight11()
            searchTextField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: CommonColor.textColorSearchBarPlaceholder])

            searchTextField.rightView = imageView
            searchTextField.rightViewMode = .always
            
            searchTextField.backgroundColor = CommonColor.backgroundColorSearchBar

            let searchBarWidth = self.frame.width
            let placeHolderWidth = searchTextField.attributedPlaceholder?.size().width
            let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 1)), vertical: 0)
            searchBar.setPositionAdjustment(offset, for: .search)
        }

    private func setupHierarchy() {
        addSubview(searchBar)
        addSubview(locationButton)
        addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            locationButton.widthAnchor.constraint(equalToConstant: 80),

            searchBar.topAnchor.constraint(equalTo: locationButton.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -56),

            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
             collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func createLayout() -> UICollectionViewCompositionalLayout {
       return UICollectionViewCompositionalLayout { sectionIndex, _ in

           switch sectionIndex {
           case 0:
               let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.166),
                heightDimension: .fractionalHeight(0.14))

               let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

               layoutItem.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 5,
                bottom: 0, trailing: 5)

               let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(500))

               let layoutGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [layoutItem])

               let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)

               sectionLayout.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 5, bottom: 10, trailing: 10)

               sectionLayout.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

               return sectionLayout

           case 1:
               let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))

               let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

               layoutItem.contentInsets = NSDirectionalEdgeInsets(
                top: 5, leading: 5, bottom: 10, trailing: 10)

               let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(180))

               let layoutGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: layoutItem, count: 3)

               let layoutSection = NSCollectionLayoutSection(group: layoutGroup)

               layoutSection.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 5, bottom: 10, trailing: 0)

               layoutSection.orthogonalScrollingBehavior = .continuous

               let layoutSectionHeaderSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.97),
                heightDimension: .estimated(25))

               let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: layoutSectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)

               layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

               return layoutSection
           case 2:
               let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))

               let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

               layoutItem.contentInsets = NSDirectionalEdgeInsets(
                top: 5, leading: 5, bottom: 5, trailing: 10)

               let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(260))

               let layoutGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: layoutItem, count: 2)

               let layoutSection = NSCollectionLayoutSection(group: layoutGroup)

               layoutSection.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 5, bottom: 10, trailing: 0)

               layoutSection.orthogonalScrollingBehavior = .continuous

               let layoutSectionHeaderSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.97),
                heightDimension: .estimated(25))

               let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: layoutSectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)

               layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

               return layoutSection
           default :
               let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))

               let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

               layoutItem.contentInsets = NSDirectionalEdgeInsets(
                top: 5, leading: 5, bottom: 5, trailing: 10)

               let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(260))

               let layoutGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: layoutItem, count: 2)

               let layoutSection = NSCollectionLayoutSection(group: layoutGroup)

               layoutSection.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 5, bottom: 10, trailing: 0)

               layoutSection.orthogonalScrollingBehavior = .continuous

               let layoutSectionHeaderSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.97),
                heightDimension: .estimated(25))

               let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: layoutSectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)

               layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

               return layoutSection
           }
       }
   }
}
