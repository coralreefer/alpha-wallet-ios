import Foundation
import WalletConnectUtils
import Starscream

protocol Dispatching {
    var isConnected: Bool { get }
    var onConnect: (()->())? {get set}
    var onDisconnect: (()->())? {get set}
    var onMessage: ((String) -> ())? {get set}
    func send(_ string: String, completion: @escaping (Error?)->())
    func connect() throws
    func disconnect(closeCode: URLSessionWebSocketTask.CloseCode) throws
}

final class Dispatcher: NSObject, Dispatching, WebSocketDelegate {
    var isConnected: Bool = false
    var onConnect: (() -> ())?
    var onDisconnect: (() -> ())?
    var onMessage: ((String) -> ())?
    private var textFramesQueue = Queue<String>()
    private let logger: ConsoleLogging
    var socket: WebSocket
    var socketConnectionHandler: SocketConnectionHandler
    
    init(socket: WebSocket,
         socketConnectionHandler: SocketConnectionHandler,
         logger: ConsoleLogging) {
        self.socket = socket
        self.logger = logger
        self.socketConnectionHandler = socketConnectionHandler
        super.init()
        self.socket.delegate = self
        setUpWebSocketSession()
        //setUpSocketConnectionObserving()
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
    
    func send(_ string: String, completion: @escaping (Error?) -> Void) {
        //TODO - add policy for retry and "single try"
         if isConnected {
            self.socket.write(string: string) {
                completion(nil)
            }
            //TODO - enqueue     if fails
        } else {
            completion(NetworkError.webSocketNotConnected)
//            textFramesQueue.enqueue(string)
        }
    }
    
    func connect() throws {
        try socketConnectionHandler.handleConnect()
    }
    
    func disconnect(closeCode: URLSessionWebSocketTask.CloseCode) throws {
        try socketConnectionHandler.handleDisconnect(closeCode: closeCode)
    }
    
    private func setUpWebSocketSession() {
//        socket.onText = { [weak self] in
//            self?.onMessage?($0)
//        }
        socket.onEvent = { event in
            switch event {
                // handle events just like above..
            case .text(let msg):
                self.onMessage?(msg)
            case . connected(_):
                self.dequeuePendingTextFrames()
                self.onConnect?()
            case .disconnected(_):
                self.onDisconnect?()
            default:
                break
                    
            }
        }
    }
    
//    private func setUpSocketConnectionObserving() {
//        socket.onConnect = { [weak self] in
//            self?.dequeuePendingTextFrames()
//            self?.onConnect?()
//        }
//        socket.onDisconnect = { [weak self] error in
//            self?.onDisconnect?()
//        }
//    }
    
    private func dequeuePendingTextFrames() {
        while let frame = textFramesQueue.dequeue() {
            send(frame) { error in
                if let error = error {
                    print(error)
                }
            }
        }
    }
}
