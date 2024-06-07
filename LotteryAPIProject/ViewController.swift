//
//  ViewController.swift
//  LotteryAPIProject
//
//  Created by 양승혜 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

struct Lotto: Decodable {
    let drwNoDate: String
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

class ViewController: UIViewController {
    
    let lotteryTextField = UITextField()
    let infoLabel = UILabel()
    let dateLabel = UILabel()
    let dividerView = UIView()
    //let countLabel = UILabel()
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
    let ballStackView = UIStackView()
    let bonusLabel = UILabel()
    let numberPicker = UIPickerView()
    
    lazy var balls = [ball1Label, ball2Label, ball3Label, ball4Label, ball5Label, ball6Label, plusLabel, ball7Label]
    var lotteryRound = Array(1...1122)
    var selectedRound: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureUI()
        ballStackViewSettings()
        configurePickerView()
    }
    
    func configureHierachy() {
        view.addSubview(lotteryTextField)
        view.addSubview(numberPicker)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(dividerView)
        //view.addSubview(countLabel)
        view.addSubview(resultLabel)
        view.addSubview(backgroundView)
        view.addSubview(ballStackView)
        view.addSubview(bonusLabel)
        
        for ball in balls {
            ballStackView.addArrangedSubview(ball)
        }
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
            make.width.equalTo(view.frame.width / 2)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(lotteryTextField.snp.bottom).offset(28)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(34)
            make.width.equalTo(view.frame.width / 2)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(1)
        }
        
//        countLabel.snp.makeConstraints { make in
//            make.top.equalTo(dividerView.snp.bottom).offset(28)
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(44)
//            make.width.equalTo(view.frame.width / 2)
//        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(28)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        ballStackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(28)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        
        for ball in balls {
            ball.snp.makeConstraints { make in
                make.width.height.equalTo(ballStackView.snp.height)
            }
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(ballStackView.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(20)
        }
        
        numberPicker.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            
        }
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        lotteryTextField.lotteryTextField()
        infoLabel.infoLabelUI()
        dateLabel.dateLabelUI()
        dividerView.backgroundColor = .lightGray
        //countLabel.countLotteryLabelUI()
        resultLabel.countLotteryLabelUI()
        ball1Label.ballLabelUI()
        ball2Label.ballLabelUI()
        ball3Label.ballLabelUI()
        ball4Label.ballLabelUI()
        ball5Label.ballLabelUI()
        ball6Label.ballLabelUI()
        plusLabel.plusLabelUI()
        ball7Label.ballLabelUI()
        bonusLabel.bonusLabelUI()
    }
    
    func ballStackViewSettings() {
        ballStackView.axis = .horizontal
        ballStackView.alignment = .fill
        ballStackView.distribution = .fillEqually
        ballStackView.spacing = 4
    }
    
    func ballColors(ballNum: Int) -> UIColor {
        switch ballNum {
        case 1...10:
            return .systemYellow
        case 11...20:
            return .systemCyan
        case 21...30:
            return .systemPink
        case 31...40:
            return .gray
        case 41...45:
            return .systemGreen
        default:
            return .lightGray
        }
    }
    
    func updateBalls(num: Lotto) {
        let numbers = [num.drwtNo1, num.drwtNo2, num.drwtNo3, num.drwtNo4, num.drwtNo5, num.drwtNo6, num.bnusNo]
        let ballLabels = [ball1Label, ball2Label, ball3Label, ball4Label, ball5Label, ball6Label, ball7Label]
        
        for (idx, num) in numbers.enumerated() {
            ballLabels[idx].text = "\(num)"
            ballLabels[idx].backgroundColor = ballColors(ballNum: num)
        }
        dateLabel.text = "\(num.drwNoDate) 추첨"
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func configurePickerView() {
        numberPicker.delegate = self
        numberPicker.dataSource = self
        lotteryTextField.inputView = numberPicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lotteryRound.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(lotteryRound[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRound = lotteryRound[row]
        lotteryTextField.text = "\(lotteryRound[row])"
        getLottoInfo(round: lotteryRound[row])
    }
    
    func getLottoInfo(round: Int) {
        let url = "\(APIURL.lottoURL)\(lotteryTextField.text!)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                // print(value.drwNoDate)
                self.updateBalls(num: value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
