//
//  PendingTransactionSchedulerProvider.swift
//  AlphaWallet
//
//  Created by Vladyslav Shepitko on 04.04.2022.
//

import Foundation
import Combine
import APIKit

protocol PendingTransactionSchedulerProviderDelegate: AnyObject {
    func didReceiveResponse(_ response: Swift.Result<PendingTransactionResponse, Covalent.CovalentError>, in provider: PendingTransactionSchedulerProvider)
}

final class PendingTransactionSchedulerProvider: SchedulerProvider {
    private let fetchPendingTransactionsQueue: OperationQueue

    var interval: TimeInterval { return AlphaConstants.Covalent.pendingTransactionUpdateInterval }
    var name: String { "PendingTransactionSchedulerProvider" }
    var operation: AnyPublisher<Void, SchedulerError> {
        return fetchPendingTransactionPublisher()
    }
    private let fetcher: PendingTransactionFetcher
    let transaction: TransactionInstance

    weak var delegate: PendingTransactionSchedulerProviderDelegate?

    init(fetcher: PendingTransactionFetcher, transaction: TransactionInstance, fetchPendingTransactionsQueue: OperationQueue) {
        self.fetcher = fetcher
        self.fetchPendingTransactionsQueue = fetchPendingTransactionsQueue
        self.transaction = transaction
    } 

    private func fetchPendingTransactionPublisher() -> AnyPublisher<Void, SchedulerError> {
        return fetcher.transaction(forServer: transaction.server, id: transaction.id)
            .subscribe(on: fetchPendingTransactionsQueue)
            .handleEvents(receiveOutput: { [weak self] pendingTransaction in
                guard let blockNumber = Int(pendingTransaction.blockNumber), blockNumber > 0  else { return }
                self?.didReceiveValue(pendingTransaction)
            }, receiveCompletion: { [weak self] result in
                guard case .failure(let error) = result else { return }
                self?.didReceiveError(error)
            })
            .map { _ in }
            .mapError { SchedulerError.covalentError(.sessionError($0)) }
            .eraseToAnyPublisher()
    }

    private func didReceiveValue(_ pendingTransaction: PendingTransactionResponse) {
        delegate?.didReceiveResponse(.success(pendingTransaction), in: self)
    }

    private func didReceiveError(_ e: SessionTaskError) {
        delegate?.didReceiveResponse(.failure(.sessionError(e)), in: self)
    }
}
