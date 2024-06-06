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
    @Published private(set) var itemsArr: [LocalListModel] = []
    @Published var isErrorShown = false
    @Published var isShowLoader = false
    @Published var errorMessage = ""
    
    //Error and Response Handler
    private let responseSubject = PassthroughSubject<ListResponse, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    
    private let apiService: APIServiceType
    
    private var cancellables: [AnyCancellable] = []
    private let coredata = CoreDataManager()
    
    init(apiService: APIServiceType = APIService()) {
        self.apiService = apiService
        self.isShowLoader = true
        
        let arr = self.coredata.getItemList()
        
        if arr.count > 0 {
            self.isShowLoader = false
            itemsArr = arr
        }else{
            bindInputs()
            bindOutputs()
        }
    }
    
    private func bindInputs() {
                
        let request = ListRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                return apiService.response(from: request)
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
        
        let listStream = responseSubject.map{ error in
            self.isShowLoader = false
            
            for model in error.response.docs {
                self.coredata.saveItem(title: model.headline?.main, subDescription: model.abstract, date: model.pubDate?.convertedDate(), image: model.multimedia?[0].url)
            }
            
            return self.coredata.getItemList()
            
            //Short data based on date
            //return error.response.docs.sorted(by: { $0.pubDate?.convertedDate().compare($1.pubDate?.convertedDate() ?? Date()) == .orderedDescending })
        }.assign(to: \.itemsArr, on: self)
                
        let errorMessageStream = errorSubject
            .map { error -> String in
                switch error {
                case .responseError: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in
                self.isShowLoader = false
                return true }
            .assign(to: \.isErrorShown, on: self)
        
        
        cancellables += [
            listStream,
            errorStream,
            errorMessageStream,
        ]
    }
    
}
