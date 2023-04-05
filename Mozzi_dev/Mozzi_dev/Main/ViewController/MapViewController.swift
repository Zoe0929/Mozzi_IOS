//
//  MapViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit

class MapViewController: UITabBarController {
    let subViewImage = UIImage(named: "back")
    
    lazy var topAreaView = UIImageView()
    lazy var SearchView = UIImageView()
    lazy var SearchTextField = UITextField()
    lazy var SearchButton = UIButton()
    lazy var SocialButton = UIBarButtonItem()
    lazy var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setPlaceListView()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setPlaceListView()
    }
    
    private func configure(){
        view.backgroundColor = .green
        
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
        
    }
    
    private func setPlaceListView() {
        print("modal init")
        let placeListViewController = PlaceListViewController()
        if let sheet = placeListViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
          }
        present(placeListViewController, animated: true)
        print("modal init")
    }
    
}
