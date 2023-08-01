
//  PasswordProtocolDelegate.swift
//  NewProject
//
//  Created by Kübra Demirkaya on 28.07.2023.
//

import Foundation


//AnyObject yazıldığında classlar için kullanılacağını gösterir.
protocol PasswordProtocolDelegate: AnyObject {
    func passwordTransfer (newPassword: String)
}


