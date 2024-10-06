//
//  OnboardingViewController.swift
//  Baby's diary
//
//  Created by Bema on 24/9/24.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    private let viewModel: OnboardingViewModel
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    private lazy var mainView = OnboardingView()
    private var viewControllers: [UIViewController] = []
    
    // MARK: - Inits
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        
    }
    
    // MARK: - Setups
    
    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        mainView.pageControl.numberOfPages = viewModel.numberOfPages()
        mainView.pageControl.currentPage = 0
        
        setupPages()
        setupPageViewController()
        setupInteractions()
    }
    
    private func setupPageViewController() {
        addChild(pageViewController)
        mainView.addPageView(pageViewController.view)
        
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        if let firstViewController = viewControllers.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func setupPages() {
        viewControllers = viewModel.model.pages.map({ pageModel in
            let pageViewModel = OnboardingPageViewModel(model: pageModel)
            return OnboardingPageViewController(viewModel: pageViewModel)
        })
    }
    
    private func setupInteractions() {
        mainView.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        mainView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        mainView.pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    private func setupViewModel() {
        
    }
    
    // MARK: - Actions
    
    @objc private func skipButtonTapped() {
        
    }
    
    @objc private func nextButtonTapped() {
        viewModel.goToTheNextPage()
        let nextViewController = viewControllers[viewModel.currentPageIndex]
        pageViewController.setViewControllers([nextViewController], direction: .forward, animated: true)
        mainView.updatePageControl(currentPage: viewModel.currentPageIndex)
    }
    
    @objc private func pageControlTapped() {
        let currentPage = mainView.pageControl.currentPage
        let viewController = viewControllers[currentPage]
        
        let direction: UIPageViewController.NavigationDirection = currentPage > viewModel.currentPageIndex ? .forward : .reverse
        
        pageViewController.setViewControllers([viewController], direction: direction, animated: true)
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // Метод для получения предыдущего контроллера
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return viewControllers[currentIndex - 1]
    }
    
    // Метод для получения следующего контроллера
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex < viewControllers.count - 1 else {
            return nil
        }
        return viewControllers[currentIndex + 1]
    }
    
    // Обновляем PageControl после перелистывания
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleViewController = pageViewController.viewControllers?.first,
           let index = viewControllers.firstIndex(of: visibleViewController) {
            if let onboardingView = view as? OnboardingView {
                onboardingView.pageControl.currentPage = index
            }
        }
    }
}

