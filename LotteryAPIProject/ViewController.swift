//
//  ViewController.swift
//  LotteryAPIProject
//
//  Created by 양승혜 on 6/5/24.
//

// 1. 커서 없애기
// 2. 텍스트필드 위에 투명한 뷰 올려서 사용자 입력 막기
// 3. 화면 터치했을 때 피커뷰 내려가게

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
    
    var lotteryTextField = UITextField()
    let invisibleView = UIView()
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
    let ballStackView = UIStackView()
    let bonusLabel = UILabel()
    let numberPicker = UIPickerView()
    
    lazy var balls = [ball1Label, ball2Label, ball3Label, ball4Label, ball5Label, ball6Label, plusLabel, ball7Label]
    var lotteryRound = Array(Array(1...1122).reversed())
    var selectedRound: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureUI()
        ballStackViewSettings()
        configurePickerView()
        if let first = lotteryRound.first {
            getLottoInfo(round: first)
        }
    }
    
    func configureHierachy() {
        view.addSubview(lotteryTextField)
        view.addSubview(numberPicker)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(dividerView)
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
        resultLabel.countLotteryLabelUI()
        
        DispatchQueue.main.async {
            self.ball1Label.ballLabelUI()
            self.ball2Label.ballLabelUI()
            self.ball3Label.ballLabelUI()
            self.ball4Label.ballLabelUI()
            self.ball5Label.ballLabelUI()
            self.ball6Label.ballLabelUI()
            self.plusLabel.plusLabelUI()
            self.ball7Label.ballLabelUI()
        }
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
        resultLabel.text = "\(num.drwNo)회 당첨결과"
    }
    
//    func latestRound() {
//        var maxRound = 1122
//
//        func checklatest(round: Int) {
//            let url = "\(APIURL.lottoURL)\(round)"
//            AF.request(url).responseDecodable(of: Lotto.self) { response in
//                switch response.result {
//                case .success(let value):
//                    checklatest(round: round + 1)
//                    self.selectedRound = value.drwNo
//                    self.lotteryTextField.text = "\(value.drwNo)"
//                    self.updateBalls(num: value)
//                case .failure(let error):
//                    if round > 1 {
//                        checklatest(round: round - 1)
//                    } else {
//                        print("error")
//                    }
//                }
//            }
//        }
//    }
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
        let url = "\(APIURL.lottoURL)\(round)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.updateBalls(num: value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
