// Copyright © 2021 Stormbird PTE. LTD.

import UIKit

protocol FiatOnRampCoordinatorDelegate: AnyObject, CanOpenURL {
}

class FiatOnRampCoordinator: AlphaCoordinator {
    private let wallet: Wallet
    private let server: RPCServer
    private let sourceViewController: UIViewController
    private let source: AlphaAnalytics.FiatOnRampSource
    private let analyticsCoordinator: AnalyticsCoordinator

    var coordinators: [AlphaCoordinator] = []
    weak var delegate: FiatOnRampCoordinatorDelegate?

    init(wallet: Wallet, server: RPCServer, viewController: UIViewController, source: AlphaAnalytics.FiatOnRampSource, analyticsCoordinator: AnalyticsCoordinator) {
        self.wallet = wallet
        self.server = server
        self.sourceViewController = viewController
        self.source = source
        self.analyticsCoordinator = analyticsCoordinator
    }

    func start() {
        let ramp = Ramp(account: wallet)
        if let url = ramp.url(token: TokenActionsServiceKey(token: MultipleChainsTokensDataStore.functional.etherToken(forServer: server))) {
            FiatOnRampCoordinator.logStartOnRamp(name: "Ramp", source: source, analyticsCoordinator: analyticsCoordinator)
            delegate?.didPressOpenWebPage(url, in: sourceViewController)
        } else {
            let fallbackUrl = URL(string: "https://alphawallet.com/browser-item-category/utilities/")!
            delegate?.didPressOpenWebPage(fallbackUrl, in: sourceViewController)
        }
    }

    static func logStartOnRamp(name: String, source: AlphaAnalytics.FiatOnRampSource, analyticsCoordinator: AnalyticsCoordinator) {
        analyticsCoordinator.log(navigation: AlphaAnalytics.Navigation.onRamp, properties: [AlphaAnalytics.Properties.name.rawValue: name, AlphaAnalytics.Properties.source.rawValue: source.rawValue])
    }
}
