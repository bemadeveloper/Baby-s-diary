//
//  OnboardingView.swift
//  Baby's diary
//
//  Created by Bema on 24/9/24.
//

import Foundation
import UIKit

class OnboardingView: UIView {
    
    lazy var pageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - UI
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .gray
        pageControl.pageIndicatorTintColor = .systemGray6
        return pageControl
    }()
    
    lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.backgroundColor = .systemBlue
        nextButton.layer.cornerRadius = 10
        return nextButton
    }()
    
    lazy var skipButton: UIButton = {
        let skipButton = UIButton()
        skipButton.setTitle("Пропустить", for: .normal)
        skipButton.setTitleColor(.systemBlue, for: .normal)
        return skipButton
    }()
    
    // MARK: - Lyfecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupViews() {
        backgroundColor = .white
        
        addSubview(pageControl)
        addSubview(nextButton)
        addSubview(skipButton)
    }
    
    private func setupLayoutConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func addPageView(_ pageView: UIView) {
        addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: skipButton.bottomAnchor),
            pageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: pageControl.topAnchor)
        ])
    }
    
    func setButtonTitle(isLastPage: Bool = false) {
        nextButton.setTitle(isLastPage ? "Завершить" : "Дальше", for: .normal)
    }
    
    func updatePageControl(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
}
