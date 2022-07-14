
import Starscream
import Foundation

class ManualSocketConnectionHandler: SocketConnectionHandler {
    var isConnected: Bool = false
    
    var socket: WebSocket
    
    init(socket: WebSocket) {
        self.socket = socket
    }

    func handleConnect() throws {
        socket.connect()
    }
    
    func handleDisconnect(closeCode: URLSessionWebSocketTask.CloseCode) throws {
        socket.disconnect()
    }
}
