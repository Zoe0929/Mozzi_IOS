//
//  MypageViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit
import SnapKit

class MypageViewController: UITabBarController {
    
    let mypageBackgroundImage = UIImage(named: "profileBackground")

    lazy var mypageBackgroundImageView = UIImageView(image: mypageBackgroundImage)
    lazy var profileView = Mozzi_dev.profileView()


    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    private func setView(){
        setViewHierarchy()
        setLayout()
    }
    
    private func setViewHierarchy(){
        view.backgroundColor = .white
        view.addSubview(mypageBackgroundImageView)
        view.addSubview(profileView)
        
    }
    
    private func setLayout(){
        mypageBackgroundImageView.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview()
        }
        profileView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
