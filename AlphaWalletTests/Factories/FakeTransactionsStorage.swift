// Copyright SIX DAY LLC. All rights reserved.

import Foundation
@testable import AlphaWallet
import RealmSwift

class FakeTransactionsStorage: TransactionDataStore {
    convenience init(wallet: Wallet = .init(type: .watch(AlphaConstants.nativeCryptoAddressInDatabase))) {
        let store = FakeRealmLocalStore()
        self.init(store: store.getOrCreateStore(forWallet: wallet))
    }
}
