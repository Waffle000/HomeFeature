//
//  File.swift
//  
//
//  Created by Enrico Maricar on 27/05/24.
//

import Foundation
import RxSwift
import Core

public class HomeViewModel : ObservableObject {
    @Published var gamesResult : [ResultData] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let disposeBag: DisposeBag = DisposeBag()
    private final let appRepository : AppRepository
    public init(appRepository : AppRepository) {
        self.appRepository = appRepository
    }
    
    public func loadGames() {
        let _ = print("Testing")
        isLoading = true
        appRepository.fetchGames()
            .subscribe(
                onNext: { [weak self] items in
                    let _ = print(items)
                    self?.gamesResult = items.results
                    self?.isLoading = false
                },
                onError: { [weak self] error in
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                },
                onCompleted: { [weak self] in
                    self?.isLoading = false
                }
            ).disposed(by: disposeBag)
    }
}
