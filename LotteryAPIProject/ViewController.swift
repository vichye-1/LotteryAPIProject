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
    }
    
    func configureLayout() {
        lotteryTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
    
    func configureUI() {
        lotteryTextField.backgroundColor = .lightGray
        
    }
    

}

