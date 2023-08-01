//
//  LoginVC.swift
//  BilgeAdamFirstProject
//
//  Created by Kübra Demirkaya on 29.07.2023.
//


import UIKit
import SnapKit
import TinyConstraints


class LoginVC: UIViewController, SignUpDelegate, PasswordProtocolDelegate {
    
    var username = "Kübra"
    var password = "123456"
    
    
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "appleLogo")
        return imageView
    }()
    
    private lazy var labelWelcome:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        label.text = "Hoşgeldiniz"
        label.font = UIFont(name: "NunitoSans_10pt-SemiBold", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var txtUsername:CustomTextField = {
        let txt = CustomTextField()
        txt.placeholder = "Kullanıcı Adı"
        
        txt.viewSide = .left(image: UIImage(systemName: "person.fill")!)
        
        return txt
    }()
    
    private lazy var txtPassword:CustomTextField = {
        let txt = CustomTextField()
        txt.placeholder = "Şifre"
        
        txt.viewSide = .left(image: UIImage(systemName: "key")!)
        
        txt.isSecureTextEntry = true
        
        return txt
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Giriş Yap", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8588235294, green: 0.8, blue: 0.9294117647, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton:UIButton = {
        let button = UIButton()
        button.setTitle("Şifremi unuttum", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.09623382241, green: 0.07863570005, blue: 0.1982927024, alpha: 1)
        button.setTitleColor( #colorLiteral(red: 0.8588235294, green: 0.8, blue: 0.9294117647, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton:UIButton = {
        let button = UIButton()
        button.setTitle("Kayıt Ol", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.8588235294, green: 0.8, blue: 0.9294117647, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.09623382241, green: 0.07863570005, blue: 0.1982927024, alpha: 1)
        
        //delegate?.passwordTransfer(newPassword: password)
        
        setupViews()
        setupLayout()
        
    }
    
    @objc func setupViews() {
        self.view.addSubview(imageView)
        self.view.addSubview(labelWelcome)
        self.view.addSubview(txtUsername)
        self.view.addSubview(txtPassword)
        self.view.addSubview(loginButton)
        self.view.addSubview(forgotPasswordButton)
        self.view.addSubview(signUpButton)
    }
    
    
    func setupLayout() {
        imageView.edgesToSuperview(excluding: [.bottom], insets: .left(16) + .right(16) + .top(20), isActive: true, usingSafeArea: true)
        imageView.height(250)
        
        labelWelcome.topToBottom(of: imageView, offset: 30)
        labelWelcome.leading(to: imageView)
        labelWelcome.trailing(to: imageView)
        labelWelcome.height(50)
        
        txtUsername.topToBottom(of: labelWelcome, offset: 30)
        txtUsername.leading(to: imageView)
        txtUsername.trailing(to: imageView)
        txtUsername.height(50)
        
        txtPassword.topToBottom(of: txtUsername, offset: 30)
        txtPassword.leading(to: imageView)
        txtPassword.trailing(to: imageView)
        txtPassword.height(50)
        
        loginButton.topToBottom(of: txtPassword, offset: 50)
        loginButton.trailing(to: imageView, offset: -20)
        loginButton.width(150)
        loginButton.height(44)
        
        forgotPasswordButton.topToBottom(of: txtPassword, offset: 50)
        forgotPasswordButton.leading(to: imageView, offset: 20)
        forgotPasswordButton.width(150)
        forgotPasswordButton.height(44)
        
        signUpButton.topToBottom(of: forgotPasswordButton, offset: 50)
        signUpButton.leading(to: imageView)
        signUpButton.trailing(to: imageView)
        signUpButton.height(44)
    }
    
    @objc func signUpButtonTapped() {
        let signUpVC = SignUpVC()
        signUpVC.helper = self
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func loginButtonTapped() {
        
        if let txtUsername = txtUsername.text, let txtPassword = txtPassword.text {
            if username == txtUsername && password == txtPassword {
                navigationController?.pushViewController(WelcomeVC(), animated: true)
            } else {
                print("yanlış giriş")
            }
        }
    }
    
    @objc func forgotPasswordButtonTapped() {
        let forgotPasswordVC = ForgotPasswordVC()
        forgotPasswordVC.passwordTransfer = self
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    func signUserInfo(email: String, password: String) {
        print("Email: \(email), Password: \(password)")
        username = email
        self.password = password
    }
    
    func passwordTransfer(newPassword: String) {
        print("New Password: \(newPassword)")
        self.password = newPassword
    }
}
