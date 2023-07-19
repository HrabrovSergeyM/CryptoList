//
//  XMarkButton.swift
//  CryptoList
//
//  Created by Sergey Hrabrov on 19.07.2023.
//

import SwiftUI

struct XMarkButton: View {
    
    // MARK: - Properties
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        } // Button
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
