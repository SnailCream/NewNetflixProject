//
//  ViewController.swift
//  NewNetflixProject
//
//  Created by Carki on 2022/07/15.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet var userTextFieldCollection: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        buttonDesign(UIButton: signupButton)
        titleLabelDesign(UILabel: titleLabel)
        userTextFieldDesign(textField: userTextFieldCollection)
        
    }
    
    func titleLabelDesign(UILabel: UILabel) {
        UILabel.text = "JUNFLIX"
        UILabel.textColor = UIColor.red
        UILabel.font = .boldSystemFont(ofSize: 30)
    }
    func buttonDesign(UIButton: UIButton) {
        UIButton.setTitle("회원가입", for: .normal)
        UIButton.backgroundColor = .white
        UIButton.setTitleColor(.black, for: .normal)
        UIButton.layer.cornerRadius = 10
        UIButton.clipsToBounds = true
    }
    
    func userTextFieldDesign(textField: [UITextField]) {
        let textArr = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "위치", "추천 코드 입력"]
        
        for i in 0..<5 {
            textField[i].backgroundColor = .gray
            textField[i].attributedPlaceholder = NSAttributedString(string: textArr[i], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        }
    }
    
    //텍스트 필드 글자 수 세는 함수
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//            // backspace 허용
//            if let char = string.cString(using: String.Encoding.utf8) {
//                let isBackSpace = strcmp(char, "\\b")
//                if isBackSpace == -92 {
//                    return true
//                }
//            }
//
//            guard let text = textField.text else { return false }
//            if text.count <= MAX_LENGHT {
//                return false
//            }
//
//            return true
//        }
    
    //뷰 컨트롤러 전환 함수
    func nextViewController() {
//      if let signUp = self.storyboard?.instantiateViewController(withIdentifier: "nextView") as? NextViewViewController {
//          present(signUp, animated: true, completion: nil) //show타입
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "nextView") else {return}
        self.navigationController?.pushViewController(nextVC, animated: true) //push타입
        }
        
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //회원가입 버튼 클릭 이벤트
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        //ID 조건을 만족하지 못하면 Alert으로 경고문 표시 -> addAction
        let alertID = UIAlertController(title: "경고", message: "ID는 필수적으로 입력해야됩니다.", preferredStyle: UIAlertController.Style.alert)
        
        //PW 조건을 만족하지 못하면 Alert으로 경고문 표시 -> addAction
        let alertPW = UIAlertController(title: "경고", message: "PW는 필수적으로 입력해야됩니다.", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in} //Alert에 OK옵션 추가
        alertID.addAction(okAction) //ID Alert
        alertPW.addAction(okAction) //PW Alert
        
        //ID텍스트 필드에 아무런 텍스트가 입력이 안될시
        guard userTextFieldCollection[0].text?.isEmpty == false else{
            //ID텍스트필드 붉은색 Placeholder로 경고 표시
            userTextFieldCollection[0].attributedPlaceholder = NSAttributedString(string: "ID는 필수적으로 입력해야 합니다.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            //ID텍스트 필드 조건이 만족하지 않으면 Alert에 경고문 표시
            return present(alertID, animated: false, completion: nil)
        }
        
        //PW텍스트 필드에 6글자 이상의 텍스트 입력을 안할시
        guard userTextFieldCollection[1].text!.count >= 6 else {
            //PW텍스트필드 붉은색 Placeholder로 경고 표시
            userTextFieldCollection[1].attributedPlaceholder = NSAttributedString(string: "PW는 6자리 이상으로 입력하셔야 됩니다.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            //PW텍스트 필드 조건이 만족하지 않으면 Alert에 경고문 표시
            return present(alertPW, animated: false, completion: nil)
        }
        
        
        //위의 모든 조건을 만족하면 modally
        nextViewController()
    }
}

    
    
    
        
        






