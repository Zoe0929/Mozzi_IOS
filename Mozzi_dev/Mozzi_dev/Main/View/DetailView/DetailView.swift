//
//  DetailView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/16.
//

import UIKit
import SnapKit

class DetailView : BaseView {
    let profileView = ProfileHeaderView()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: createLayout())
        
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderView.identifier)
        collectionView.register(LineView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LineView.identifier)
        
        InfoUnitCollectionViewCell.register(collectionView: collectionView)
        MapUnitCollectionViewCell.register(collectionView: collectionView)
        DetailUnitCollectionViewCell.register(collectionView: collectionView)
        
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    
    func setViewHierarchy() {
        self.addSubviews(collectionView)
    }
    
    func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        //
        //        profileView.snp.makeConstraints {
        //            $0.top.equalToSuperview().offset(8)
        //            $0.leading.equalToSuperview().offset(18)
        //            $0.height.equalTo(35)
        //        }
    }
    
    
}



extension DetailView {
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            let section: NSCollectionLayoutSection
            let footerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(1.0)
            )
            let footer = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: footerSize,
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            
            // Define layouts for different sections
            switch sectionIndex {
            case 0: // Profile header section / info section
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(35)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(295)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, repeatingSubitem: item, count: 1)
                
                section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 22, bottom: 10, trailing: 22)
                section.boundarySupplementaryItems = [header,footer]
                
            case 1: // Map unit section
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(196)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, repeatingSubitem: item, count: 1)
                
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 8
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 22, bottom: 20, trailing: 22)
                section.boundarySupplementaryItems = [footer]
                
            case 2: // Detail unit section
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(80)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, repeatingSubitem: item, count: 1)
                
                section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 22, bottom: 20, trailing: 22)
                
            default:
                return nil
            }
            
            
            
            return section
        }
        
        return layout
    }
}

extension DetailView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = InfoUnitCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
            
        } else if indexPath.section == 1 {
            let cell = MapUnitCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        } else if indexPath.section == 2 {
            let cell = DetailUnitCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ProfileHeaderView.identifier,
                for: indexPath
            ) as? ProfileHeaderView else {
                return UICollectionReusableView()
            }
            return header
        } else if kind == UICollectionView.elementKindSectionFooter {
            // Dequeue reusable supplementary view for footer
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LineView.identifier, // 보조 뷰의 식별자를 지정해야 함
                for: indexPath
            ) as? LineView else {
                return UICollectionReusableView()
            }
            // Configure and return the footer view
            
            // ...
            // 보조 뷰에 대한 구성 및 설정 작업
            
            return footer
        }
        
        return UICollectionReusableView()
    }
    
}

