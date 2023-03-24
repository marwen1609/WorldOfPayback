//
//  BaseViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation
import Combine
import Network
class BaseViewModel: ObservableObject {
    @Published var networkStatus: NWPath.Status = .satisfied
    private let monitorQueue = DispatchQueue(label: "monitor")
    var subscriptions = Set<AnyCancellable>()

    init() {
        observeNetworkStatus()
    }
    deinit {
        NWPathMonitor().cancel()
    }
}


extension BaseViewModel: NetworkingProtocol {
    func observeNetworkStatus() {
       NWPathMonitor()
           .publisher(queue: monitorQueue)
           .receive(on: DispatchQueue.main)
           .sink { [weak self] status in
                self?.networkStatus = status
           }
           .store(in: &subscriptions)
   }
}
