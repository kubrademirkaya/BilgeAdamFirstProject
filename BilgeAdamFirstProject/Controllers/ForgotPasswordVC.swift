
//  Created by Kübra Demirkaya on 29.07.2023.
//
//  ForgotPasswordVC.swift
//  NewProject
//
//  Created by Kübra Demirkaya on 27.07.2023.
//

import UIKit
import TinyConstraints


class ForgotPasswordVC: UIViewController {
    
    weak var passwordTransfer: PasswordProtocolDelegate?
    
    private lazy var txtNewPassword:CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Yeni Şİfre"
        
        textField.viewSide = .left(image: UIImage(systemName: "key")!)
        
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var txtValidPassword:CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Yeni Şifre Doğrulama"
        
        textField.viewSide = .left(image: UIImage(systemName: "key")!)
        
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var NextButton:UIButton = {
        let button = UIButton()
        button.setTitle("Devam et", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        button.setTitleColor( #colorLiteral(red: 0.8588235294, green: 0.8, blue: 0.9294117647, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.09623382241, green: 0.07863570005, blue: 0.1982927024, alpha: 1)
        
        setupViews()
    }
    
    @objc func setupViews() {
        //self.view.addSubview(imageView)
        self.view.addSubview(NextButton)
        self.view.addSubview(txtValidPassword)
        self.view.addSubview(txtNewPassword)
        setupLayout()
    }
    
    func setupLayout() {
        txtNewPassword.edgesToSuperview(excluding: [.bottom], insets: .left(16) + .right(16) + .top(50), isActive: true, usingSafeArea: true)
        txtNewPassword.height(50)
        
        txtValidPassword.topToBottom(of: txtNewPassword, offset: 30)
        txtValidPassword.leading(to: txtNewPassword)
        txtValidPassword.trailing(to: txtNewPassword)
        txtValidPassword.height(50)
        
        NextButton.topToBottom(of: txtValidPassword, offset: 50)
        NextButton.leading(to: txtValidPassword)
        NextButton.trailing(to: txtValidPassword)
        
        
        NextButton.height(44)
    }
    
    
    @objc func nextButtonTapped() {
        if let txtNewPassword = txtNewPassword.text,
           let txtValidPassword = txtValidPassword.text {
            if txtNewPassword == txtValidPassword && 8<=txtNewPassword.count && txtNewPassword.count<=12  {
                passwordTransfer?.passwordTransfer(newPassword: txtNewPassword)
                navigationController?.popToRootViewController(animated: true)
                
            } else {
                print("şifre ve şifre doğrulama değerleri eşit olmalı.")
                print("şifreniz en az 8 en fazla 12 karakterli olabilir.")
            }
        }
    }
   
}
