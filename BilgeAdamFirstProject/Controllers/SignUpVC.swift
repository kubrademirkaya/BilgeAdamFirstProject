
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
        return imageView
    }()
    
    private lazy var labelSignUp:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "Kayıt Ol"
        label.font = UIFont(name: Font.avenirNextBold.rawValue, size: 25)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var txtUsername:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Kullanıcı adı"
        textField.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        textField.textAlignment = .center
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        let smallImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        smallImage.image = UIImage(systemName: "person")
        smallImage.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallImage.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(smallImage)
        textField.leftView = leftView
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var txtEmail:UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        textField.textAlignment = .center
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        let smallImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        smallImage.image = UIImage(systemName: "mail")
        smallImage.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallImage.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(smallImage)
        textField.leftView = leftView
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var txtPassword:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Şifre"
        textField.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        textField.textAlignment = .center
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        let smallImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        smallImage.image = UIImage(systemName: "key")
        smallImage.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallImage.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(smallImage)
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var txtValidPassword:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Şifre Doğrulama"
        textField.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        textField.textAlignment = .center
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        let smallImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        smallImage.image = UIImage(systemName: "key")
        smallImage.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallImage.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(smallImage)
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var btnSignUp:UIButton = {
        let button = UIButton()
        button.setTitle("Kayıt Ol", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(btnSignUpTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
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
