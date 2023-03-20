//
//  MapViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit

class MapViewController: UITabBarController {
    
    lazy var SearchView = UIImageView()
    lazy var SearchTextField = UITextField()
    lazy var SearchButton = UIButton()
    lazy var SocialButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure(){
        
        let image = UIImage(named: "searchBar")
        
        view.addSubview(SearchView)
        view.addSubview(SearchTextField)
        view.addSubview(SearchButton)
        view.addSubview(SocialButton)
        
        
        SearchView.image = image
        SearchView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(65)
            make.left.equalToSuperview().offset(8)
            make.width.height.equalTo(40)
        }
        
        SearchButton.setImage(UIImage(named: "search"), for: .normal)
        SearchButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(65)
            make.right.equalToSuperview().offset(-44)
            make.width.height.equalTo(40)
        }
        SocialButton.setImage(UIImage(named: "social"), for: .normal)
        SocialButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(65)
            make.right.equalToSuperview().offset(-8)
            make.width.height.equalTo(40)
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
