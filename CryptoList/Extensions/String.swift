//
//  String.swift
//  CryptoList
//
//  Created by Sergey Hrabrov on 20.07.2023.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
