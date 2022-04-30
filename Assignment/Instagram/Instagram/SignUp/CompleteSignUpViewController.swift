//
//  CompleteSignUpViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/06.
//

import UIKit

class CompleteSignUpViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user: User?
    /*
     keyWindow는 주로 메인 window에서 가지고 있으며, 한 번에 한 window만 keyWindow가 될 수 있다.
     UIKit에서는 임의로 다른 window로 keyWindow를 변경할 수 있다.
     강제로 window를 keyWindow로 만들거나 강제로 window를 keyWindow에서 물러나게 하고 싶을 땐, UIWindow의 메서드를 사용하라.
     
     ++ UIWindow의 keyWindow 프로퍼티는 iOS 13 버전 이후로 사용 중지되었다.
     하지만 UIWindow에는 keyWindow 확인을 위한 isKeyWindow 프로퍼티가 아직 존재한다.
     아래 고차함수는 isKeyWindow 프로퍼티를 사용하며 keyWindow를 찾는 과정을 나타낸다.
     아직 UIApplivation과 UIScene의 대해 공부하지 못해 추후 공부 필요.
     */
    let keyWindow = UIApplication //iOS 앱 중앙 집중 및 조정 지점(?)
            .shared //싱글톤 형식의 앱 인스턴스.
            .connectedScenes //앱의 현재 연결된 scene, Set 타입 컬렉션
            .filter({$0.activationState == .foregroundActive}) //필터링, scene의 현재 실행 상태 : 앱이 실행 중이고 사용자 이벤트 상호작용 가능 (inactive : 전화)
            //.map({$0 as? UIWindowScene}) //필터링된 UIScene들을 UIWindowScene으로 다운캐스팅
            //.compactMap({$0}) //nil인 경우 제거
            .compactMap({$0 as? UIWindowScene}) //바로 compactMap()메서드를 사용해 다운캐스팅에 실패한 경우 컬렉션에 포함시키지 않는다.
            .first?.windows //컬렉션 중 첫번째 scene의 UIWindow 배열
            .filter({$0.isKeyWindow}).first //UIWindow 배열 중 keyWidow인 것들을 찾아 그 중 첫 번째 요소 반환.
            //근데 keyWindow는 한 window에만 있으므로 first 프로퍼티는 그저 확인용 같다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView(){
        if let user = user {
            self.welcomeLabel.text = "\(user.userName)님 Instagram에 오신 것을 환영합니다."
        }
    }
    
    @IBAction func tapDoneButton(_ sender: UIButton) {
        let tabBarControllerStoryboard = UIStoryboard(name: "TabBarController", bundle: nil)
        guard let tabBarController = tabBarControllerStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {return}
        tabBarController.modalPresentationStyle = .fullScreen

        self.present(tabBarController, animated: true) {
            self.keyWindow?.replaceRootViewController(tabBarController, animated: true, completion: nil) //UIWindow가 TabBarController를 가리키고 있다.
            //self.view.window?.replaceRootViewController(tabBarController, animated: true, completion: nil) //UIWindow가 TabBarController를 가리키고 있지 않다.
        }
    }
    
    @IBAction func tapSignInOtherAccountButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
