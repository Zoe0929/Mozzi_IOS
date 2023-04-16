//
//  StampView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/13.
//

import UIKit
import SnapKit
import Then

class StampingImageCell : UICollectionViewCell {
    
    static let identifier = "cell"
    
    var img = UIImageView().then {
        $0.image = Images.eattingStampImage
    }
    
    var label = UILabel().then {
        $0.text = "먹기!"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetting() {
        self.backgroundColor = .gray
        addSubviews(img,label)
        img.contentMode = .scaleToFill
        img.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(0)
            $0.bottom.equalTo(-20)
        }
        label.snp.makeConstraints {
            $0.leading.bottom.trailing.equalTo(0)
            $0.top.equalTo(img.snp.bottom)
        }
    }
}
