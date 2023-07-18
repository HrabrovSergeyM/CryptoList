//
//  CoinImageView.swift
//  CryptoList
//
//  Created by Sergey Hrabrov on 18.07.2023.
//

import SwiftUI

//class CoinImageViewModel: ObservableObject {
//    
//    @Published var image: UIImage? = nil
//    @Published var isLoading: Bool = false
//    
//    init() {
//        getImage()
//    }
//    
//    private func getImage() {
//        
//    }
//    
//}

struct CoinImageView: View {
    
    // MARK: - Properties
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        } // ZStack
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .previewLayout(.sizeThatFits)
    }
}
