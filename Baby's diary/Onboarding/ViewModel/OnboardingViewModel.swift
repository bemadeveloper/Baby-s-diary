//
//  OnboardingViewModel.swift
//  Baby's diary
//
//  Created by Bema on 22/9/24.
//

import Foundation

class OnboardingViewModel {
    
    let model: OnboardingModel
    private(set) var currentPageIndex: Int = 0
    
    var showAlert: ((String) -> ())?
    
    var isLastPage: Bool {
        currentPageIndex == model.pages.count - 1
    }
    
    init(model: OnboardingModel) {
        self.model = model
    }
    
    func numberOfPages() -> Int {
        return model.pages.count
    }
    
    func currentPage() -> OnboardingPageModel {
        return model.pages[currentPageIndex]
    }
    
    func goToTheNextPage() {
        if currentPageIndex < model.pages.count - 1 {
            currentPageIndex += 1
        }
    }
    
    func finishOnboarding() {
        UserDefaults.standard.setValue(true, forKey: UserDefaultsKeys.hasCompletedOnboarding)
    }
    
  
}
