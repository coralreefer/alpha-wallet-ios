
#if os(iOS)
import UIKit
#endif
import Foundation
import Starscream

class AutomaticSocketConnectionHandler: SocketConnectionHandler, WebSocketDelegate {
    var isConnected: Bool = false
    
    enum Error: Swift.Error {
        case manualSocketConnectionForbidden
        case manualSocketDisconnectionForbidden
    }
    private var appStateObserver: AppStateObserving
    let socket: WebSocket
    private var networkMonitor: NetworkMonitoring
    private let backgroundTaskRegistrar: BackgroundTaskRegistering

    init(networkMonitor: NetworkMonitoring = NetworkMonitor(),
         socket: WebSocket,
         appStateObserver: AppStateObserving = AppStateObserver(),
         backgroundTaskRegistrar: BackgroundTaskRegistering = BackgroundTaskRegistrar()) {
        self.appStateObserver = appStateObserver
        self.socket = socket
        self.networkMonitor = networkMonitor
        self.backgroundTaskRegistrar = backgroundTaskRegistrar
        self.socket.delegate = self
        setUpStateObserving()
        setUpNetworkMonitoring()
        socket.connect()
    }
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
        case .binary(let data):
            print("Received data: \(data.count)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(let error):
            isConnected = false
            //handleError(error)
        }
    }
    
    private func setUpStateObserving() {
        appStateObserver.onWillEnterBackground = { [unowned self] in
            registerBackgroundTask()
        }
        
        appStateObserver.onWillEnterForeground = { [unowned self] in
            socket.connect()
        }
    }
    
    private func setUpNetworkMonitoring() {
        networkMonitor.onSatisfied = { [weak self] in
            self?.handleNetworkSatisfied()
        }
        networkMonitor.startMonitoring()
    }
    
    func registerBackgroundTask() {
        backgroundTaskRegistrar.register(name: "Finish Network Tasks") { [unowned self] in
            endBackgroundTask()
        }
    }
    
    func endBackgroundTask() {
        socket.disconnect()
    }
    
    func handleConnect() throws {
        throw Error.manualSocketConnectionForbidden
    }
    
    func handleDisconnect(closeCode: URLSessionWebSocketTask.CloseCode) throws {
        throw Error.manualSocketDisconnectionForbidden
    }
    
    func handleNetworkSatisfied() {
        if !isConnected {
            socket.connect()
        }
    }
}
