
import Foundation
import Starscream

protocol SocketConnectionHandler {
    var isConnected: Bool { get }
    var socket: WebSocket {get}
    func handleConnect() throws
    func handleDisconnect(closeCode: URLSessionWebSocketTask.CloseCode) throws
}
