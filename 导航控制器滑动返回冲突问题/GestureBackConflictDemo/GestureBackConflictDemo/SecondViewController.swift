//
//  SecondViewController.swift
//  GestureBackConflictDemo
//
//  Created by Sinno on 2021/2/7.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondVC"
        self.configSubvews()
        // 方案1:调用require(toFail:)方法，建立手势依赖关系
//        if let popGesture = self.navigationController?.interactivePopGestureRecognizer {
//            self.scrollView.panGestureRecognizer.require(toFail: popGesture)
//        }
    }
    
    func configSubvews() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        contentView.backgroundColor = .gray
        view.addSubview(contentView)
        // 设置contentSize.width大于scrollView的width,即可横向滚动
        view.contentSize = CGSize(width: 1000, height: 1000)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
