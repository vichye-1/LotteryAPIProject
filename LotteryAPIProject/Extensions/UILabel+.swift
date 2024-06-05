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
        self.textColor = .gray
        self.font = .systemFont(ofSize: 13)
    }
    
    func countLotteryLabelUI() {
        self.text = "913회"
        self.textColor = .systemYellow
        self.textAlignment = .right
        self.font = .boldSystemFont(ofSize: 28)
    }
    
    func resultLabelUI() {
        self.text = " 당첨결과"
        self.textColor = .black
        self.textAlignment = .left
        self.font = .systemFont(ofSize: 28)
    }
    
    func ballLabelUI() {
        self.backgroundColor = .green
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
    }
}
