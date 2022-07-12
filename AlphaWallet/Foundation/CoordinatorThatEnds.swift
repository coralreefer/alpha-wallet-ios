// Copyright © 2019 Stormbird PTE. LTD.

import Foundation

protocol CoordinatorThatEnds: AlphaCoordinator {
    func endUserInterface(animated: Bool)
    func end()
}
