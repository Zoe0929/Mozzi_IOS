//
//  MapViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit

class MapViewController: UITabBarController {
    
    lazy var topAreaView = UIImageView()
    lazy var SearchView = UIImageView()
    lazy var SearchTextField = UITextField()
    lazy var SearchButton = UIButton()
    lazy var SocialButton = UIBarButtonItem()
    lazy var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure(){
        
        let searchBarImage = UIImage(named: "searchBar")
        let areaImage = UIImage(named: "topArea")
        let socialImage = UIImage(named: "social")?.withRenderingMode(.alwaysOriginal)
        
        
        view.addSubview(topAreaView)
        
        topAreaView.image = areaImage
        topAreaView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(-5)
            make.width.equalToSuperview()
        }
        
        SocialButton.image = socialImage
        self.navigationItem.rightBarButtonItem = SocialButton
       
        searchBar.placeholder = "검색어를 입력해주세요."
        searchBar.backgroundImage = searchBarImage
        self.navigationItem.titleView = searchBar
        
        topAreaView.addSubview(SearchView)
       // topAreaView.addSubview(SearchButton)
       // SearchView.addSubview(SearchTextField)
        
        
//        SearchView.image = searchBarImage
//        SearchView.snp.makeConstraints{make in
//            make.top.equalToSuperview().offset(65)
//            make.left.equalToSuperview().offset(8)
//        }
//
//        SearchTextField.placeholder = "검색어를 입력해주세요"
//        SearchTextField.snp.makeConstraints{make in
//            make.top.equalToSuperview().offset(5)
//            make.left.equalToSuperview().offset(5)
//        }
//
//        SearchButton.setImage(UIImage(named: "search"), for: .normal)
//        SearchButton.snp.makeConstraints{make in
//            make.top.equalToSuperview().offset(65)
//            make.right.equalToSuperview().offset(-44)
//            make.width.height.equalTo(40)
//        }
        
        
        
        
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
