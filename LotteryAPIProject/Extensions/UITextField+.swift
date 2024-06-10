//
//  UITextField+.swift
//  LotteryAPIProject
//
//  Created by 양승혜 on 6/5/24.
//

import UIKit

extension UITextField {
    func lotteryTextField() {
        self.backgroundColor = .clear
        self.borderStyle = .roundedRect
        self.textAlignment = .center
        self.placeholder = "회차를 선택하세요"
        self.tintColor = .clear
    }
}
