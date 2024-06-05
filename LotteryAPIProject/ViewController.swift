//
//  ViewController.swift
//  LotteryAPIProject
//
//  Created by 양승혜 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    let lotteryTextField = UITextField()
    let infoLabel = UILabel()
    let dateLabel = UILabel()
    let dividerView = UIView()
    let resultLabel = UILabel()
    let backgroundView = UIView()
    let ball1Label = UILabel()
    let ball2Label = UILabel()
    let ball3Label = UILabel()
    let ball4Label = UILabel()
    let ball5Label = UILabel()
    let ball6Label = UILabel()
    let plusLabel = UILabel()
    let ball7Label = UILabel()
    let bonusLabel = UILabel()
    let numberPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    func configureHierachy() {
        view.addSubview(lotteryTextField)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
    }
    
    func configureLayout() {
        lotteryTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(50)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(lotteryTextField.snp.bottom).offset(28)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(34)
            make.width.equalTo(130)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(lotteryTextField.snp.bottom).offset(28)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(34)
            make.width.equalTo(130)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        lotteryTextField.backgroundColor = .lightGray
        infoLabel.backgroundColor = .red
        dateLabel.backgroundColor = .orange
    }
    

}

