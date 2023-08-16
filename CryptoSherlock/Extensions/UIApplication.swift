//
//  UIApplication.swift
//  CryptoSherlock
//
//  Created by RAFAEL on 16.08.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
