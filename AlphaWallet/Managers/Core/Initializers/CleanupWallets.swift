//
//  CleanupWallets.swift
//  AlphaWallet
//
//  Created by Vladyslav Shepitko on 09.05.2022.
//

import Foundation

final class CleanupWallets: Initializer {
    private let keystore: Keystore
    private let walletAddressesStore: WalletAddressesStore
    private let config: Config
    
    init(keystore: Keystore, walletAddressesStore: WalletAddressesStore, config: Config) {
        self.keystore = keystore
        self.config = config
        self.walletAddressesStore = walletAddressesStore
    }

    func perform() {
        if isRunningTests() {
            try! RealmConfiguration.removeWalletsFolderForTests()
            JsonWalletAddressesStore.removeWalletsFolderForTests()
        } else {
            //no-op
        }

        DatabaseMigration.removeWalletsIfRealmFilesMissed(keystore: keystore)
        DatabaseMigration.oneTimeMigrationForBookmarksAndUrlHistoryToSharedRealm(walletAddressesStore: walletAddressesStore, config: config)
    }
}
