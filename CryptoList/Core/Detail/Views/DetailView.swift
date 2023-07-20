//
//  DetailView.swift
//  CryptoList
//
//  Created by Sergey Hrabrov on 20.07.2023.
//

import SwiftUI

struct DetailLoadingView: View {
    
    // MARK: - Properties
    
    @Binding var coin: CoinModel?
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            } // if
        } // ZStack
        
    }
}

struct DetailView: View {
    
    // MARK: - Properties
    
    let coin: CoinModel
    
    // MARK: - Init
    
    init(coin: CoinModel) {
        self.coin = coin
    }
    
    // MARK: - Body
    
    var body: some View {
        Text(coin.name)
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
