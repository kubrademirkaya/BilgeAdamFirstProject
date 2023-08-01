//
//  WelcomeVC.swift
//  BilgeAdamFirstProject
//
//  Created by Kübra Demirkaya on 29.07.2023.
//
//
//  Created by Kübra Demirkaya on 26.07.2023.

//A classı bir protokol imzalıyor. Protokolu kullanarak bilgi almak istiyor. Delegate görevlendirip o classa gönderiyor. O classta delegate yetkilendiriliyor ve daha sonra oradaki fonksiyonu tetikleyip bilgiyi alır.
//

//MVC: model: objenin kendisi , view: Kullanıcı olarak görünümlerin olduğu yer, controller: view içerisindeki yapıların ne yapacağını gösteren mantıksal akışı sağlayan yer. Apple mantığında view ve controller bağlı oldukları için tek bir yerde işlenir.
//UIViewController ve UIView farklı şeylerdir.
//

import UIKit
import SnapKit
import TinyConstraints

class WelcomeVC: UIViewController {
    
    //lazy olarak oluşturulan değişkenler sadece bir defa çalışır.
    // = den sonra closure oluşturuluyor.
    
    private lazy var lblWelcome:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        label.text = "Hoşgeldiniz"
        label.font = UIFont(name: "NunitoSans_10pt-SemiBold", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        //her component için bu yazılır. Constraints ayarlanabilir hale getiriyor.
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var txtUserMessage:CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Mesaj girin:"
        
        tf.viewSide = .left(image: UIImage(systemName: "person.fill")!)
        
        return tf
    }()
    
    private lazy var btnNext:UIButton = {
        let btn = UIButton()
        btn.setTitle("Mesajı Göster", for: .normal)
        btn.setTitleColor( #colorLiteral(red: 0.8588235294, green: 0.8, blue: 0.9294117647, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        btn.addTarget(self, action: #selector(btnNextTapped), for: .touchUpInside)
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 8
        return btn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.09623382241, green: 0.07863570005, blue: 0.1982927024, alpha: 1)
        
        setupViews()
        //Swift core Layout kütüphanesi ile yazılan layout fonksiyonu
        //setupLayout()
        //SnapKit ile yazılan layout fonksiyonu
        setupWithSnap()
        //tinyConst ile yazılan layout fonksiyonu
        //setupWithTiny()
        
    }
    
    //MARK: - Add Subviews to Superview
    
    @objc func setupViews() {
        self.view.addSubview(lblWelcome)
        self.view.addSubview(txtUserMessage)
        self.view.addSubview(btnNext)
    }
    
    @objc func btnNextTapped() {
        print(txtUserMessage.text)
    }
    
    
    //MARK: - Add Subviews to Superview
    func setupLayout() {
        lblWelcome.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        lblWelcome.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        lblWelcome.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        
        txtUserMessage.leadingAnchor.constraint(equalTo: lblWelcome.leadingAnchor).isActive = true
        txtUserMessage.topAnchor.constraint(equalTo: lblWelcome.bottomAnchor, constant:20).isActive = true
        txtUserMessage.trailingAnchor.constraint(equalTo: lblWelcome.trailingAnchor).isActive = true
        txtUserMessage.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //label dinamik olduğu için bottom değeri eklemeye gerek yoktur
    func setupWithSnap() {
        lblWelcome.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        txtUserMessage.snp.makeConstraints { make in
            make.top.equalTo(lblWelcome.snp.bottom).offset(20)
            make.leading.equalTo(lblWelcome.snp.leading)
            make.trailing.equalTo(lblWelcome.snp.trailing)
            make.height.equalTo(44)
        }
        
        btnNext.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.leading.equalTo(lblWelcome.snp.leading)
            make.trailing.equalTo(lblWelcome.snp.trailing)
            make.height.equalTo(44)
        }
    }
    
    func setupWithTiny() {
        //lblWelcome.topToSuperview(offset:30, usingSafeArea: true)
        //lblWelcome.edgesToSuperview(excluding: [.top, .bottom], insets: .left(16) + .right(16))
        //Yukarıdaki işlem aşağıdaki şekilde yazılarak da aynı sonucu verir
        lblWelcome.edgesToSuperview(excluding: [.bottom], insets: .left(16) + .right(16) + .top(30), usingSafeArea: true)
      
        txtUserMessage.topToBottom(of: lblWelcome, offset: 20)
        txtUserMessage.leading(to: lblWelcome)
        txtUserMessage.trailing(to: lblWelcome)
        txtUserMessage.height(44)
        
        btnNext.height(44)
        btnNext.edgesToSuperview(excluding: [.top], insets: .left(16) + .right(16) + .bottom(30), usingSafeArea: true)
        
        
    }
    

    
}

extension WelcomeVC:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("input işlemi başlatıldı")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("input işlemi bitti")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        
        print(textField.text)
        return true
    }
    
    
}


