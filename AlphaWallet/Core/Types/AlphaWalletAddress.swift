// Copyright © 2018 Stormbird PTE. LTD.

import AlphaWalletAddress

///Use an enum as a namespace until Swift has proper namespaces
public typealias AlphaWallet = AlphaWalletAddress.AlphaWallet

extension AlphaWallet.Address {
    var isLegacy875Contract: Bool {
        let contractString = eip55String
        return AlphaConstants.legacy875Addresses.contains { $0.sameContract(as: contractString) }
    }

    var isLegacy721Contract: Bool {
        return AlphaConstants.legacy721Addresses.contains { sameContract(as: $0) }
    }

    //Useful for special case for FIFA tickets
    var isFifaTicketContract: Bool {
        return sameContract(as: AlphaConstants.ticketContractAddress) || sameContract(as: AlphaConstants.ticketContractAddressRopsten)
    }

    var isUEFATicketContract: Bool {
        return sameContract(as: AlphaConstants.uefaMainnet)
    }
}
