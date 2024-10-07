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
       
        let onboardingModel = OnboardingModel(pages: [OnboardingPageModel(imageName: "welcome", title: "Добро пожаловать!", description: "Наше приложение поможет вам улучшить качество сна вашего ребенка!"), OnboardingPageModel(imageName: "baby", title: "Сон", description: "С функцией отслеживания сна вы легко сможете добавлять и управлять временем сна вашего ребенка, записывая начало и окончание каждого периода. Это поможет следить за режимом и качеством сна, анализировать данные и улучшать привычки сна малыша."), OnboardingPageModel(imageName: "statistics", title: "Статистика", description: "С функцией статистики сна вы сможете отслеживать и анализировать режимы сна ребенка, записывая данные. Делитесь этой статистикой с экспертами для профессиональных рекомендаций."), OnboardingPageModel(imageName: "artificial_intelligence", title: "Консультация", description: "С функцией консультации ИИ вы получите персонализированные рекомендации на основе статистики сна вашего ребенка. Используя алгоритмы OpenAI, приложение анализирует данные и предлагает решения для улучшения качества сна.") ])
        
        window = UIWindow(windowScene: windowScene)
        let viewController = OnboardingViewController(viewModel: OnboardingViewModel(model: onboardingModel))
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

