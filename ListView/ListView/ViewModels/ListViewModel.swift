//
//  ListViewModel.swift
//  ListView
//
//  Created by Dixit Mac New on 05/06/24.
//

import Foundation
import SwiftUI
import Combine

final class ListViewModel: ObservableObject, UnidirectionalDataFlowType {
    func apply(_ input: Input) {
        switch input {
        case .onAppear: onAppearSubject.send(())
        }
    }
    
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    
    typealias InputType = Input
    
    // MARK: Input
    enum Input {
        case onAppear
    }
    
    // MARK: Output
    @Published private(set) var itemsArr: [ListData] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    
    //Error and Response Handler
    private let responseSubject = PassthroughSubject<ListResponse, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    
    private let apiService: APIServiceType
    //private let trackerService: TrackerType
   // private let experimentService: ExperimentServiceType
    
    private var cancellables: [AnyCancellable] = []
    
    init(apiService: APIServiceType = APIService()) {
        self.apiService = apiService

        
        bindInputs()
        bindOutputs()
    }
    
    private func bindInputs() {
        let request = ListRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(from: request)
                    .catch { [weak self] error -> Empty<ListResponse, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                }
        }
        
        let responseStream = responsePublisher
            .share()
            .subscribe(responseSubject)
        
        cancellables += [
            responseStream,
        ]
    }
    
    private func bindOutputs() {
        let listStream = responseSubject
            .map { $0.response.docs }
            .assign(to: \.itemsArr, on: self)
        
        let errorMessageStream = errorSubject
            .map { error -> String in
                switch error {
                case .responseError: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
        
        
        cancellables += [
            listStream,
            errorStream,
            errorMessageStream,
        ]
    }
    
}
