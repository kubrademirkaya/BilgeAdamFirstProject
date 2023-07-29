
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
    
    private lazy var txtNewPassword:UITextField = {
        let txt = UITextField()
        txt.placeholder = "New Password"
        txt.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        txt.textAlignment = .center
        txt.layer.borderWidth = 0.5
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.cornerRadius = 8
        let smallImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        smallImage.image = UIImage(systemName: "key")
        smallImage.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallImage.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(smallImage)
        txt.leftView = leftView
        txt.leftViewMode = .always
        txt.isSecureTextEntry = true
        return txt
    }()
    
    private lazy var txtValidPassword:UITextField = {
        let txt = UITextField()
        txt.placeholder = "New Password"
        txt.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        txt.textAlignment = .center
        txt.layer.borderWidth = 0.5
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.cornerRadius = 8
        let smallImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        smallImage.image = UIImage(systemName: "key")
        smallImage.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallImage.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(smallImage)
        txt.leftView = leftView
        txt.leftViewMode = .always
        txt.isSecureTextEntry = true
        return txt
    }()
    
    private lazy var NextButton:UIButton = {
        let button = UIButton()
        button.setTitle("Devam et", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
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
