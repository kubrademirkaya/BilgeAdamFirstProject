//
//  Font.swift
//  NewProject
//
//  Created by Kübra Demirkaya on 28.07.2023.
//

//Boş enum oluşturulabilir, caseler üzerinden işlem yaptırılır
//Enumlara değer verilebilir, bu değerlere rawValue ile ulaşılabilir
//Enumlara parametre verilebilir, case yakalandığında casei alırken parametre de yakalayacak. Bu parametre sabit olarak geliyor.
//Enum caseleri, enum içerisinde switch-case ile işlenebilir.
//Enum içerisine fonksiyon da yazılabilir

import Foundation
import UIKit

enum Font: String {
    case light = "NunitoSans_10pt-Light"
    case regular = "NunitoSans_10pt-Regular"
    case medium = "NunitoSans_10pt-Medium"
    case semiBold = "NunitoSans_10pt-SemiBold"
}

/*enum Color: String {
    case primaryColor = " "
    case secondaryColor = " "
    case 
}*/




    
/*var viewSide: ViewSide = .left {
        didSet {
            switch viewSide {
            case .left:
                // code to setup view for left
            case .right:
                // code to setup view for right
            }
        }
}*/

/*extension UITextField {

    func setLeftView(image: UIImage, withPadding padding: CGFloat = 0) {
       
    }
    
    func setRightView(image: UIImage, withPadding padding: CGFloat = 0) {
        
    }
    
    //textField.setLeftView(image: UIImage(named: "icon")!, withPadding: 10)
    //textField.setRightView(image: UIImage(named: "icon")!, withPadding: 10)
}*/
