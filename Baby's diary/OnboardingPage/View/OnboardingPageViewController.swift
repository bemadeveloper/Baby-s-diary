//
//  OnboardingPageViewController.swift
//  Baby's diary
//
//  Created by Bema on 18/9/24.
//

import UIKit

class OnboardingPageViewController: UIViewController {
    
    private let onboardingPageView = OnboardingPageView()
    private let viewModel: OnboardingPageViewModel
    
    // MARK: - Inits
    
    init(viewModel: OnboardingPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    // MARK: - Setups
    
    private func setupUI() {
        view.addSubview(onboardingPageView)
        
        onboardingPageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onboardingPageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onboardingPageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingPageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingPageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindViewModel() {
        onboardingPageView.configure(with: viewModel.model)
    }



}
