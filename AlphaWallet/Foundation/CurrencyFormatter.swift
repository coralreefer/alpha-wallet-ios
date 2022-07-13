//
//  Formatters.swift
//  AlphaWallet
//
//  Created by Jerome Chan on 17/1/22.
//

import Foundation

struct CurrencyFormatter {

    static let currency: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.minimumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.currencySymbol = "$"
        return formatter
    }()

    static let usd: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.positiveFormat = ",###.# " + AlphaConstants.Currency.usd
        formatter.negativeFormat = "-,###.# " + AlphaConstants.Currency.usd
        formatter.minimumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.formatterFractionDigits
        return formatter
    }()

    static let percent: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.positiveFormat = ",###.#"
        formatter.negativeFormat = "-,###.#"
        formatter.minimumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.numberStyle = .percent
        return formatter
    }()

    static let shortCrypto: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.positiveFormat = ",###.#"
        formatter.negativeFormat = "-,###.#"
        formatter.minimumFractionDigits = AlphaConstants.etherFormatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.etherFormatterFractionDigits
        formatter.numberStyle = .none
        return formatter
    }()

    static func shortCrypto(symbol: String) -> NumberFormatter {
        let formatter = basicCurrencyFormatter()
        formatter.positiveFormat = ",###.#" + " " + symbol
        formatter.negativeFormat = "-,###.#" + " " + symbol
        formatter.minimumFractionDigits = AlphaConstants.etherFormatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.etherFormatterFractionDigits
        formatter.numberStyle = .none
        return formatter
    }

    static let priceChange: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.positiveFormat = "+$,###.#"
        formatter.negativeFormat = "-$,###.#"
        formatter.minimumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.formatterFractionDigits
        return formatter
    }()

    static let fiat: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.positiveFormat = "$,###.#"
        formatter.negativeFormat = "-$,###.#"
        formatter.minimumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.formatterFractionDigits
        return formatter
    }()

    static let `default`: NumberFormatter = {
        let formatter = NumberFormatter()
        return formatter
    }()

    static let scientificAmount: NumberFormatter = {
        let formatter = CurrencyFormatter.default
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = false
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()

    static let currencyAccounting: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.formatterFractionDigits
        formatter.numberStyle = .currencyAccounting
        formatter.isLenient = true
        return formatter
    }()

    static let alternateAmount: NumberFormatter = {
        let formatter = basicCurrencyFormatter()
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = AlphaConstants.etherFormatterFractionDigits
        formatter.maximumFractionDigits = AlphaConstants.etherFormatterFractionDigits
        return formatter
    }()
}

fileprivate func basicCurrencyFormatter() -> NumberFormatter {
    let formatter = basicNumberFormatter()
    formatter.numberStyle = .currency
    formatter.roundingMode = .down
    return formatter
}

fileprivate func basicNumberFormatter() -> NumberFormatter {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.generatesDecimalNumbers = true
    formatter.alwaysShowsDecimalSeparator = true
    formatter.usesGroupingSeparator = true
    formatter.isLenient = false
    formatter.isPartialStringValidationEnabled = false
    formatter.groupingSeparator = ","
    formatter.decimalSeparator = "."
    return formatter
}

extension NumberFormatter {

    func string(from source: Double) -> String? {
        return self.string(from: source as NSNumber)
    }

}
