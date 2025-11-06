//
//  TabCollection.swift
//  plate360
//
//  Created by Aviran Dabush on 30/10/2025.
//

import UIKit

class TabsCollection: UIView {
    
    var onTabSelected: ((Int) -> Void)?
    
    private var items: [String] = []
    private var selectedIndex: Int = 0
    
    private lazy var collectionView: UICollectionView = {
        let layout = RTLCollectionFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.semanticContentAttribute = DirectionManager.shared.isRTL ? .forceRightToLeft : .forceLeftToRight
        view.register(UINib(nibName: "TabCell", bundle: nil), forCellWithReuseIdentifier: "TabCell")
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with items: [String]) {
        self.items = items
        collectionView.reloadData()
    }
    
    func resetSelection() {
        selectedIndex = 0
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
        collectionView.reloadData()
    }
}

extension TabsCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
        cell.configure(with: items[indexPath.row], isCurrentTab: indexPath.row == selectedIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        onTabSelected?(selectedIndex)
        
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.reloadData()
    }
}
