//
//  ViewController.swift
//  newlyCoinedWord Project
//
//  Created by Junhee Yoon on 2022/07/08.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var exButton1: UIButton!
    @IBOutlet weak var exButton2: UIButton!
    @IBOutlet weak var exButton3: UIButton!
    @IBOutlet weak var exButton4: UIButton!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let answerDic = ["스불재": "스스로 불러온 재앙의 줄임말로 자신이 계획한 일로 자신이 고통받을 때 사용한다.", "억텐": "억지 텐션의 줄임말로 억지로 텐션을 올려서 발랄하게 할 때 사용한다.", "쫌쫌따리": "아주 조금씩 하찮은 양을 모으는 모습", "점메추": "점심 메뉴 추천", "킹받다": "열받다는 뜻으로 킹을 붙여 강조한 의미. 자매품으로 킹받드라슈가 있음", "군싹": "군침이 싹 도네의 줄임말로 뽀로로 루피 짤과 함께 퍼지기 시작한 신조어.", "갓생": "신을 뜻하는 갓(God)과 인생을 합친 말로 부지런하고 남의 모범이 되는 삶을 사는 것을 의미한다.", "오히려좋아": "좋지 않은 상황임에도 좋은 점을 찾아낼 때 쓰는 말", "웃안웃": "웃긴데 안 웃겨의 줄임말로 웃기지만 슬픈, 웃기지만 웃기지만은 않은 상황을 말하는 것을 의미한다.", "쩝쩝박사": "음식의 맛있는 조합을 잘 아는 사람을 칭찬할 때 쓰는 말"]
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextField()
        configureExButtons(exButton1, titles: "스불재")
        configureExButtons(exButton2, titles: "억텐")
        configureExButtons(exButton3, titles: "쫌쫌따리")
        configureExButtons(exButton4, titles: "점메추")


        
        
    }

    // MARK: - Helper Functions
    
    func configureExButtons(_ buttons: UIButton, titles: String) {
        buttons.setTitle(titles, for: .normal)
        buttons.setTitleColor(.black, for: .normal)
        buttons.layer.cornerRadius = 8
        buttons.clipsToBounds = true
        buttons.layer.borderColor = UIColor.black.cgColor
        buttons.layer.borderWidth = 0.8
    }
    
    func configureTextField() {
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.borderWidth = 4
        searchTextField.textAlignment = .left
        searchTextField.returnKeyType = .search
    }
    
    func configureAnswerLabel() {
        answerLabel.textAlignment = .center
        answerLabel.font = UIFont.systemFont(ofSize: 18)
        answerLabel.textColor = .black
        answerLabel.numberOfLines = 3
    }
    
    // MARK: - IBActions
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        let text = searchTextField.text?.components(separatedBy: [" ", ".", ",", "!", "?"]).joined()
        
        answerLabel.text = answerDic[text ?? "", default: "검색결과 없음"]
    }
    
    @IBAction func rootViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func exButtonTapped(_ sender: UIButton) {
        
        guard let button = sender as UIButton? else { return }
        
        switch button {
        case exButton1:
            answerLabel.text = answerDic[exButton1.currentTitle ?? "", default: "검색결과 없음"]
        case exButton2:
            answerLabel.text = answerDic[exButton2.currentTitle ?? "", default: "검색결과 없음"]
        case exButton3:
            answerLabel.text = answerDic[exButton3.currentTitle ?? "", default: "검색결과 없음"]
        case exButton4:
            answerLabel.text = answerDic[exButton4.currentTitle ?? "", default: "검색결과 없음"]
        default:
            answerLabel.text = "검색결과 없음"
        }
    }
    
    @IBAction func searchKeyTapped(_ sender: UITextField) {
        
        let text = searchTextField.text?.components(separatedBy: [" ", ".", ",", "!", "?", "*", "@"]).joined()
        
        answerLabel.text = answerDic[text ?? "", default: "검색결과 없음"]
        
        view.endEditing(true)
    }
}

