//
//  SceneDelegate.swift
//  Baby's diary
//
//  Created by Bema on 18/9/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
       
        let onboardingModel = OnboardingModel(pages: [OnboardingPageModel(imageName: "baby", title: "Hi there!", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."), OnboardingPageModel(imageName: "baby", title: "Hi there!", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."), OnboardingPageModel(imageName: "baby", title: "Hi there!", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."), ])
        
        window = UIWindow(windowScene: windowScene)
        let viewController = OnboardingViewController(viewModel: OnboardingViewModel(model: onboardingModel))
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

