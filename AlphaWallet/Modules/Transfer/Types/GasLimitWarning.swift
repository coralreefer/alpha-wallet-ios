//
//  GasLimitWarning.swift
//  AlphaWallet
//
//  Created by Vladyslav Shepitko on 10.05.2022.
//

import Foundation

extension TransactionConfigurator {
    enum GasLimitWarning {
        case tooHighCustomGasLimit

        var description: String {
            ConfigureTransactionError.gasLimitTooHigh.localizedDescription
        }
    }
}
