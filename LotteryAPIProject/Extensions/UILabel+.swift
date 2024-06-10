//
//  UILabel+.swift
//  LotteryAPIProject
//
//  Created by 양승혜 on 6/5/24.
//

import UIKit
import SnapKit

extension UILabel {
    func infoLabelUI() {
        self.text = "당첨번호 안내"
        self.textAlignment = .left
        self.textColor = .black
        self.font = .systemFont(ofSize: 15)
    }
    
    func dateLabelUI() {
        self.text = "2020-05-30 추첨"
        self.textAlignment = .right
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 13)
    }
    
    func countLotteryLabelUI() {
        self.text = "1122회 당첨결과"
        self.font = .boldSystemFont(ofSize: 24)
        self.textAlignment = .center
//        let fontsize = UIFont.boldSystemFont(ofSize: 28)
//        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
//        attributedStr.addAttribute(.font, value: fontsize, range: (self.text as! NSString).range(of: "1122회"))
//        attributedStr.addAttribute(.foregroundColor, value: UIColor.systemYellow, range: (self.text as! NSString).range(of: "1122회"))
//        self.textColor = .systemYellow
//        self.font = .boldSystemFont(ofSize: 28)
    }
    
    func ballLabelUI() {
        self.backgroundColor = .systemYellow
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
        self.textAlignment = .center
        self.font = .boldSystemFont(ofSize: 17)
        self.textColor = .white
    }
    
    func plusLabelUI() {
        self.text = "+"
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 20)
    }
    
    func bonusLabelUI() {
        self.text = "보너스"
        self.textAlignment = .right
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 15)
    }
}
