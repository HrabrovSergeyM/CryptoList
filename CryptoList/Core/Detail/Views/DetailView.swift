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
    
    @StateObject var vm: DetailViewModel
    
    // MARK: - Init
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    // MARK: - Body
    
    var body: some View {
        Text("Hi")
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
