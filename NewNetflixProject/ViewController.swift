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
    
    
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        signupButton.isUserInteractionEnabled = true
        let alertID = UIAlertController(title: "경고", message: "ID는 필수적으로 입력해야됩니다.", preferredStyle: UIAlertController.Style.alert)
        let alertPW = UIAlertController(title: "경고", message: "PW는 필수적으로 입력해야됩니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in}
        alertID.addAction(okAction)
        
        if userTextFieldCollection[0].text?.isEmpty == true {
            userTextFieldCollection[0].attributedPlaceholder = NSAttributedString(string: "ID는 필수적으로 입력해야 합니다.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            present(alertID, animated: false, completion: nil)
            signupButton.isUserInteractionEnabled = true
        }else {
            signupButton.isUserInteractionEnabled = false
        }
    }
}
    
    
    
        
        





