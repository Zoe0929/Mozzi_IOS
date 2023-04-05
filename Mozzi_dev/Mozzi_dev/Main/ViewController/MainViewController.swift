//
//  MainViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit
import SnapKit
import FSCalendar



class MainViewController: UITabBarController,FSCalendarDelegate,FSCalendarDataSource {
    
    let notificaiotnImage = UIImage(named: "notification")
    lazy var horizontalScrollView: HorizontalScrollView = {
        let view = HorizontalScrollView()
        return view
    }()
    
    let backBarButtonItem = UIBarButtonItem(title: "이전", style: .plain, target: MainViewController.self, action: nil)
    fileprivate weak var fsCalendar: FSCalendar!
    lazy var profileButton: UIButton = UIButton()
    lazy var recentLabel: UILabel = UILabel()
    lazy var notificationButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(tapButton(_:)))
        button.setBackgroundImage(notificaiotnImage, for: .normal, barMetrics: .default)
        return button
    }()
    
    
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        insertDataSource()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .none
    }
    
    private func configure() {
        let fsCalendar = FSCalendar(frame: CGRect(x: 30, y: 150, width: 340, height: 400))
        
        fsCalendar.dataSource = self
        fsCalendar.delegate = self
        
        fsCalendar.appearance.headerTitleColor = .black
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0.0
        fsCalendar.appearance.weekdayTextColor = UIColor(named: "main Color")
        
        
        fsCalendar.layer.borderWidth = 3
        fsCalendar.layer.borderColor = UIColor(named: "main Color")?.cgColor
        fsCalendar.layer.shadowOffset = CGSize(width: 0, height: 10)
        fsCalendar.layer.shadowOpacity = 0.3
        fsCalendar.layer.shadowRadius = 0
        fsCalendar.layer.shadowColor = UIColor(named: "Dark Color")?.cgColor
        
        
        
        self.navigationItem.setRightBarButton(notificationButton, animated: false)
        backBarButtonItem.tintColor = darkColor
        self.navigationItem.backBarButtonItem = backBarButtonItem
        

        view.addSubview(recentLabel)
        view.addSubview(fsCalendar)
        view.addSubview(horizontalScrollView)
        
        
        
        self.fsCalendar = fsCalendar
        fsCalendar.backgroundColor = .white
        fsCalendar.layer.cornerRadius = 30
        
        
        
        fsCalendar.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
            make.width.equalTo(340)
            make.height.equalTo(400)
        }
        
        recentLabel.text = "Daily Use"
        recentLabel.snp.makeConstraints{ make in
            make.top.equalTo(fsCalendar.snp.bottom).offset(25)
            make.left.equalTo(30)
        }
        
        horizontalScrollView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(recentLabel.snp.bottom).offset(10)
        }
        
    }
    
    private func insertDataSource() {
        horizontalScrollView.dataSource = Mocks.getDataSource()
    }
    
    @objc func tapButton(_ button: UIBarButtonItem){
        let notificationVC = NotificationTableViewController()
        self.navigationController?.pushViewController(notificationVC, animated: true)
       
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
