//
//  OnboardingViewModel.swift
//  Baby's diary
//
//  Created by Bema on 22/9/24.
//

import Foundation

class OnboardingViewModel {
    
    let model: OnboardingModel
    var currentPageIndex = 0
    
    var showAlert: ((String) -> ())?
    
    
    init(model: OnboardingModel) {
        self.model = model
    }
    
    func numberOfPages() -> Int {
        return model.pages.count
    }
    
    func getPage(at index: Int) -> OnboardingPageModel {
        return model.pages[index]
    }
    
    func currentPage() -> OnboardingPageModel {
        return model.pages[currentPageIndex]
    }
    
    func goToTheNextPage() {
        if currentPageIndex < model.pages.count - 1 {
            currentPageIndex += 1
        }
    }
    
  
}
