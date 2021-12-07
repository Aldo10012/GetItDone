//
//  UIViewController-ext.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 12/6/21.
//

import UIKit

extension UIViewController {
    
    func configureNavigationBar(withTitle title: String, prefersLargeTitles: Bool,
        backgroundColor: UIColor = .blueZero, tintColor: UIColor = .white,
        userInerfaceStyle: UIUserInterfaceStyle = .dark
    ) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        appearance.backgroundColor = backgroundColor
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.title = title
        
        navigationController?.navigationBar.tintColor = tintColor
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = userInerfaceStyle
    }
    
}
