//
//  MainTabBarController.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/03/12.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = UIColor.white
                
        let mapNC = UINavigationController.init(rootViewController: MapViewController())
        let mainNC = UINavigationController.init(rootViewController: MainViewController())
        let mypageNC = UINavigationController.init(rootViewController: MypageViewController())

        self.viewControllers = [mapNC,mainNC,mypageNC]
                
        let mapTabBarItem = UITabBarItem(title: " ", image: UIImage(named: "map"), tag: 0)
        let mainTabBarItem = UITabBarItem(title: " ", image: UIImage(named: "home"), tag: 1)
        let mypageTabBarItem = UITabBarItem(title: " ", image: UIImage(named: "mypage"), tag: 2)
                
        mapNC.tabBarItem = mapTabBarItem
        mainNC.tabBarItem = mainTabBarItem
        mypageNC.tabBarItem = mypageTabBarItem
        
        self.selectedIndex = 1 // 원하는 인덱스
        self.tabBar.backgroundColor = UIColor(named: "Dark Color")
        // Do any additional setup after loading the view.
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
