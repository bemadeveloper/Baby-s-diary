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
        let model = OnboardingPageModel(imageName: "baby", title: "Hi there", description: "Lofbduer")
        let viewModel = OnboardingPageViewModel(model: model)
        let onboardingVC = OnboardingPageViewController(viewModel: viewModel)
        
        window = UIWindow(windowScene: windowScene)
        let viewController = onboardingVC
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

