//
//  ViewController.swift
//  GestureBackConflictDemo
//
//  Created by Sinno on 2021/2/7.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo"
        
        print(self.navigationController?.interactivePopGestureRecognizer?.delegate as Any)
        print(self.navigationController?.interactivePopGestureRecognizer?.view as Any)
        
        // 设置代理为自身
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let nav = self.navigationController, gestureRecognizer == nav.interactivePopGestureRecognizer else {
            return true
        }
        // 如果当前只有一个vc在栈中，侧滑返回必须禁止，否则会导致页面卡死
        return nav.viewControllers.count > 1
    }
    // 方案2：动态的设置interactivePopGestureRecognizer和otherGestureRecognizer的依赖关系
    // 此处直接返回true,则表明interactivePopGestureRecognizer 优先
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

