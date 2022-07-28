//
//  LoginViewController.swift
//  NewNetflixProject
//
//  Created by Carki on 2022/07/28.
//

import UIKit

enum checkTextField {
    case ID, PW
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mainViewTitleLabel: UILabel!
    @IBOutlet weak var userIDTextView: UITextView!
    @IBOutlet weak var userPWtextView: UITextView!
    @IBOutlet weak var userNickNameTextField: UITextField!
    @IBOutlet weak var userLocationTextField: UITextField!
    @IBOutlet weak var userCodeTextField: UITextField!
    
    @IBOutlet weak var additionalInfoLabel: UILabel!
    @IBOutlet weak var switchLine: UISwitch!
    
    var checkList: checkTextField = .ID
    let idTextViewPlaceHolder = "ID를 입력해주세요(*필수)"
    let pwTextViewPlaceHolder = "6자 이상의 PW를 입력해주세요(*필수)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabelDesign(labelName: mainViewTitleLabel)
        idTextViewDesign(textViewName: userIDTextView)
        pwTextViewDesign(textViewName: userPWtextView)
        
    }
    
    func mainLabelDesign(labelName: UILabel) {
        labelName.text = "JUNFLIX"
        labelName.textAlignment = .center
        labelName.textColor = .red
        labelName.font = .boldSystemFont(ofSize: 25)
    }
    
    //id텍스트뷰 디자인 -> 라인제한 있어야됨
    func idTextViewDesign(textViewName: UITextView) {
        textViewName.delegate = self
        textViewName.text = idTextViewPlaceHolder
        textViewName.textColor = .lightGray
        textViewName.layer.borderWidth = 0.1
        textViewName.layer.borderColor = UIColor.gray.cgColor
        textViewName.layer.cornerRadius = 5
    }
    
    //pw텍스트뷰 디자인 -> 라인제한 있어야됨
    func pwTextViewDesign(textViewName: UITextView) {
        textViewName.delegate = self
        textViewName.text = pwTextViewPlaceHolder
        textViewName.textColor = .lightGray
        textViewName.layer.borderWidth = 0.1
        textViewName.layer.borderColor = UIColor.gray.cgColor
        textViewName.layer.cornerRadius = 5
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func assignButtonClicked(_ sender: UIButton) {
        if userIDTextView.text == nil {
            checkList = .ID
        }else if userPWtextView.text == nil {
            checkList = .PW
        }else if userPWtextView.text.count < 6 {
            checkList = .PW
        }
        
        
        switch (checkList) {
        case .ID:
            if userIDTextView.text == idTextViewPlaceHolder {
                userIDTextView.textColor = .red
            }
        
        case .PW:
            userPWtextView.text = pwTextViewPlaceHolder
            userPWtextView.textColor = .red
            
        }
        
        
    }
}

extension LoginViewController: UITextViewDelegate {
    //텍스트뷰의 텍스트가 변할 때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        var idTextViewCount = userIDTextView.text.count
        var pwTextViewCount = userPWtextView.text.count
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if userIDTextView.textColor == .lightGray {
            userIDTextView.text = nil
            userIDTextView.textColor = .black
        }else if userPWtextView.textColor == .lightGray {
            userPWtextView.text = nil
            userPWtextView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if userIDTextView.text.isEmpty {
            userIDTextView.text = idTextViewPlaceHolder
            userIDTextView.textColor = .lightGray
        }else if userPWtextView.text.isEmpty {
            userPWtextView.text = pwTextViewPlaceHolder
            userPWtextView.textColor = .lightGray
        }
    }
}
    


