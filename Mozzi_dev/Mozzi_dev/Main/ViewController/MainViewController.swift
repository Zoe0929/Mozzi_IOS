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
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.plusButtonImage, for: .normal)
        button.setImage(Images.plusButtonTapImage, for: .selected)
        button.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var cameraButton: UIButton = {
        let button = UIButton()
        button.setTitle("더하기", for: .normal)
        button.setImage(Images.cameraButtonImage, for: .normal)
        button.backgroundColor = .mozziMain
        button.addTarget(self, action: #selector(writeButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var fileButton: UIButton = {
        let button = UIButton()
        button.setTitle("파일 추가", for: .normal)
        button.setImage(Images.fileButtonImage, for: .normal)
        button.backgroundColor = .mozziMain
        return button
    }()
    
    lazy var writeButton: UIButton = {
        let button = UIButton()
        button.setTitle("기록하기", for: .normal)
        button.setImage(Images.writeButtonImage, for: .normal)
        button.backgroundColor = .mozziMain
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(cameraButton,fileButton,writeButton)
        stackView.axis = .vertical
        stackView.makeCornerRound(radius: 10)
        stackView.isHidden = true
        return stackView
    }()
    
    lazy var buttons: [UIButton] = [self.cameraButton, self.fileButton, self.writeButton]
    var buttonIsHidden: Bool = true

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
    
    private var flag: Bool = false
    @objc func addButtonDidTap(_ sender: UIButton){
//        let image = self.buttonIsHidden ? Images.plusButtonImage : Images.plusButtonTapImage
        
//        sender.setImage(image, for: .normal)
        sender.isSelected = !sender.isSelected
        UIView.animate(withDuration: 0.5) {
            if self.buttonIsHidden {
                sender.transform = CGAffineTransform(rotationAngle: .pi - (.pi / 2))
            } else {
                sender.transform = .identity
            }
        }
        buttonIsHidden = !buttonIsHidden

//
//        let roatation = buttonIsHidden ? CGAffineTransform(rotationAngle: .pi - (.pi / 2)) : CGAffineTransform.identity
        
        
        if buttonIsHidden {
            buttons.reversed().forEach { button in
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
        } else{
            buttonStack.isHidden = buttonIsHidden
            buttons.forEach { [weak self] button in
                button.isHidden = false
                button.alpha = 0

                UIView.animate(withDuration: 0.3) {
                    button.alpha = 1
                    self?.view.layoutIfNeeded()
                }
            }
        }
        
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
        view.addSubview(addButton)
        view.addSubview(buttonStack)
        
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
        addButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(130)
        }
        
        buttonStack.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(addButton.snp.top).offset(-20)
        }
        
    }
    
    private func insertDataSource() {
        horizontalScrollView.dataSource = Mocks.getDataSource()
    }
    
    @objc func tapButton(_ button: UIBarButtonItem){
        let notificationVC = NotificationTableViewController()
        self.navigationController?.pushViewController(notificationVC, animated: true)
    }
    
    @objc func writeButtonDidTap (){
        let nextVC = CameraViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
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
