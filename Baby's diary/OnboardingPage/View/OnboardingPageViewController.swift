//
//  OnboardingPageViewController.swift
//  Baby's diary
//
//  Created by Bema on 18/9/24.
//

import UIKit

class OnboardingPageViewController: UIViewController {
    
    private let viewModel: OnboardingPageViewModel
    
    private var onboardingPageView: OnboardingPageView {
        return self.view as! OnboardingPageView
    }
    
    // MARK: - Inits
    
    init(viewModel: OnboardingPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    
    override func loadView() {
        self.view = OnboardingPageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setups
    
    private func setupUI() {
        view.backgroundColor = .white
        onboardingPageView.configure(with: viewModel)
    }
}
