//
//  TokenMappedToTicker.swift
//  AlphaWallet
//
//  Created by Vladyslav Shepitko on 29.03.2022.
//

import Foundation

struct TokenMappedToTicker: Hashable {
    let symbol: String
    let name: String
    let contractAddress: AlphaWallet.Address
    let server: RPCServer

    init(token: Token) {
        symbol = token.symbol
        name = token.name
        contractAddress = token.contractAddress
        server = token.server
    }

    var canPassFiltering: Bool {
        if server == .avalanche && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return true
        } else if server == .fantom && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return true
        } else if server == .binance_smart_chain && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return true
        } else if server == .klaytnCypress && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return true
        } else if server == .xDai && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return true
        } else {
            return false
        }
    }

    func overridenCoinGeckoTickerId(tickerId: String) -> String {
        if server == .avalanche && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return "avalanche-2"
        } else if server == .fantom && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return "fantom"
        } else if server == .binance_smart_chain && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return "binancecoin"
        } else if server == .klaytnCypress && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return "klay-token"
        } else if server == .xDai && contractAddress == AlphaConstants.nativeCryptoAddressInDatabase {
            return "gnosis"
        } else {
            return tickerId
        }
    }
}
