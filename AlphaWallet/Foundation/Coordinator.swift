// Copyright SIX DAY LLC. All rights reserved.

import Foundation

protocol AlphaCoordinator: AnyObject {
    var coordinators: [AlphaCoordinator] { get set }
}

extension AlphaCoordinator {
    func addCoordinator(_ coordinator: AlphaCoordinator) {
        coordinators.append(coordinator)
    }

    func removeCoordinator(_ coordinator: AlphaCoordinator) {
        coordinators = coordinators.filter { $0 !== coordinator }
    }

    func removeAllCoordinators() {
        coordinators.removeAll()
    }

    private func coordinatorOfType<T: AlphaCoordinator>(coordinator: AlphaCoordinator, type: T.Type) -> T? {
        if let value = coordinator as? T {
            return value
        } else {
            return coordinator.coordinators.compactMap { coordinatorOfType(coordinator: $0, type: type) }.first
        }
    }

    func coordinatorOfType<T: AlphaCoordinator>(type: T.Type) -> T? {
        return coordinatorOfType(coordinator: self, type: type)
    }
}
