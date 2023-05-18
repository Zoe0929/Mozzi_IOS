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
        stackView.addArrangeSubViews(mainImageView,labelView,itemTitleLabel,locationLabel,priceLabel)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.makeCornerRound(radius: 10)
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "식사"
        label.font = .pretendardMedium(ofSize: 10)
        label.textColor = .white
        return label
    }()
    private let labelView: UIView = {
       let view = UIView()
        view.backgroundColor = .mozziMain
        view.makeCornerRound(radius: 10)
        return view
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
        labelView.addSubview(categoryLabel)
    }
    
    private func setConstraints() {
        infoStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        labelView.snp.makeConstraints{
            $0.width.equalTo(32)
            $0.height.equalTo(20)
        }
        
        categoryLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.width.equalTo(340)
            $0.height.equalTo(170)
            $0.centerX.equalToSuperview()
        }
    }
    
}
