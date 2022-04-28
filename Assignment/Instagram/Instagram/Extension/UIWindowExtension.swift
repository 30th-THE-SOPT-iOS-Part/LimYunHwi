//
//  UIWindowExtension.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/22.
//

import UIKit

extension UIWindow {
    func replaceRootViewController(_ viewController : UIViewController, animated: Bool, completion: (()-> Void)? ){
        let snapShotImageview = UIImageView(image: self.snapShot())
        self.addSubview(snapShotImageview)
        
        let dismissCompletion = {() -> Void in
            self.rootViewController = viewController
            self.bringSubviewToFront(snapShotImageview)
            
            if animated {
                UIView.animate(
                    withDuration: 0.4,
                    animations: { () -> Void in
                        snapShotImageview.alpha = 0
                    },
                    completion: { (success) -> Void in
                        snapShotImageview.removeFromSuperview()
                        guard let completion = completion else {return}
                        completion()

                    })
            } else {
                snapShotImageview.removeFromSuperview()
                guard let completion = completion else {return}
                completion()
            }
        }
        
        if self.rootViewController!.presentedViewController != nil {
            self.rootViewController?.dismiss(animated: true, completion: dismissCompletion)
        } else {
            dismissCompletion()
        }
    }
    
    //현재 화면을 캡쳐하는 메서드, 캡쳐한 이미지를 반환한다.
    func snapShot() -> UIImage {
        //비트맵 context는 stack구조이다
        
        //캠퍼스
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale) //지정한 옵션에 맞게 비트맵 context 생성
        //뷰의 크기와 현재 메인 스크린의 scale로 비트맵을 생성한다. 비트맵 이미지는 불투명하지 않다(false).
        
        //캠퍼스에 그림그리기
        drawHierarchy(in: bounds, afterScreenUpdates: true) //현재 context에 화면에 보여지고 있는 전체 뷰 계층구조의 스냅샷을 렌더링한다.
        //즉, 위에서 만든 비트맵 context에 지금 보여지고 있는 화면을 그려낸다.
        //뷰의 크기와 위치(bound)로 최근 변경 사항을 반영(true)하여 렌더링한다.
        
        //화실에서 그림 가져오기
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else {return UIImage.init()} //가장 최근 생성한 비트맵 context 가져오기
        //이 메서드는 비트맵 그래픽 context가 현재 context일때 호출될 수 있다.
        //만약 현재 context가 nil이라면 nil을 반환한다. 따라서 옵셔널 바인딩 필요
        
        //화실에서 그림 치우기
        UIGraphicsEndImageContext() //현재 비트맵 context를 지우고 drawing 환경 정리하기
        //비트맵 context가 stack구조로 쌓여있는데, 그 중 top에 위치한 context pop하기
        
        return result
    }
}
