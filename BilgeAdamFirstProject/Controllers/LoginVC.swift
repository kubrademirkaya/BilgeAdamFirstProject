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
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "Hoşgeldiniz"
        label.font = UIFont(name: Font.avenirNextBold.rawValue, size: 25)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var txtUsername:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Username"
        txt.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        txt.textAlignment = .center
        txt.layer.borderWidth = 0.5
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.cornerRadius = 8
        let smallImage = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        smallImage.image = UIImage(systemName: "person.fill")
        smallImage.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        smallImage.contentMode = .scaleAspectFit
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(smallImage)
        txt.leftView = leftView
        txt.leftViewMode = .always
        return txt
    }()
    
    private lazy var txtPassword:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password"
        
        txt.font = UIFont(name: Font.avenirNext.rawValue, size: 16)
        txt.isSecureTextEntry = true
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
        return txt
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Giriş Yap", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton:UIButton = {
        let button = UIButton()
        button.setTitle("Şifremi unuttum", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor( #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton:UIButton = {
        let button = UIButton()
        button.setTitle("Kayıt Ol", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
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
        //labelWelcome.height(50)
        
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
