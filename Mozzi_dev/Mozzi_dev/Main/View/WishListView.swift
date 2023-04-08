//
//  WishListView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/31.
//

import UIKit

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
        button.setImage(UIImage(named: "buttonBackground_2"), for: .normal)
        button.setTitle("New", for: .normal)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "minus"), for: .normal)
        return button
    }()
    
    private lazy var newButtonStack: UIStackView = {
       let stackView = UIStackView()
        stackView.addSubviews(newButton,minusButton)
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var wishStackView:UIStackView  = {
        let stackView = UIStackView()
         stackView.addSubviews(wishImageView,newButtonStack)
         stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

}

private extension WishListView {
    func setLayout() {
        view.addSubviews(wishLabel,wishStackView)
        
        wishLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
        }
        wishStackView.snp.makeConstraints{
            $0.top.equalTo(wishLabel.snp.bottom).offset(20)
        }
    }
}
