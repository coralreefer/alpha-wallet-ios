// Copyright SIX DAY LLC. All rights reserved.

import UIKit

class SplashCoordinator: AlphaCoordinator {
    private let window: UIWindow

    var coordinators: [AlphaCoordinator] = []

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = SplashViewController()
        window.isHidden = false
    }

    func stop() {
        window.isHidden = true
    }
}
