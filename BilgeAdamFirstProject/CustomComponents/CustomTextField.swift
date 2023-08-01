//
//
//  CustomTextField.swift
//  NewProject
//
//  Created by Kübra Demirkaya on 28.07.2023.
//
import UIKit

enum ViewSide {
    case right(image:UIImage)
    case left(image:UIImage)
    case none
    //case both(imageL:UIImage,imageR:UIImage)
    
    
    //Aşağıdaki fonksiyonda oluşturulan view, ne zaman ne durumda oluşturulacak ona karar veriyor
    //Computed Property; hesaplamadan sonra atama yapıyor
    var defineViewSide: UIView {
        //Hesaplandıktan sonra işlem yapıyor
        //Enum içerisinde işlem yapıldığı için self deniyor
        //Gelecek parametre sabite atanıyor, kullanılacağı zaman paramtreyi sabit olarak verecek.
        switch self {
        case .left(let image):
            return setSideView(icon: image)
        case .right(let image):
            return setSideView(icon: image)
        case .none:
            return setSideView()
            /*case .both(let imageL, let imageR):
             return setSideView(leftIcon: imageL, rightIcon: imageR)
             }*/
        }
        
        
        //View nasıl olacak ona karar veriyor, sadece view oluşturuyor
        func setSideView(icon:UIImage? = nil) -> UIView {
            //color eklerken #colorLiteral() ile özelleştirebiliriz.
            //Assetsten image gibi color eklenebiliyor. O şekilde color set ekleyip çağırabiliriz.
            //cgColor olarak gelir, UI kütüphanesinden gelmez. Renkler cgColor türünde verilmeli
            let imageView = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
            imageView.image = icon
            imageView.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            imageView.contentMode = .scaleAspectFit
            
            let sideView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            imageView.center = sideView.center
            sideView.addSubview(imageView)
            
            return sideView
            
        }
    }
}
    class CustomTextField: UITextField {
        
        var insets:UIEdgeInsets
        
        //property observer
        //değiştirildiğinde, kullanıcı bir şey atadığında, şu işlemleri yap (didSet)
        //ViewSide'da bir şey değiştiğinde aşağıdakileri yap
        var viewSide: ViewSide? = nil {
            didSet{
                defineSideViewLocation()
            }
        }
        
        var fontSize:CGFloat = 12 {
            didSet {
                
                self.font = UIFont(name: "AvenirNext-Regular", size: fontSize)
            }
        }
        
        init(insets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 12)){
            self.insets = insets
            super.init(frame: .zero)
            
            let attributedString = NSAttributedString(string: "Kullanıcı adınızı giriniz", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2352941176, green: 0.1960784314, blue: 0.3019607843, alpha: 1)])
            
            self.attributedPlaceholder = attributedString
            self.textColor = #colorLiteral(red: 0.2352941176, green: 0.1960784314, blue: 0.3019607843, alpha: 1)
            self.font = UIFont(name: Font.semiBold.rawValue, size: self.fontSize)
            //self.layer.backgroundColor = UIColor.gray.cgColor
            self.layer.borderWidth = 0.5
            self.layer.cornerRadius = 8
            self.backgroundColor = #colorLiteral(red: 0.1333333333, green: 0.1098039216, blue: 0.2588235294, alpha: 1)
            self.textAlignment = .center
            self.autocorrectionType = .no
            
        }
        
        func defineSideViewLocation() {
            switch viewSide {
            case .left:
                self.leftView = self.viewSide?.defineViewSide
                self.leftViewMode = .always
            case .right:
                self.rightView = self.viewSide?.defineViewSide
                self.rightViewMode = .always
            case .none?:
                return
            default:
                return
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }

