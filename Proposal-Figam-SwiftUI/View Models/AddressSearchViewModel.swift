//
//  AddressSearchViewModel.swift
//  Proposal-Figam-SwiftUI
//
//  Created by mac on 05/06/23.
//

import Foundation
import MapKit
import Combine

class AddressSearchViewModel: NSObject, ObservableObject {
    @Published private(set) var results: Array<AddressResult> = []
    @Published var searchableText = ""
    private var cancellables: Set<AnyCancellable> = []
    
    override init() {
        super.init()
        subscribe()
    }
    
    deinit {
        cancellables.removeAll()
    }

    private lazy var localSearchCompleter: MKLocalSearchCompleter = {
        let completer = MKLocalSearchCompleter()
        completer.delegate = self
        return completer
    }()
    
    func subscribe() {
        $searchableText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.searchAddress(text)
            }
            .store(in: &cancellables)
    }
    
    func searchAddress(_ searchableText: String) {
        guard searchableText.isEmpty == false else { return }
        localSearchCompleter.queryFragment = searchableText
    }
    
    func clear() {
        results = []
        searchableText = ""
    }
}

extension AddressSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        Task { @MainActor in
            results = completer.results.map {
                AddressResult(title: $0.title, subtitle: $0.subtitle)
            }
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error)
    }
}
