//
//  DetailUnitCollectionViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/17.
//

import UIKit

class DetailUnitCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "역시 학교 근처에서는 크라이치즈 버거가 최고의 햄버거집인거 같다. 근본의 치즈 버거는 배신하지 않는다. 가격이 비싼건 조금 아쉽긴 하지만.. 그래도 또 올 것 같다"
        label.numberOfLines = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(detailLabel)
    }
    
    private func setConstraints() {
        detailLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}
