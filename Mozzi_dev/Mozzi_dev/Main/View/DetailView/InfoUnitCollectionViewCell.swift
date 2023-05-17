//
//  infoUnitCollectionViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/17.
//

import UIKit

final class InfoUnitCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private lazy var infoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(mainImageView,itemTitleLabel,locationLabel,priceLabel)
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.makeCornerRound(radius: 10)
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "더블치즈 버거"
        label.font = .pretendardBold(ofSize: 20)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "서울시 동작구 상도로 61길 25 1층"
        label.font = .pretendardMedium(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "8,900"
        label.font = .pretendardMedium(ofSize: 16)
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
        self.addSubviews(infoStackView)
    }
    
    private func setConstraints() {
        infoStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mainImageView.snp.makeConstraints {
            $0.width.equalTo(340)
            $0.height.equalTo(170)
        }
    }
    
}
