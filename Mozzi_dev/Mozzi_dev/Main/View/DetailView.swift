//
//  DetailView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/16.
//

import UIKit
import SnapKit
import Then

class DetailView : BaseView {
    let profileStackView: UIStackView = {
       let stackView = UIStackView()
        return stackView
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var infoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let placeNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    func setViewHierarchy() {
        <#code#>
    }
    
    func setConstraints() {
        <#code#>
    }
    
    
}
