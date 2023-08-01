//
//  SliderSampleVC.swift
//  BilgeAdamFirstProject
//
//  Created by Kübra Demirkaya on 31.07.2023.
//

import UIKit
import SnapKit

class SliderSampleVC: UIViewController {
    
    var stepValue:Float = 20.0
    
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.text = "Tıkla"
        label.isUserInteractionEnabled = true
        label.textColor = .white
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.value = 0.0
        slider.addTarget(self, action: #selector(sliderValueChange), for: .valueChanged)
        
        slider.tintColor = #colorLiteral(red: 0.5607843137, green: 0.2470588235, blue: 0.3647058824, alpha: 1)
        slider.thumbTintColor = #colorLiteral(red: 0.09623382241, green: 0.07863570005, blue: 0.1982927024, alpha: 1)
        
        return slider
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapToGesture))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToGesture))
        
        setupViews()
        
        self.lblTitle.addGestureRecognizer(longPressGesture)
    }
    
    @objc func tapToGesture() {
        print(lblTitle.text)
    }
    
    @objc func sliderValueChange(sender: UISlider) {
        
        let rounded = round(sender.value / stepValue) * stepValue
        
        slider.setValue(rounded, animated: false)
        
        print(sender.value)
        
    }
    
    private func setupViews() {
        self.view.addSubview(lblTitle)
        self.view.addSubview(slider)
        setupLayout()
    }
    
    private func setupLayout() {
        
        lblTitle.snp.makeConstraints { label in
            label.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            label.leading.equalToSuperview().offset(16)
        }
        
        slider.snp.makeConstraints { slider in
            slider.top.equalTo(lblTitle.snp.bottom).offset(30)
            slider.leading.equalToSuperview().offset(16)
            slider.trailing.equalToSuperview().offset(-16)
        }
        
    }
    
    

}
