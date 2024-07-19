//
//  ViewController.swift
//  JXButton
//
//  Created by 火山传媒 on 2024/7/19.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = JXButton(type: .custom)
        button1.backgroundColor = .yellow
        button1.setTitle("测试1", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.setImage(UIImage(named: "apple"), for: .normal)
        button1.jx_font = .systemFont(ofSize: 15)
        button1.titleDirection = .up
        button1.space = 10
        view.addSubview(button1)
        
        button1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(100)
        }
        
        let button2 = JXButton(type: .custom)
        button2.backgroundColor = .yellow
        button2.setTitle("测试2", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.setImage(UIImage(named: "apple"), for: .normal)
        button2.jx_font = .systemFont(ofSize: 15)
        button2.titleDirection = .down
        button2.space = 10
        view.addSubview(button2)
        
        button2.snp.makeConstraints { make in
            make.left.equalTo(button1.snp.right).offset(20)
            make.top.equalTo(button1)
        }
        
        let button3 = JXButton(type: .custom)
        button3.backgroundColor = .yellow
        button3.setTitle("测试3", for: .normal)
        button3.setTitleColor(.black, for: .normal)
        button3.setImage(UIImage(named: "apple"), for: .normal)
        button3.jx_font = .systemFont(ofSize: 15)
        button3.titleDirection = .left
        button3.space = 10
        view.addSubview(button3)
        
        button3.snp.makeConstraints { make in
            make.left.equalTo(button1)
            make.top.equalTo(button1.snp.bottom).offset(50)
        }
        
        let button4 = JXButton(type: .custom)
        button4.backgroundColor = .yellow
        button4.setTitle("测试4", for: .normal)
        button4.setTitleColor(.black, for: .normal)
        button4.setImage(UIImage(named: "apple"), for: .normal)
        button4.jx_font = .systemFont(ofSize: 15)
        button4.titleDirection = .right
        button4.space = 10
        view.addSubview(button4)
        
        button4.snp.makeConstraints { make in
            make.left.equalTo(button3.snp.right).offset(20)
            make.top.equalTo(button3)
        }
        
        
    }


}


