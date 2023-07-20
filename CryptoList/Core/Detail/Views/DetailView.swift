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
    
    @StateObject private var vm: DetailViewModel
    
    @State private var showFullDescription: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 20
    
    // MARK: - Init
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20) {

                    overviewTitle
                    Divider()
                    descriptionSection
                    overviewGrid
                    additionalTitle
                    Divider()
                    additionalGrid
                    websiteSection
                    
                } // VStack
                .padding()
                
            } // VStack
            
           
        } // ScrollView
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            } // ToolbarItem
        } // toolbar
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView {
    
    private var navigationBarTrailingItems: some View {
        
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
            .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        } // HStack
        
    }
    
    private var overviewTitle: some View {
        
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var additionalTitle: some View {
        
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var descriptionSection: some View {
        
        ZStack {
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                        .animation(showFullDescription ? Animation.easeInOut : .none, value: showFullDescription)
                    
                    Button {
//                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
//                        }
                    } label: {
                        Text(showFullDescription ? "Less" : "Read more...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    }
                    .tint(.blue)
                   
                } // VStack
                .frame(maxWidth: .infinity, alignment: .leading)
               
            }
        } // ZStack
        
    }
    
    private var overviewGrid: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: []) {
                ForEach(vm.overviewStatistics) { stat in
                    StatisticView(stat: stat)
                }
            } // LazyVGrid
        
    }
    
    private var additionalGrid: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: []) {
                ForEach(vm.additionalStatistics) { stat in
                    StatisticView(stat: stat)
                }
            } // LazyVGrid
        
    }
    
    private var websiteSection: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString) {
                Link("Website", destination: url)
            }
            
            
            if let redditString = vm.redditURL,
               let url = URL(string: redditString) {
                Link("Reddit", destination: url)
            }
            
        } // VStack
        .tint(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
}
