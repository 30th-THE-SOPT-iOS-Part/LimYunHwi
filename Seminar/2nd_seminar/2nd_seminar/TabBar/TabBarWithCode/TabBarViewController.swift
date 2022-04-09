//
//  TabBarViewController.swift
//  2nd_seminar
//
//  Created by limyunhwi on 2022/04/09.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       setTabBar()
    }
    
    func setTabBar(){
        //1. ViewController 인스턴스화
         guard let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController"),
               let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
         else { return }

        //2.
        firstVC.tabBarItem = UITabBarItem (
           title : "home",
           image: UIImage(named: "home"),
           selectedImage: UIImage(named: "homefilled")
         )
        secondVC.tabBarItem = UITabBarItem (
           title : "user",
           image: UIImage(named: "user"),
           selectedImage: UIImage(named: "userfilled")
         )

         //3. 연결 화면 - ViewController
         setViewControllers([firstVC, secondVC], animated: true)
       }

}
