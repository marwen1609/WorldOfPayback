//
//  ErrorViewFactory.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation

protocol ErrorViewManufactoring {
    static func makeView(
        from message: String,
        isNetwork: Bool,
        retryActionClosure: @escaping () -> Void
    ) -> ErrorView
}
// MARK: - Factory
final class ErrorViewFactory: ErrorViewManufactoring {
    static func makeView(
        from message: String,
        isNetwork: Bool,
        retryActionClosure: @escaping () -> Void
    ) -> ErrorView{
        return self.init().configureView(
            from: message,
            isNetwork: isNetwork,
            retryActionClosure: retryActionClosure
        )
    }

    public func configureView(
        from message: String,
        isNetwork: Bool,
        retryActionClosure: @escaping () -> Void
    ) -> ErrorView {
        let viewModel = makeViewModel(
            from: message,
            isNetwork: isNetwork
        )
        let view = ErrorView(viewModel: viewModel, retryActionClosure: retryActionClosure)
        return view
    }

    private func makeViewModel(
        from message: String,
        isNetwork: Bool
    ) -> ErrorViewModel {
        return ErrorViewModel(
            message: message,
            isNetwork: isNetwork
        )
    }
}
