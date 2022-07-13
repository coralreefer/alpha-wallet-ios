//
//  FormattersTests.swift
//  AlphaWalletTests
//
//  Created by Jerome Chan on 19/1/22.
//

@testable import AlphaWallet
import XCTest

class FormattersTestCase: XCTestCase {

    func testCurrency() {
        XCTAssertEqual(CurrencyFormatter.currency.string(from: 0.0)!, "$0.00")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: 10.100)!, "$10.10")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: 100.105)!, "$100.10")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: 1000.109)!, "$1,000.10")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: 9999999999999.999)!, "$9,999,999,999,999.99")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: -0.0)!, "-$0.00")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: -10.100)!, "-$10.10")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: -100.105)!, "-$100.10")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: -1000.109)!, "-$1,000.10")
        XCTAssertEqual(CurrencyFormatter.currency.string(from: -9999999999999.999)!, "-$9,999,999,999,999.99")
        // XCTAssertEqual(Formatters.currency.string(from: 123456789123456789.056), "$123,456,789,123,456,789.05")
    }

    func testUsd() {
        XCTAssertEqual(CurrencyFormatter.usd.string(from: 0.0)!, "0.00 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: 10.100)!, "10.10 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: 100.105)!, "100.10 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: 1000.109)!, "1,000.10 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: 9999999999999.999)!, "9,999,999,999,999.99 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: -0.0)!, "-0.00 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: -10.100)!, "-10.10 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: -100.105)!, "-100.10 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: -1000.109)!, "-1,000.10 USD")
        XCTAssertEqual(CurrencyFormatter.usd.string(from: -9999999999999.999)!, "-9,999,999,999,999.99 USD")
    }

    func testPercent() {
        XCTAssertEqual(CurrencyFormatter.percent.string(from: 0.0)!, "0.00")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: 10.100)!, "10.10")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: 100.105)!, "100.10")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: 1000.109)!, "1,000.10")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: 9999999999999.999)!, "9,999,999,999,999.99")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: -0.0)!, "-0.00")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: -10.100)!, "-10.10")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: -100.105)!, "-100.10")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: -1000.109)!, "-1,000.10")
        XCTAssertEqual(CurrencyFormatter.percent.string(from: -9999999999999.999)!, "-9,999,999,999,999.99")
    }

    func testShortCrypto() {
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: 0.0)!, "0.0000")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: 10.100)!, "10.1000")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: 100.105)!, "100.1050")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: 1000.109)!, "1,000.1090")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: 999999999999.999)!, "999,999,999,999.9990")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: -0.0)!, "-0.0000")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: -10.100)!, "-10.1000")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: -100.105)!, "-100.1050")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: -1000.109)!, "-1,000.1090")
        XCTAssertEqual(CurrencyFormatter.shortCrypto.string(from: -999999999999.999)!, "-999,999,999,999.9990")
    }

    func testPriceChange() {
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: 0.0)!, "+$0.00")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: 10.100)!, "+$10.10")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: 100.105)!, "+$100.10")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: 1000.109)!, "+$1,000.10")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: 9999999999999.999)!, "+$9,999,999,999,999.99")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: -0.0)!, "-$0.00")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: -10.100)!, "-$10.10")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: -100.105)!, "-$100.10")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: -1000.109)!, "-$1,000.10")
        XCTAssertEqual(CurrencyFormatter.priceChange.string(from: -9999999999999.999)!, "-$9,999,999,999,999.99")
    }

    func testFiat() {
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: 0.0)!, "$0.00")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: 10.100)!, "$10.10")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: 100.105)!, "$100.10")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: 1000.109)!, "$1,000.10")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: 9999999999999.999)!, "$9,999,999,999,999.99")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: -0.0)!, "-$0.00")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: -10.100)!, "-$10.10")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: -100.105)!, "-$100.10")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: -1000.109)!, "-$1,000.10")
        XCTAssertEqual(CurrencyFormatter.fiat.string(from: -9999999999999.999)!, "-$9,999,999,999,999.99")
    }

    func testDefault() {
        XCTAssertEqual(CurrencyFormatter.default.string(from: 0.0)!, "0")
        XCTAssertEqual(CurrencyFormatter.default.string(from: 10.1)!, "10")
        XCTAssertEqual(CurrencyFormatter.default.string(from: 100.50)!, "100")
        XCTAssertEqual(CurrencyFormatter.default.string(from: 100.51)!, "101")
        XCTAssertEqual(CurrencyFormatter.default.string(from: 1000.9)!, "1001")
        XCTAssertEqual(CurrencyFormatter.default.string(from: 9999999999999.999)!, "10000000000000")
        XCTAssertEqual(CurrencyFormatter.default.string(from: -0.0)!, "-0")
        XCTAssertEqual(CurrencyFormatter.default.string(from: -10.1)!, "-10")
        XCTAssertEqual(CurrencyFormatter.default.string(from: -100.50)!, "-100")
        XCTAssertEqual(CurrencyFormatter.default.string(from: -100.51)!, "-101")
        XCTAssertEqual(CurrencyFormatter.default.string(from: -1000.9)!, "-1001")
        XCTAssertEqual(CurrencyFormatter.default.string(from: -9999999999999.999)!, "-10000000000000")
    }

    func testStringCurrency() {
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: 0.0)!, "0.00")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: 0.500)!, "0.50")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: 0.505)!, "0.50")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: 0.509)!, "0.50")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: 1000.50)!, "1,000.50")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: 9999999999999.999)!, "9,999,999,999,999.99")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: -0.0)!, "(0.00)")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: -0.500)!, "(0.50)")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: -0.505)!, "(0.50)")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: -0.509)!, "(0.50)")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: -1000.50)!, "(1,000.50)")
        XCTAssertEqual(CurrencyFormatter.currencyAccounting.string(from: -9999999999999.999)!, "(9,999,999,999,999.99)")
    }

    func testAlternateAmount() {
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: 0.0)!, "0.0000")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: 0.5)!, "0.5000")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: 0.05)!, "0.0500")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: 0.005)!, "0.0050")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: 0.0005)!, "0.0005")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: 0.00005)!, "0.0000")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: 12341234.12345)!, "12,341,234.1234")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: -0.0)!, "-0.0000")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: -0.5)!, "-0.5000")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: -0.05)!, "-0.0500")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: -0.005)!, "-0.0050")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: -0.0005)!, "-0.0005")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: -0.00005)!, "-0.0000")
        XCTAssertEqual(CurrencyFormatter.alternateAmount.string(from: -12341234.12345)!, "-12,341,234.1234")
    }

    func testScientificAmount() {
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 0.0)!, "0")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 0 as NSNumber)!, "0")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 1.0)!, "1")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 10.0)!, "10")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 100.0)!, "100")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 1000.0)!, "1000")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 12345.0)!, "12345")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 12345.49)!, "12345.49")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 12345.50)!, "12345.5")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: 12345.51)!, "12345.51")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -0.0)!, "-0")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -0 as NSNumber)!, "0")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -1.0)!, "-1")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -10.0)!, "-10")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -100.0)!, "-100")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -1000.0)!, "-1000")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -12345.0)!, "-12345")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -12345.49)!, "-12345.49")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -12345.50)!, "-12345.5")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.string(from: -12345.51)!, "-12345.51")
        XCTAssertEqual(CurrencyFormatter.scientificAmount.number(from: "1.25E+12")!, 1.25E12)
        XCTAssertEqual(CurrencyFormatter.scientificAmount.number(from: "-1.25E+12")!, -1.25E12)
        XCTAssertEqual(CurrencyFormatter.scientificAmount.number(from: "1.25E-12")!, 1.25E-12)
        XCTAssertEqual(CurrencyFormatter.scientificAmount.number(from: "-1.25E-12")!, -1.25E-12)
    }
}
