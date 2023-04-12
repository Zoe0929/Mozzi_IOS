//
//  WishListView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/31.
//

import UIKit
import SnapKit

class WishListView: UIView {
    //UIComponent
    private let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    private let wishLabel: UILabel = {
        let label = UILabel()
        label.text = "닌텐도 스위치"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let wishImage = UIImage(named:"wishImage")
    
    private let wishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"wishImage")
        return imageView
    }()
    
    private let newButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "buttonBackground_2"), for: .normal)
        button.setTitleColor(UIColor(named: "main Color"), for: .normal)
        button.setTitle("New", for: .normal)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "minus"), for: .normal)
        return button
    }()
    
    private let valButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "buttonBackground"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Val", for: .normal)
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
    }()
    
    private lazy var newButtonStack: UIStackView = {
       let stackView = UIStackView()
        stackView.addArrangeSubViews(newButton,minusButton)
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var valButtonStack: UIStackView = {
       let stackView = UIStackView()
        stackView.addArrangeSubViews(valButton,plusButton)
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var wishStackView:UIStackView  = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(wishImageView,newButtonStack,valButtonStack)
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

}

private extension WishListView {
    func setLayout() {
        
        addSubviews(wishLabel,wishStackView)
        
        wishLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
        }
        wishStackView.snp.makeConstraints{
            $0.top.equalTo(wishLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
