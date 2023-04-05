//
//  PlaceListViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/03.
//
import UIKit
import SnapKit

class PlaceListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    private lazy var placeTableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    private(set) lazy var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        setViewHierarchy()
        setLayout()
    }
    
    private func setViewHierarchy(){
        placeTableView.dataSource = self
        placeTableView.delegate = self
        view.backgroundColor = .white
        //view.addSubview(collectionView)
    }
    
    private func setLayout(){
        placeTableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

extension PlaceListViewController {
    private func createLayout(){
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(400))
    }
}
