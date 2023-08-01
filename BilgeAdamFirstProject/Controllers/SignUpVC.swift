
//
//  SignUpVC.swift
//  NewProject
//
//  Created by Kübra Demirkaya on 28.07.2023.
//

import UIKit
import SnapKit
import TinyConstraints

protocol SignUpDelegate: AnyObject {
    func signUserInfo(email: String, password: String)
}

class SignUpVC: UIViewController {

    weak var helper: SignUpDelegate?
    
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "appleLogo")
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var labelSignUp:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        label.text = "Kayıt Ol"
        label.font = UIFont(name: Font.semiBold.rawValue, size: 30)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var txtUsername:CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Kullanıcı adı"
        
        textField.viewSide = .left(image: UIImage(systemName: "person.fill")!)
        
        return textField
    }()
    
    private lazy var txtEmail:CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "E-mail"
        
        textField.viewSide = .left(image: UIImage(systemName: "mail")!)
        
        return textField
    }()
    
    private lazy var txtPassword:CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Şifre"
        
        textField.viewSide = .left(image: UIImage(systemName: "key")!)
        
        return textField
    }()
    
    private lazy var txtValidPassword:CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Şifre Doğrulama"
        
        textField.viewSide = .left(image: UIImage(systemName: "key")!)
        
        return textField
    }()
    
    private lazy var btnSignUp:UIButton = {
        let button = UIButton()
        button.setTitle("Kayıt Ol", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        button.setTitleColor( #colorLiteral(red: 0.8588235294, green: 0.8, blue: 0.9294117647, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(btnSignUpTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.09623382241, green: 0.07863570005, blue: 0.1982927024, alpha: 1)
        
        setupViews()
    }
    
    func setupViews() {
        self.view.addSubview(imageView)
        self.view.addSubview(labelSignUp)
        self.view.addSubview(txtUsername)
        self.view.addSubview(txtEmail)
        self.view.addSubview(txtPassword)
        self.view.addSubview(txtValidPassword)
        self.view.addSubview(btnSignUp)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(250)
        }
        
        labelSignUp.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalTo(imageView.snp.leading)
            make.trailing.equalTo(imageView.snp.trailing)
            make.height.equalTo(44)
        }
        
        txtUsername.snp.makeConstraints { make in
            make.top.equalTo(labelSignUp.snp.bottom).offset(20)
            make.leading.equalTo(labelSignUp.snp.leading)
            make.trailing.equalTo(labelSignUp.snp.trailing)
            make.height.equalTo(44)
        }
        
        txtEmail.snp.makeConstraints { make in
            make.top.equalTo(txtUsername.snp.bottom).offset(20)
            make.leading.equalTo(txtUsername.snp.leading)
            make.trailing.equalTo(txtUsername.snp.trailing)
            make.height.equalTo(44)
        }
        
        txtPassword.snp.makeConstraints { make in
            make.top.equalTo(txtEmail.snp.bottom).offset(20)
            make.leading.equalTo(txtEmail.snp.leading)
            make.trailing.equalTo(txtEmail.snp.trailing)
            make.height.equalTo(44)
        }
        
        txtValidPassword.snp.makeConstraints { make in
            make.top.equalTo(txtPassword.snp.bottom).offset(20)
            make.leading.equalTo(txtPassword.snp.leading)
            make.trailing.equalTo(txtPassword.snp.trailing)
            make.height.equalTo(44)
        }
        
        btnSignUp.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.leading.equalTo(txtValidPassword.snp.leading)
            make.trailing.equalTo(txtValidPassword.snp.trailing)
            make.height.equalTo(44)
        }
        
    }
    
    @objc func btnSignUpTapped() {
        if let email = txtEmail.text,
           let username = txtUsername.text,
           let password = txtPassword.text,
           let validPassword = txtValidPassword.text {
            if password == validPassword && 8<=password.count && password.count<=12 {
                helper?.signUserInfo(email: email, password: password)
                navigationController?.popToRootViewController(animated: true)
            } else {
                print("şifre ve şifre doğrulama değerleri eşit olmalı.")
                print("şifreniz en az 8 en fazla 12 karakterli olabilir.")
            }
        }
    }
}
