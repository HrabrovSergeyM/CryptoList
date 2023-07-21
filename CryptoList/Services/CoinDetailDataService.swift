//
//  CoinDetailDataService.swift
//  CryptoList
//
//  Created by Sergey Hrabrov on 20.07.2023.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    // MARK: - Properties
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else {
            return
        }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}
