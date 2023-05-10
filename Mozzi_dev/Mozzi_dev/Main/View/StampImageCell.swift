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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetting() {
        addSubviews(img)
        img.contentMode = .scaleToFill
        img.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func configureCell(_ stampImage: StampImages) {
            
            img.image = stampImage.image
        }
}
