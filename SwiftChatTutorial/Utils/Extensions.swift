//
//  Extensions.swift
//  SwiftChatTutorial
//
//  Created by Jinu on 07/09/2024.
//

import UIKit


extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

    }
}
